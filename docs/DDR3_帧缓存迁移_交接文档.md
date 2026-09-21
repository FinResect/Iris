# DDR3 帧缓存迁移 — 交接文档

> 面向下一个接手此工程的 AI/工程师。**本文档只描述现状、结论与下一步计划，请勿把文档里的“计划”当成已实现。**
> 最近一次编辑时间：2026-09-21。

---

## 0. 一句话现状

摄像头 1920×1080 → 8×抽样成 240×135 灰度 → **官方 Efinix `efx_ddr3_axi` 软控制器** → 显示 8×放大回 1080p。
**DDR 链路已基本打通**：整幅画面能看到，但仍有**散布的块状错位**；且需要在**写侧用 BRAM FIFO 暂存（方案 A）**以避免 FF 资源溢出。方案 A **尚未实现**。

---

## 1. 目标

- 用**官方 Efinix DDR3 软控制器**替换原来加密、行为诡异的 Elitestek 控制器。
- 打通：摄像头 → DDR3 帧缓存 → HDMI 1080p 显示。
- 消除画面上的块状错位。

---

## 2. 硬件与工程

| 项 | 值 |
|---|---|
| 板卡 | Ti60F225_DemoBoard_v4 |
| DDR3 颗粒 | 丝印 `D9PSL` → **MT41J128M16JT-125**，2Gb、x16、row=14 / col=10 / bank=3，DDR3-800（400MHz） |
| DDR3 引脚 | bank 3B/4A/4B，1.5V SSTL（`iris_ws.pinout.csv` 已核对） |
| 器件/时序模型 | Ti60F225 / I3 |
| 工程 | `iris_ws/`（Efinity 2026.1.132.4.5） |
| 顶层 | `iris_ws/src/top.v` |
| 编译脚本 | `.script/build-iris`（map → interface → pnr → pgm，并 patch `iris_ws.pt.sdc` 的 CLK_25M/gpio_clk_27m 周期） |

---

## 3. 已完成的迁移（**已实现并编译通过**）

### 3.1 引入官方 IP
生成物在 `/home/fr/Program/FPGA/linshi/ip/efx_ddr3_axi/`，已拷入：
- `iris_ws/src/ddr/efx_ddr3/efx_ddr3_axi.sv`（**单文件、自包含**：顶层 `efx_ddr3_axi` 明文 + UUID 宏解析的控制器/fifo 子模块）
- `ddr3_controller.vh`（`ROW=14/COL=10/BANK=3/DDR3_MODE=2`(AXI4)/`WFIFO_WIDTH=128`/`tRL=5`/`tWL=5`）
- `ddr3_controller.bin`（微码 ROM，`RAM_FILE`）
- `ddr3_device_ID.vh`

`iris_ws/iris_ws.xml` 已加入：
- `src/ddr/efx_ddr3/efx_ddr3_axi.sv`、`src/ddr/axi_atype_bridge.v`、`src/ddr/ddr3_gray_frame_buffer.v`
- synthesis include 路径 `src/ddr/efx_ddr3`
- misc 文件 `src/ddr/efx_ddr3/ddr3_controller.bin`、`ddr3_controller.vh`

### 3.2 官方控制器的关键接口（5.17，AXI 变体）
- 时钟：`clk`(AXI 域=100MHz), `core_clk`(200MHz), `tdqss_clk`/`tac_clk`/`twd_clk`(400MHz)
- `reset_n`(in), `reset`(out)
- DDR 引脚：`cs/ras/cas/we/cke/addr[15:0]/ba[2:0]/odt/o_dm_hi/o_dm_lo/i_dq_hi/i_dq_lo/o_dq_hi/o_dq_lo/o_dq_oe/i_dqs_hi/i_dqs_lo/i_dqs_n_hi/i_dqs_n_lo/o_dqs_hi/o_dqs_lo/o_dqs_n_hi/o_dqs_n_lo/o_dqs_oe/o_dqs_n_oe`
- 校准：`shift[2:0]/shift_sel[4:0]/shift_ena/cal_ena/cal_done/cal_pass/cal_shift_val[2:0]/cal_fail_log[7:0]`
- **自定义 AXI**（非标准 AXI4）：**AW/AR 合并**到一个地址通道，用 `axi_atype` 区分（1=写,0=读）：
  `axi_aid/aaddr/alen/asize/aburst/alock/avalid/aready/atype`；另有 `axi_wid/wdata/wstrb/wlast/wvalid/wready`、`axi_rid/rdata/rlast/rvalid/rready/rresp`、`axi_bid/bresp/bvalid/bready`

### 3.3 peri（`iris_ws/iris_ws.peri.xml`）
- 用 5.17 版 Ti180 peri 的 I/O 配置，**把引脚换成我们板子的**：`ddr_addr[15:0]/ddr_ba/ddr_cas/ddr_cke/ddr_cs/ddr_odt/ddr_ras/ddr_we/ddr_dm/ddr_dq/ddr_dqs/ddr_clk_p/ddr_reset`，时钟 `ddr_tdqss_clk/ddr_tac_clk/ddr_twd_clk/ddr_core_clk`。
- 新增 **`DDR3_PLL`（在 PLL_TR0，方案乙）**：tdqss/tac/twd=400M、core=200M、反馈 `ddr_pll_fb`(100M)，gen_pin `pll_shift/pll_shift_sel/pll_shift_ena`。
- 保留系统 `pll_ddr_core`(PLL_BL0) 产 `core_clk`=100M（作 AXI 时钟）；`pll_hdmi`(BR0)、`pll_mipi`(TL0) 不动。
- **注意**：`gpio_info` 的 XSD 顺序必须是 **所有 `comp_gpio` → `global_unused_config` → 所有 `bus`**；否则 interface 报 “Unexpected child”。

### 3.4 AXI 适配桥（`iris_ws/src/ddr/axi_atype_bridge.v`，独立模块）
- 把帧缓存的标准 AXI4（AW/AR 分离）**分时复用**到 IP 的单一地址通道并置 `axi_atype`。
- 状态机：IDLE → (AW|AR) → 等 `aready` → 拉高对应 ready、等主方撤 valid → IDLE。
- `W/B/R` 通道在 `top.v` 直连。

### 3.5 top.v
- 例化 `efx_ddr3_axi`，接时钟/引脚/`shift*`/`cal_ena=1`；`cal_done` → 帧缓存 `ddr_ready`。
- 帧缓存 AXI4 → `axi_atype_bridge` → `efx_ddr3_axi`。
- **已删除**旧 Elitestek：`src/ddr/ddr3_controller/`、`src/ddr/ddr3_wrapper.v`。

### 3.6 帧缓存（`iris_ws/src/ddr/ddr3_gray_frame_buffer.v`）
- 相机侧异步 FIFO（自研，存 `{bank[1],addr[16],data[8]}`）跨到 `axi_clk`。
- 相机 `cam_capture`：**换 bank 已改为按 hsync 满一帧（`line_idx==(IMG_H<<DECIM_LOG2)-1`=1079）触发，不依赖 vsync**；vsync 只置 `vsync_seen`。
- 写/读都用 **多拍 INCR burst**（详见第 5 节，当前是 9 拍的**未完成版本**）。
- cache：`true_dual_port_ram` 128bit×4096（两 bank，各 2048 字），显示侧按 `字节=addr[3:0]`、`字=addr>>4` 读取。
- 已加调试输出：`dbg_rd_busy/dbg_valid0/dbg_valid1/dbg_bank_diff/dbg_wr_abort/dbg_wr_burst/dbg_rd_burst/dbg_rd_done`。

---

## 4. 调试历程与已验证结论（重要，避免走回头路）

1. **MIPI 正常**：连续探针显示 vsync 与像素流持续（`cam_data_seen/vsync_seen`，以及连续活动灯）→ 问题不在 MIPI。
2. **单拍 AXI 是问题之一**：最开始用 `awlen/arlen=0`，只有第一笔事务成功，画面静止。改成多拍后**整幅画面出现**。
3. **官方参考主机 `memory_checker_axi` 全程用多拍**（`alen=ALEN`，默认 23 → 24 拍），印证多拍方向。
4. **官方写侧用 BRAM FIFO 暂存**：`07 demo` 的 `ddr_wr_buffer.v` 用 `DC_FIFO`（128bit×1024，BRAM）流式送 `wdata`，`BURST_LEN=15`（16 拍），并有 first/last burst 对齐。**它不在 FF 里攒一整组 burst**。
5. **FF 缓冲导致资源溢出**：把 burst 提到 24 拍、用 3072 位 FF `wr_buf` 后，PNR 报
   `Not enough physical locations ... capacity=60800 usage=61941` → **24 拍 FF 放不下**。8/9 拍 FF 可以。
6. **当前症状**：整幅画面可见，但**有散布的块状图像元素**；怀疑来自“跨帧组被丢弃（`dbg_wr_abort`）”或“DDR 偶发误码”。为此加了 `dbg_wr_abort` 等探针。

---

## 5. 当前代码的**未完成状态**（请以此为准）

`ddr3_gray_frame_buffer.v` 现在处于**临时/中间态**：
- 写侧：`WR_BEATS=9`、`WR_PIXS=144`，用**扁平 FF `wr_buf`（1152 位）**逐字节写入；起始条件已改为**帧首 `fifo_rd_data[23:8]==0`**；`WR_COLLECT` 连续性检查不通过则 `dbg_wr_abort<=1` 并回 `WR_IDLE`。
- 读侧：`RD_BEATS=9`、`RD_BURSTS=225`，R 拍直接写 cache。
- `top.v` 的 LED 目前是探针映射（非生产）：
  - `led[0]=fb_wr_abort_seen`(sticky)
  - `led[1]=fb_wr_burst_cnt[10]`
  - `led[2]=fb_rd_burst_cnt[10]`
  - `led[3]=fb_rd_done_cnt[4]`
- `TEST_PATTERN=1'b0`（走真实相机；`tst_*` 会被优化掉）。
- 生产 LED 映射（收尾时恢复）：`led[0]=ddr_cal_done, led[1]=txd, led[2]=sc431hai_done, led[3]=cam_frame_valid`。

---

## 6. 下一步：方案 A（**尚未实现**，请按此实现）

### 6.1 写侧：用 128-bit BRAM FIFO 暂存 burst（对齐官方）
在 `ddr3_gray_frame_buffer.v` 内：
- 参数：`WR_BEATS=16`（`awlen=15`）。
- **删除** FF `wr_buf`；保留 128-bit `wr_pack`（16 像素/拍）。
- 例化一个 **`DC_FIFO`**（工程已有 `src/uart/DC_FIFO_v3p7.v`，模块名 `DC_FIFO`）作暂存：
  - `FIFO_MODE="Normal"`、`DATA_WIDTH=128`、`FIFO_DEPTH=32`，`WrClk=RdClk=axi_clk`，`Reset=~rst_n`。
- 写 FSM：
  - `WR_IDLE`：`ddr_ready && !fifo_empty && fifo_rd_data[23:8]==0`（帧首）→ 锁存 `wr_first_bank/wr_first_addr`，`wr_beat=0` → `WR_FILL`。
  - `WR_FILL`：从相机像素 FIFO 取像素，每 16 个组成 1 拍，`WrEn/WrData` 写入 `DC_FIFO`；写满 16 拍 → `WR_AW`。（保留连续性检查；不连续脉冲 `dbg_wr_abort` 并重新找帧首）
  - `WR_AW`：`awaddr=(bank?BANK_BYTES:0)+wr_first_addr`、`awlen=15`、`awvalid`；`awready` → `WR_W`。
  - `WR_W`：用 `RdEn/RdEmpty/DataVal/RdData` 从 `DC_FIFO` 流式取 16 拍 → `wdata/wvalid`，第 16 拍 `wlast=1`；完成 → `WR_B`。
  - `WR_B`：`bvalid` → `WR_IDLE`。
- 预期：FF 用量下降（-~1000），PNR 从 61941 回到 <60800。

### 6.2 读侧：16 拍 burst（无缓冲）
- `RD_BEATS=16`（`rd_beat [4:0]`）、`arlen=15`；`RD_BURSTS=ceil(32400/256)=127`。
- cache 占 `127×16=2032` 字；`cache_waddr = (bank?2048:0) + rd_burst*16 + rd_beat`，最大 `2048+126*16+15=4079 < 4096`（`cache_waddr` 12bit）。
- 帧首/对齐逻辑不变；R 拍直接写 cache。

### 6.3 探针
- 保留 `dbg_wr_abort/dbg_wr_burst/dbg_rd_burst/dbg_rd_done` 及 `top.v` 的计数灯；用于确认是否还有“丢组”。

### 6.4 备选（若 16 拍仍超资源）
- 降为 12 或 9 拍（写侧 BRAM 后基本都能放下）；或把读侧也走 BRAM 暂存。
- 也可改用“**流式写**”：不发大缓冲，直接从相机像素 FIFO 边取边发 W 拍（发 AW 后逐拍凑 16 像素）——资源最省，但需确认 IP 允许 W 拍晚到。

---

## 7. 验证方法

1. 编译：`.script/build-iris`；确认 `map/interface/pnr/pgm` 全 PASS，且 PNR **不再报** `Not enough physical locations`。
2. 烧录：`.script/sync-iris jtag`（或 `sync-iris`）。
3. 观察：
   - 屏幕：应出现**稳定、随手动变化**的相机灰度图，块状错位应减少/消失。
   - 探针灯（当前映射）：`led[0]`（曾丢组）、`led[1]/[2]/[3]` 计数应闪。
4. 确认无问题后，把 `top.v` 的 LED 恢复为生产映射（见 5 节）。

---

## 8. 注意事项 / 已知坑

- **`efx_ddr3_soft_controller` 顶层以外的子模块名被加密**，不能手工 vendor；必须用 IPM 生成（本次生成物即 `linshi/ip/efx_ddr3_axi`）。
- peri 的 `gpio_info` 顺序：`comp_gpio*` → `global_unused_config` → `bus*`（已踩坑）。
- `efx_ddr3_axi` 的 `o_dqs_n_hi/lo` 按官方示例**留空**即可；`i_dqs_n_*` 接 top 端口（peri 未映射，官方亦然）。
- PLL 资源：4 个 PLL 已全用（TR0=DDR3_PLL、BL0=系统、BR0=HDMI、TL0=MIPI）。
- 传感器分辨率寄存器（`sc431hai_i2c_rom.v`）已是 1920×1080（`0x3208/09=0x0780`、`0x320a/0b=0x0438`），**不是**块状错位的来源。
- `cal_pass`/`cal_fail_log` 是可用的校准可观测量（当前未引到灯，需要时可加）。
- 之前的“块状错位”也可能来自 **DDR 偶发误码**（800Mbps 时序余量）。若方案 A 后仍散布错误，方向转向：核对 DQ/DM/DQS 字节分组/顺序、必要时降频验证。

---

## 9. 关键文件索引

| 文件 | 作用 |
|---|---|
| `iris_ws/src/top.v` | 顶层；HDMI/MIPI/UART/camera/DDR 实例与探针灯 |
| `iris_ws/src/ddr/ddr3_gray_frame_buffer.v` | DDR3 灰度帧缓存（**方案 A 主要改这里**） |
| `iris_ws/src/ddr/axi_atype_bridge.v` | AXI4 → 单地址通道(AW/AR 合并) 适配 |
| `iris_ws/src/ddr/efx_ddr3/efx_ddr3_axi.sv` | 官方软控制器（单文件） |
| `iris_ws/iris_ws.peri.xml` | DDR3 引脚 + DDR3_PLL（TR0） |
| `iris_ws/iris_ws.xml` | 设计文件/include/misc 表 |
| `iris_ws/src/mipi/cam_capture.v` | 相机抽样 + hsync 帧计数换 bank |
| `iris_ws/src/uart/DC_FIFO_v3p7.v` | 可复用的 128-bit BRAM FIFO（`DC_FIFO`） |
| `linshi/ip/efx_ddr3_axi/` | IPM 生成的官方 IP（settings.json/vh/bin/示例） |
| `Ti60F225_DemoBoard_v4/07_.../rtl/frame_buffer/` | 官方相机→DDR 参考（`ddr_buffer.v`/`ddr_wr_buffer.v`/`DC_FIFO`） |

---

## 10. 交接清单（给下一个 AI）

- [ ] 按第 6 节实现方案 A（写侧 `DC_FIFO` 暂存 + 16 拍；读侧 16 拍）。
- [ ] 编译并确认 PNR 通过、资源在容量内。
- [ ] 上板验证画面与 `dbg_wr_abort` 灯；必要时按 6.4 调整 burst 拍数。
- [ ] 若无块状错位，恢复生产 LED 映射并移除临时探针/调试输出。
- [ ] 若仍有散布块，按第 8 节最后一条转向核查 DDR 数据完整性（分组/降频）。
