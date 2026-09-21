# 摄像头接入（MIPI CSI-2 → HDMI）纪要

> 记录 SC431HAI 摄像头经 J4/MIPI 接入并把画面显示到 HDMI 的过程、关键坑与当前实现。
> 相关：`SC431HAI_硬件设计指南.md`、`Ti60F225_DemoBoard_v4_用户手册.md`。

## 1. 结果

- 摄像头画面已在 HDMI 实时显示：**240×135 灰度**，最近邻放大 **8×** 铺满 1080p60。
- 上电后先显示彩条，`cam_frame_valid` 置位后自动切到摄像头画面。
- I²C 初始化、MIPI CSI-2 解析、帧缓存、显示链路全部在板验证通过。

## 2. 硬件前提

| 项目 | 值 |
|---|---|
| 摄像头接口 | **J4**（Sensor FPC），另一路 J5 不用 |
| MIPI 时钟 | `MCP/MCN` → `GPIOT_PN_09` |
| MIPI 数据 | `MD0→GPIOT_PN_07`、`MD1→GPIOT_PN_10`、`MD2→GPIOT_PN_06`、`MD3→GPIOT_PN_11` |
| I²C | `SCL→GPIOR_20`、`SDA→GPIOR_18`（3.3V，weak pullup） |
| 复位 | `XSHUTDN→GPIOR_16`（3.3V） |
| Bank 电压 | **J2/J3 必须选 `VCC_1V2`**（MIPI 在 Bank 2A/2B） |
| 摄像头时钟 | EXTCLK 由子卡自带晶振提供（J4 不提供） |

## 3. 核心坑：CSI RX IP 版本（最重要）

**Efinix `efx_csi2_rx` 新版本（如 2026.1 自带的 5.17）解析不出 `vsync`，会导致有像素数据但没有帧同步。**

- 症状：I²C 正常（能读回 sensor ID）、`pixel_data_valid` 有、`hsync` 有，但 `vsync_vc0` 始终为低。
- 后果：行计数永不归零 → 帧缓存地址错乱 → 屏幕**雪花**。
- 解决：**改用 `efx_csi2_rx` 5.9**（取自官方 07 demo `Ti60f225_csi2dsi_sc431hai_v3.4`，Efinity 2024.2 生成的加密 IP），放在 `iris_ws/ip/csi_rx_59/`，模块名 `csi_rx_controller`。
- 佐证：官方 10 demo 的手册明确写了「CSI RX IP 未升级（升级后 vs 解析不出来）」，它一直用 5.6。

> 5.9 与 5.17 的顶层端口差异：5.9 **没有 `fifo_rd_reset`**，因此数据 lane 的 `RST` 直接接 `1'b0`（与 07 demo 一致）。

### 定位手法（LED 探针）

上板用 4 个 LED 分别指示 `sc431hai_done`、`sensor_id_ok`、`vsync_seen`、`data_seen`，可一次锁定问题层：
- `sensor_id_ok` 灭 → I²C 没通到 sensor；
- `sensor_id_ok` 亮、`vsync_seen` 灭、`data_seen` 亮 → **正是 IP 版本坑**（换 5.9）；
- `vsync`、`data` 都亮 → 数据 OK，问题在显示/采样。

## 4. 目录约定

```
iris_ws/
├── ip/csi_rx_59/            # efx_csi2_rx 5.9 生成物（csi_rx_controller）
├── src/mipi/                # MIPI + 器件相关
│   ├── mipi_rx.v            # 例化 csi_rx_controller，接 D-PHY，输出像素流
│   ├── cam_capture.v        # RAW10 解包 + 8×8 抽样 + 灰度，写帧缓存
│   ├── sc431hai_i2c_rom.v   # 161 项寄存器表（器件相关）
│   └── sc431hai_init.v      # 上电复位时序 + I²C 初始化 + ID 校验 + 预留 CPU 口
├── src/i2c/                 # 通用 I²C（OpenCores 核 + 16/8 字节层 + 序列引擎 + subsystem）
├── src/video/               # 通用视频件
│   ├── true_dual_port_ram.v
│   ├── frame_buf.v          # 双 bank 帧缓存（写=CSI 域，读=HDMI 域）
│   └── display_ctrl.v       # 1080p60 时序 + 8× 最近邻放大 + RGB888
└── src/hdmi/, src/uart/     # L0 保留：彩条/DVI 编码、UART 回环
```

## 5. 视频链路

```
J4 → MIPI D-PHY(Bank2A/2B,1.2V) → efx_csi2_rx 5.9
   → cam_capture   RAW10(4px/clk) 每 8×8 抽 1 点取高 8 位作灰度 → 240×135
   → frame_buf     双 bank 真双口 BRAM（写=cam 50MHz，读=HDMI 148.5MHz）
   → display_ctrl  1080p60 时序 + 8× 最近邻放大 → RGB888
   → dvi_encoder → HDMI
```
- 时钟：`pll_mipi`(PLL_TL0) 产生 `mipi_clk`=100MHz（CSI 核）、`mipi_pixel_clk`=50MHz（像素域）。
- 兜底：`cam_frame_valid` 之前显示 `color_bar_rgb` 彩条。

## 6. I²C

- 通用层在 `src/i2c`（器件无关，含 auto ROM 序列 / cpu 寄存器口二选一 mux）。
- SC431HAI：7-bit 地址 `0x30`（8-bit 写 `0x60`），16-bit 寄存器地址 + 8-bit 数据，**161 项**初始化表。
- 速率：`CLK_DIV=16'h00A9` @27MHz ≈ **40kHz**（与官方一致；之前 211kHz 偏快）。
- 健康检查：写表完成后自动读 `0x3107/0x3108`，比对 **`0xCD6B`**，输出 `sensor_id_ok`。
- 复位：按官方 07/10 demo，**运行中 `cam_rst=0`**（`CAM_RST_ACTIVE_HIGH` 参数可切）。

## 7. 构建与烧录

```bash
.script/setup-env        # 首次
.script/build-iris       # map/interface/pnr/pgm → outflow/iris_ws.bit
.script/sync-iris        # 默认 jtag_bridge（写 flash，掉电保持）
.script/sync-iris jtag   # 写 SRAM（快，掉电丢失）
```

> pnr 日志里的 `No SDC file found ... default 1 ns` 是构建脚本旧有现象；按各时钟的真实 Fmax 余量都很大，可忽略。

## 8. 后续

- 彩色：`cam_capture` 里加 2×2 Bayer→RGB565，帧缓存改 16bit。
- 全分辨率：引入 DDR3 帧缓存（参考 07/10 demo 的 `ddr3_top` + `frame_buffer` + `debayer`）。
- RISC-V 控制：`sc431hai_init` / `i2c_subsystem` 已预留 `cpu_mode + cpu_addr/wdata/we/stb/rdata/ack` 寄存器口，后续接 APB/AXI4-Lite 适配器即可。
