# Ti60F225 DemoBoard v4 详细说明文档

> 本文档基于 `Ti60F225_DemoBoard_v4/` 目录下的原理图、软硬件设计说明 PDF、子卡原理图、驱动安装包以及全部 13 个工程的实际 RTL/工程文件整理而成。
> 文档定位：开发板硬件说明 + 全部官方 Demo 工程说明 + 开发/下载/调试流程 + 常见问题。
>
> 相关原始资料（位于 `Ti60F225_DemoBoard_v4/`）：
> - `TI60F225I3-V4 DEMO板软硬件设计说明-260813-1.pdf`（软硬件设计说明，本文主要来源）
> - `Ti60 Data Sheet DSTi60-v3.8 (2026-03, Elitestek)`（Ti60 芯片权威规格，§2.1/2.2/2.4/2.5/2.6 的芯片级参数来源）
> - `Ti60F225A_V4_SCH.pdf`（主板原理图，13 页）
> - `TI60F225_DEMOBOARD-装配图.pdf`（装配/位号图）
> - `子卡原理图/`（CSI2QSE_MIPI、MIPI DSI subcard、MIPI DSI Driver、QSE转排针）
> - `驱动安装及说明/`（下载器驱动与说明）
> - `软件安装包/jre-8u381-windows-x64.exe`（Efinity/RISC-V IDE 所需的 Java8）

---

## 目录

- [一、开发板概述](#一开发板概述)
- [二、硬件说明](#二硬件说明)
  - [2.1 FPGA（Ti60F225）](#21-fpgati60f225)
  - [2.2 电源](#22-电源)
  - [2.3 Bank 划分与电平选择](#23-bank-划分与电平选择)
  - [2.4 晶振与 PLL](#24-晶振与-pll)
  - [2.5 上电时序与复位](#25-上电时序与复位)
  - [2.6 JTAG 下载与编程方式](#26-jtag-下载与编程方式)
  - [2.7 三速以太网 GE（YT8531SC/SH）](#27-三速以太网-geyt8531scsh)
  - [2.8 HDMI](#28-hdmi)
  - [2.9 DDR3](#29-ddr3)
  - [2.10 预留 IO / QSE 扩展口 J7](#210-预留-io--qse-扩展口-j7)
  - [2.11 MIPI 接口](#211-mipi-接口)
  - [2.12 Flash](#212-flash)
  - [2.13 用户按键与 LED](#213-用户按键与-led)
  - [2.14 加载模式验证管脚 J6](#214-加载模式验证管脚-j6)
  - [2.15 UART](#215-uart)
  - [2.16 管脚分配速查汇总](#216-管脚分配速查汇总)
- [三、目录结构与配套资料](#三目录结构与配套资料)
- [四、软件 / Demo 工程说明](#四软件--demo-工程说明)
  - [4.1 01_Ti60F225_Key_led_osc_demo](#41-01_ti60f225_key_led_osc_demo)
  - [4.2 02_Ti60F225_hdmi_demo（HDMI RX→TX 环回）](#42-02_ti60f225_hdmi_demohdmi-rxtx-环回)
  - [4.3 03_hdmi_tx_demo（HDMI 彩条发生）](#43-03_hdmi_tx_demohdmi-彩条发生)
  - [4.4 04_Ti60f225_GE_demo（UDP 千兆以太网）](#44-04_ti60f225_ge_demoudp-千兆以太网)
  - [4.5 05_Ti60F225_lvds_loop_demo（1.5Gbps LVDS 自环）](#45-05_ti60f225_lvds_loop_demo15gbps-lvds-自环)
  - [4.6 07_Ti60F225_MIPI_C2D_Demo（SC431HAI → 双 MIPI DSI）](#46-07_ti60f225_mipi_c2d_demosc431hai--双-mipi-dsi)
  - [4.7 08_ti60f225_soc_demo（RISC-V Sapphire SoC）](#47-08_ti60f225_soc_demorisc-v-sapphire-soc)
  - [4.8 09_Ti60F225_hdmi2dsi_Demo（HDMI → MIPI DSI）](#48-09_ti60f225_hdmi2dsi_demohdmi--mipi-dsi)
  - [4.9 10_Ti60f225_sc431hai2hdmi_demo（SC431HAI → HDMI/DSI）](#49-10_ti60f225_sc431hai2hdmi_demosc431hai--hdmidi)
  - [4.10 11_TI60F225_MIPI_CSI_loop_demo（CSI-2 自环）](#410-11_ti60f225_mipi_csi_loop_democsi-2-自环)
  - [4.11 12_mipi_dsi_loop_demo（DSI 自环）](#411-12_mipi_dsi_loop_demodsi-自环)
  - [4.12 13_carrychain_prj_demo（进位链延时测量）](#412-13_carrychain_prj_demo进位链延时测量)
  - [4.13 17_Ti60F225_uart_demo（UART 回环）](#413-17_ti60f225_uart_demouart-回环)
- [五、通用开发流程](#五通用开发流程)
- [六、工具版本与工程属性汇总](#六工具版本与工程属性汇总)
- [七、常见问题与注意事项](#七常见问题与注意事项)
- [附录 A：顶层工程文件与顶层模块速查](#附录-a顶层工程文件与顶层模块速查)
- [附录 B：资料与文件清单](#附录-b资料与文件清单)

---

## 一、开发板概述

Ti60F225I3-V4 DEMO 板（也称 Ti60F255I3-DK / Ti60F225-DK）是以 **易灵思（Efinix）Titanium 系列 Ti60F225I3** FPGA 为核心的高速开发验证平台。

主要板载资源：

| 资源 | 型号 / 规格 | 说明 |
|---|---|---|
| FPGA | Efinix Ti60F225I3 | Titanium 16nm，60K 逻辑单元，10mm×10mm，支持 1.5Gbps LVDS 与 1.5G MIPI D-PHY |
| 以太网 | YT8531SC（原理图标注 YT8531SH） | 三速 GE（10/100/1000M），RGMII 接口，RJ45 带变压器 |
| HDMI | 通过 FPGA 高速 IO 实现 | HDMI 接收 + 发送，支持到 1080p60 |
| DDR3 | MT41J128M16JT-125 | 16 位，2Gb（256MB），最高 800Mbps（部分文档写 1600Mbps，以实际控制器支持为准） |
| Flash | GD25LQ64 | 8MB SPI NOR，用于存储 FPGA 镜像及用户数据 |
| MIPI | 2 路 FPC（J4/J5）+ QSE 扩展口 J7 | 用于连接 MIPI 屏 / Sensor |
| 下载器 | FT4232HL（板载） | 一根 Type-C USB 即可完成供电、下载、UART |
| 晶振 | 25M / 27M / 50M 有源差分晶振 | 分别接 GCLK、GCLK、PLL 输入 |
| 按键/LED | 4 个按键 + 8 个 LED | 用户交互 |
| 扩展 | J7（QSE 40pin） | 3 组 MIPI（每组 4lane）或 15 对 LVDS，另可转排针/FPC 子卡 |
| 电源 | 单 Type-C 5V 输入 | 板载多路 LDO/DCDC 产生 0.95V/1.2V/1.5V/1.8V/3.3V |

板载器件分布见装配图 `TI60F225_DEMOBOARD-装配图.pdf`。

---

## 二、硬件说明

### 2.1 FPGA（Ti60F225）

- 采用 Efinix（易灵思/Elitestek）Titanium 系列 **Ti60F225I3**，16nm 工艺，超低功耗/超小封装/高性能。
- **I3 速度等级**：工业级（TJ = −40~100°C），核压 VCC/VCCA = **0.95V**（0.92~0.98V），LVDS 半速率最高 **1.5Gbps**、MIPI lane 最高 **1.5Gbps**、DSP/BRAM/全局时钟最高 **1000MHz**。
- 封装 225-ball FBGA，10mm × 10mm，ball 间距 0.65mm。

**芯片资源（Ti60，数据手册 Table 1/2）**：

| 资源 | Ti60 | Ti60F225（本板封装） |
|---|---|---|
| Logic Elements (LE) | 62,016 | — |
| XLR 单元（其中 SRL8） | 60,800（14,720） | — |
| 全局时钟/控制信号 | 最多 32 | 15（来自 GPIO） |
| 内嵌 RAM | 256 块 × 10 Kbit = 2.6 Mbit | — |
| DSP blocks | 160 | — |
| PLL | 4 | 4 |
| HSIO（单端） | — | **140**（差分对 70；MIPI RX data lane 58、clock lane 12） |
| HVIO（单端） | — | **23** |

> 注意：Ti60 全芯片 HSIO=142 / HVIO=27 是 **F256 封装**的数字，本板 **F225** 为 HSIO **140**、HVIO **23**。

- 支持 **1.5Gbps LVDS**（半速率）和 **1.5G MIPI D-PHY**（I3 等级），可外挂 800Mbps DDR3。
- 有 4 个 PLL：`PLL_BL`、`PLL_TL`、`PLL_TR`、`PLL_BR`，参考输入分别为 `REFCLK0/1/2`（部分未 bonding，见 [2.4](#24-晶振与-pll)）。

**速度等级说明**（解释工程里的 "Timing Mode"）：

| 速度等级 | 核压 VCC/VCCA | 温度范围 | 说明 |
|---|---|---|---|
| **I3** | 0.95V（0.92~0.98V） | −40~100°C | 工业级（本板使用） |
| C3 / C4 | 0.95V（0.92~0.98V） | 0~85°C | 商业级 |
| Q3 | 0.95V（0.92~0.98V） | −40~125°C | 汽车级（AEC-Q100） |
| C3L / C4L / I3L | **0.85V**（0.82~0.88V） | — | 低功耗核压档 |

工程中的器件与 Timing Model 由芯片决定：Family = `Titanium`，Device = `Ti60F225`，Timing Mode 常见为 `I3`（部分工程为 `C4`）。**新建工程时必须指定 Top Module/Entity**，否则软件可能自动推断导致编译出现不可预知现象。

### 2.2 电源

| 电源 | 电压 | 说明 |
|---|---|---|
| VCC | 0.95V（0.92~0.98V） | 核电压（0V95）；低功耗档 C3L/C4L/I3L 为 0.85V |
| VCCA | 0.95V（0.92~0.98V） | PLL 模拟供电（同上，L 档 0.85V） |
| VCCAUX | 1.8V（1.75~1.85V） | 辅助供电 |
| VCCIO | 1.2 / 1.35 / 1.5 / 1.8V | HSIO 的 IO 供电 |
| VCCIO33 | 1.8 / 2.5 / 3.0 / 3.3V | HVIO 的 IO 供电（本板 ≤3.3V） |

主板上由 `U30 PA3015S1R5NT` 等多路电源芯片产生 `VCC_0V95 / VCC_1V8 / VCC_3V3 / VCC_1V5 / VCC_1V2` 等轨。`5V_IN` 经 `D24 SS34` 保护后形成 `VCC_5V`。

### 2.3 Bank 划分与电平选择

Ti60F225 的 Bank 分配与用途：

| Bank | 用途 | 固定/可选电压 | FPGA 侧 |
|---|---|---|---|
| 3B、4A、4B | DDR3 | 固定 1.5V | bottom |
| 3A | HDMI | 固定 1.8V | right |
| 1A、1B | GE 口 | 固定 1.8V | left |
| 2A、2B、TR、TL | QSE 扩展座 J7 | 2A/2B 支持 1.2V/1.8V 选择 | top |
| BL、BR、TR、TL | LED、按键、GE 复位 | 固定 3.3V | — |

电压选择注意：

- **扩展座 J7 作 MIPI 和 LVDS 时**：MIPI IO 在 Bank 2A，电压由 J2 选择，用作 MIPI 时选 **1.2V**；LVDS IO 在 Bank 1B，固定 1.8V。Bank 2A/2B 用 **J2、J3** 控制：MIPI 选 `VCC_1V2`，LVDS 选 `VCC_1V8`。
- **Interface Designer 中选择的电压必须与外部硬件电压一致**。Bank BR/BL/TR/TL 硬件为 3.3V，若 Interface 中误选 1.8V 会烧坏 VCCIO。
- MIPI 的 Bank 电压必须是 **1.2V**。

### 2.4 晶振与 PLL

板上配有三个有源差分晶振：

| 时钟源 | TI60F225 管脚名 | PIN | 对应 PLL | 说明 |
|---|---|---|---|---|
| 25 MHz | `GPIOL_P_08_CLK1_P` | J2 | — | GCLK，可用于 DDR3 参考时钟 |
| 27 MHz | `GPIOL_P_10_CLK3_P` | H2 | — | GCLK，常用视频参考时钟 |
| 50 MHz | `GPIOR_29_PLLIN2` | R13 | PLL_BR | 3.3V bank IO，建议用作低速信号时钟 |

评估板为每个时钟预留了测试点（TP15/TP16/TP17 等）。

**PLL 参考时钟引脚映射（F225，数据手册 Table 27）**：

| PLL | REFCLK0 | REFCLK1 | REFCLK2 | 外部反馈 EXTFB |
|---|---|---|---|---|
| PLL_BL | `GPIOL_P_00_PLLIN0` | `GPIOB_P_00_PLLIN1` | 未 bonding | `GPIOB_P_01_EXTFB` |
| PLL_TL | `GPIOL_P_18_PLLIN0` | `GPIOT_P_00_PLLIN1` | `GPIOL_11_PLLIN2` | `GPIOL_P_17_EXTFB` |
| PLL_TR | `GPIOR_P_19_PLLIN0` | `GPIOT_P_17_PLLIN1` | 未 bonding | `GPIOT_P_16_EXTFB` |
| PLL_BR | `GPIOR_P_00_PLLIN0` | `GPIOB_P_17_PLLIN1` | `GPIOR_29_PLLIN2` | `GPIOR_P_01_EXTFB` |

> 印证：板上 50MHz 接 `GPIOR_29_PLLIN2`，即 **PLL_BR 的 REFCLK2**。25MHz/27MHz 是 GCLK 引脚（非 PLLIN），需经全局/区域网络或 PLL 参考的多路选择器间接进入 PLL。

**PLL 关键指标（数据手册 Table 62）**：FIN 16~800MHz；FOUT 最高 1000MHz；FVCO 2200~5500MHz；FPLL 最高 4000MHz；FPFD 16~800MHz。每 PLL 有 CLKOUT0~4（CLKOUT0~3 进全局网络，CLKOUT4 仅进顶部/底部区域网络）。支持动态相位调整（最多 ±3.5 FPLL 周期）。

### 2.5 上电时序与复位

- **上电时序要求**：保证 `VCC` 和 `VCCA` 先上电，然后 `VCCAUX` 及 `VCCIO` 再上电；所有电源稳定后，再经过 `tCRESET_N` 才可释放复位。
- FPGA 需要专门复位：各个电源稳定后，在上升沿触发 FPGA 采集多功能引脚状态，保证正确配置。手动复位可让 FPGA 重新加载 flash 中程序。
- 板上使用电压检测芯片检测 IO 电压，并在其后配 **RC 复位电路**；同时支持手动复位按键。
- 原理图中复位监控使用 `U13 SSP61CC1502MR`。

**芯片级上电/复位参数（数据手册）**：
- `tCRESET_N`（CRESET_N 最低低脉宽）≥ **0.32μs**。
- 上电斜率 `tRAMP` = **0.1×Vsupply ~ 10 V/ms**。
- 电源稳定后保持 CRESET_N 低 `tCRESET_N` 再释放；配置完成后到进入用户模式需 `tUSER ≥ 25μs`（见 [2.6](#26-jtag-下载与编程方式)）。
- VCC 上电瞬态电流需求：≥ **500mA**（数据手册 Table 30）。

### 2.6 JTAG 下载与编程方式

**板载下载器**：FT4232HL。用户只需一根 Type-C USB 线即可实现供电、下载和 UART，既能保证下载稳定、连线简洁，也能降低采购成本。

**外接下载器**：
1. 把 `J8` 的 Pin 9（FTDI_RST）与 GND 短接，确认 FT4232DL 的 IO 处于高阻态。
2. 通过 `J8` 的 `TDO/TCK/TMS/TDI/VCC_3V3/GND` 与外部下载器连接。

**编程方式**：
- 默认：连接 USB，通过 **JTAG Bridge** 编程 flash。
- AS 模式验证：
  1. 把 `J8` 的 `CRESET_N` 接 GND，或手动按住 `CRESET_N` 按键；
  2. 通过外部下载器连接 `J6` 的 `VCCIO1A/SS/CDI0/CDI1/CCK/GND`；
  3. Programmer 中选择 **Active mode**；
  4. 若上电时通过下拉 SS 确保其为低电平，则跳过第 3 步，选择 **Passive Mode** 验证 PS 模式。
- `J8` 还连接了 `VQPS`，如需验证加密可查阅相关资料或联系技术支持。

**配置模式与配置时序（数据手册 Table 32 / 65~68）**：

F225 支持的配置模式与位宽：

| 模式 | 位宽 | 说明 |
|---|---|---|
| SPI Active | x1 / x2 / x4 / x8 | FPGA 主动从外部 SPI Flash 读取 bitstream |
| SPI Passive | x1 / x2 / x4 / x8 / x16 / x32 | 外部主控（MCU/另一片 FPGA）提供时钟与数据；x16/x32 在使能安全功能时不可用 |
| JTAG | x1 | 经 JTAG 接口配置 |

关键时序参数：
- `tDMIN`：CRESET_N 释放到首个有效配置数据，≥ **32μs**。
- `tUSER`：CDONE 拉高后到进入用户模式的配置时长，≥ **25μs**。
- JTAG `fTCK`：≤ **10MHz**（1.8V 时 ≤ 3MHz）。
- SPI Active 内部配置时钟（DIV1）典型 **80MHz**，最大 100MHz；SPI Passive 配置时钟最大 100MHz。
- 同一时刻只能用一条配置通道（SPI Passive 与 JTAG 同时使用会导致配置失败）。

**下载器（炫览 XL_YLS_DL）驱动安装**：
- 下载器将 SPI 与 JTAG 管脚分开：JTAG 在插座上侧，SPI 在下侧。
- 特性：支持 JTAG、支持 SPI；SPI 的 CCK 和 CDI0 可复用为串口；电压范围 1.5V~5V，**必须接 VCC**。
- JTAG 一般只需接 `VCC/TCK/TDI/TMS/TDO/GND`（T20F225 或 T4/T8 等器件还需 `CRST_N`）。
- 下载 flash 一般接 `VCC/CCK/CDI0/CDI1/SS_N/GND`；`HOLD` 可接 FPGA 复位引脚。
- 驱动安装方法一（Zadig）：打开 `zadig-2.8.exe` → Options → List All Devices → 选择 `YLS_DL(interface 0)` → 驱动选 `libusbK` → Replace Driver；再对 `YLS_DL(interface 1)` 重复。
- 驱动安装方法二（安装包）：`驱动安装及说明/` 下提供三个驱动包：
  - `XL_YLS_DL_Composite_Parent`（同时安装两个接口，运行 `InstallDriver.exe`）
  - `XL_YLS_DL_Interface_0`（仅 Interface 0，用于 AS 下载）
  - `XL_YLS_DL_Interface_1`（仅 Interface 1，用于 JTAG）
- Interface 0 用于 AS 下载，Interface 1 用于 JTAG；若只安装 Interface 1，会在端口中出现 USB Serial Port（如 COM25），CCK/CDI0 即 UART 的 RXD/TXD，可实现 **JTAG 与 UART 共用**。注意 VCC 决定 UART 电平。

### 2.7 三速以太网 GE（YT8531SC/SH）

使用三速以太网芯片 **YT8531SC**（原理图标注 YT8531SH，U8），RGMII 接口。

RGMII 特点：
- `TX_ER` 与 `TX_EN` 复用为 `TX_CTL`；`RX_ER` 与 `RX_DV` 复用为 `RX_CTL`。
- 1Gbps 时钟 125MHz；100Mbps 时钟 25MHz；10Mbps 时钟 2.5MHz。
- 上升沿发送/接收低 4 位，下降沿发送/接收高 4 位。

硬件设计要点：
- `CFG_LDO[1:0]`：`2'b00` 时 `DVDD_RGMII` 由外部供电，其它为内部 LDO；`2'b01` 输出 2.5V，`2'b10/11` 输出 1.8V。
- `CFG_MODE[2:0]`：当前配置为 UTP ↔ RGMII 模式。
- LED：`LED0/1/2` 分别对应 10M/100M/1000M；设计只连接 100M 和 1000M，两个都不闪则为 10M。
- `PHYAD[2:0]`：上电时确定 PHY 地址，当前 PHYAD0/1 设为 1，故 PHY 地址为 `00011b`。
- 复位 Pin 13 属于 3.3V 电源域；晶振属于 3.3V 电源域，故选 3.3V 无源晶振。
- `MDIO` 需上拉（3.3V 上拉 4.7k，1.8V 上拉 1.5k）；`MDC` 最大 12.5MHz。

**GE 管脚分配**：

| Net Name | FPGA Pin Name | Pin Num | Bank 电压 |
|---|---|---|---|
| MDIO | GPIOL_P_11 | G5 | 1.8V |
| MDC | GPIOL_N_11 | F5 | 1.8V |
| RX_CLK | GPIOL_P_09_CLK2_P | H1 | 1.8V |
| RX_CTL | GPIOL_N_08_CLK1_N | H3 | 1.8V |
| RXD0 | GPIOL_N_07_CLK0_N | J1 | 1.8V |
| RXD1 | GPIOL_N_06 | K2 | 1.8V |
| RXD2 | GPIOL_P_00_PLLIN0 | P2 | 1.8V |
| RXD3 | GPIOL_N_05 | J3 | 1.8V |
| TX_CLK | GPIOL_P_07_CLK0_P | K1 | 1.8V |
| TX_CTL | GPIOL_N_00 | R2 | 1.8V |
| TXD0 | GPIOL_P_06 | K3 | 1.8V |
| TXD1 | GPIOL_P_05 | K4 | 1.8V |
| TXD2 | GPIOL_N_09_CLK2_N | G1 | 1.8V |
| TXD3 | GPIOL_N_10_CLK3_N | G2 | 1.8V |
| PHY_RST_N | GPIOL_01 | R3 | 3.3V |

### 2.8 HDMI

- HDMI 接收端：通过 50Ω 电阻上拉，再通过电容耦合连接到 FPGA。
- HDMI 发送：与 LVDS 转 CML 电平转换相似，全部采用交流耦合。
- FPGA 差分对 **P 与 N 脚对调**。
- HDMI 设置要勾选 **Enable Common Mode Driver**。

**HDMI 管脚分配**：

| Net Name | Pin name | Pin num |
|---|---|---|
| HDMI_IN1_CP | GPIOR_N_19 | C15 |
| HDMI_IN1_CN | GPIOR_P_19_PLLIN0 | C14 |
| HDMI_IN1_P1 | GPIOR_N_18 | D14 |
| HDMI_IN1_N1 | GPIOR_P_18 | D15 |
| HDMI_IN1_P2 | GPIOR_N_17 | D13 |
| HDMI_IN1_N2 | GPIOR_P_17 | C13 |
| HDMI_IN1_P0 | GPIOR_N_16 | E14 |
| HDMI_IN1_N0 | GPIOR_P_16 | E15 |
| HDMI_RX_HPD_N0 | GPIOR_N_15 | E12 |
| HDMI_RX_5V_N0 | GPIOR_P_15 | F12 |
| HDMI_RX_SDA0 | GPIOR_N_14 | F11 |
| HDMI_RX_SCL0 | GPIOR_P_14 | G11 |
| TX_TMDS_DATA_P0 | GPIOR_N_13 | F15 |
| TX_TMDS_DATA_N0 | GPIOR_P_13 | G15 |
| TX_TMDS_DATA_P2 | GPIOR_N_12 | F13 |
| TX_TMDS_DATA_N2 | GPIOR_P_12 | G13 |
| TX_TMDS_DATA_P1 | GPIOR_N_11_CLK8_N | G14 |
| TX_TMDS_DATA_N1 | GPIOR_P_11_CLK8_P | H14 |
| TX_TMDS_CLK_P | GPIOR_N_10_CLK9_N | H12 |
| TX_TMDS_CLK_N | GPIOR_P_10_CLK9_P | H13 |

### 2.9 DDR3

- 板载一片 **MT41J128M16JT-125**，位宽 16 位，容量 2Gb（256MB），速率等级 -125。
- 命名含义：`16 Meg × 16 × 8 Banks`，即每个逻辑 Bank 16M 单元、每单元 16bit、共 8 个逻辑 Bank。
- 地址位宽：Row 14 位、Column 10 位、Bank 3 位。
- Ti60F225 的 IO 支持 **SSTL / Differential SSTL**，是支持 DDR3 的硬件基础。
- DDR3 控制器为**软核**，数据速率最高 **800Mbps**（设计说明文档另处写 1600Mbps，实际以控制器支持为准）。
- DDR3 连接到 FPGA 的 **3B、4A、4B** Bank，Bank 电压固定 1.5V。
- PCB 设计需考虑数据线与地址控制线等长。

### 2.10 预留 IO / QSE 扩展口 J7

预留 IO 用于用户扩展，主要用途是 MIPI 和 LVDS 的接收发送。

- 板上预留 HSIO 最多支持 **3 组 MIPI，每组 4lane**。
- HSIO 还可用于 LVDS 传输，最大 **15 对差分对**。
- 每个座子预留 5V 和 3V 电源，方便外接子卡供电。
- TR/TL bank 的 HVIO 连接到扩展座，可设成 3.3V/1.8V。

**扩展口 J7 引脚分配**：

| CONN | Net Name | FPGA Pin Name | Pin Num | Bank 电压 |
|---|---|---|---|---|
| 01 | VCC_3V3 | — | — | — |
| 02 | LVDS | GPIOL_P_14 | F1 | 1.8V |
| 03 | VCC_5V | — | — | — |
| 04 | | GPIOL_N_14 | F2 | 1.8V |
| 05 | GND | — | — | — |
| 06 | GND | — | — | — |
| 07 | MIPI_D0_P | GPIOT_P_00_PLLIN1 | E6 | 1.8/1.2V |
| 08 | | GPIOL_P_13 | F3 | 1.8V |
| 09 | MIPI_D0_N | GPIOT_N_00 | D5 | 1.8/1.2V |
| 10 | GPIOL_N_13 | GPIOL_03 | E3 | 1.8V |
| 11 | GND | — | — | — |
| 12 | GND | — | — | — |
| 13 | MIPI_D1_P | GPIOT_P_01 | B6 | 1.8/1.2V |
| 14 | LVDS_P4 | GPIOL_P_16 | D1 | 1.8V |
| 15 | MIPI_D1_N | GPIOT_N_01 | C6 | 1.8/1.2V |
| 16 | LVDS_N4 | GPIOL_N_16 | C1 | 1.8V |
| 17 | GND | — | — | — |
| 18 | GND | — | — | — |
| 19 | MIPI_CK_P | GPIOT_P_03 | A5 | 1.8/1.2V |
| 20 | LVDS_P3 | GPIOL_P_17 | B1 | 1.8V |
| 21 | MIPI_CK_N | GPIOT_N_03 | A6 | 1.8/1.2V |
| 22 | LVDS_N3 | GPIOL_N_17 | C2 | 1.8V |
| 23 | GND | — | — | — |
| 24 | GND | — | — | — |
| 25 | MIPI_D3_P | GPIOT_P_05 | E7 | 1.8/1.2V |
| 26 | LVDS_P2 | GPIOL_P_18 | B2 | 1.8V |
| 27 | MIPI_D3_N | GPIOT_N_05 | D7 | 1.8/1.2V |
| 28 | LVDS_N2 | GPIOL_N_18 | A2 | 1.8V |
| 29 | GND | — | — | — |
| 30 | GND | — | — | — |
| 31 | MIPI_D2_P | GPIOT_P_04 | F7 | 1.8/1.2V |
| 32 | GPIOL_11 | GPIOL_11 | C5 | 3.3V |
| 33 | MIPI_D2_N | GPIOT_N_04 | F8 | 1.8/1.2V |
| 34 | GPIOL_09 | GPIOL_09 | A4 | 3.3V |
| 35 | GND | — | — | — |
| 36 | GND | — | — | — |
| 37 | GPIOL_04 | — | — | 3.3V |
| 38 | GPIOL_10 | — | — | 3.3V |
| 39 | GPIOL_06 | — | — | 3.3V |
| 40 | GPIOR_13 | — | — | 3.3V |

**拓展子卡**（`子卡原理图/`）：
- `QSE转排针.pdf`：QSE 40pin 转 2×20 2.54mm 排针（J26/J28），`GPIO_HD1`~`GPIO_HD28` 1:1 引出。
- `CSI2QSE_MIPI.pdf`：QSE 转两路 15pin FPC（`ZX-1.0FPC-2H-QFX15P`），用于树莓派 Sensor，信号 `MIPI0/1_RXDP0..2/RXDN0..2`、`GPIO00~GPIO12`。
- `MIPI DSI subcard.pdf`：QSE 转两路 22pin FPC（J34/J35，`KH-CL0.5-H2.0-22PIN`），信号 `MIPI0/1_RXDP0..4/RXDN0..4`、`SCL/SDA/EN`。
- `MIPI DSI Driver.pdf`：MIPI LCD 背光/偏压驱动板，含 `SGM3752`、`LP3318B5F`、`TPP2020`，22pin FPC（J1）+ 30pin（J11），信号 `LEDA/LEDK/D20~D23/CK2` 等。

### 2.11 MIPI 接口

Demo 板有两个 FPC 座子（J4/J5），用于连接 MIPI 屏和 Sensor。

**SOFT MIPI 硬件设计原则**：
1. MIPI 的 bank 电压是 **1.2V**。
2. 一定要参考 pin out 文件。MIPI RX 信号定义为 `RX_DATA_P/Nx_Iy`：x 为组内数据线编号，y 为 MIPI 组（每组 4lane 或 8lane，第 8 组为 4lane 含 5 个差分对，第 7 组为 8lane 含 9 个差分对）。每组时钟 `RX_CLK_Iy` 位置固定，但数据可交换。
3. MIPI TX 没有太多要求，放在 MIPI bank 即可。
4. 使用 HSIO 为 GPIO/LVDS/MIPI 时，GPIO、LVDS 和 MIPI 之间要隔出一对未分配 IO，以减少开关噪声（未隔开软件会提示错误）。

**Panel 接口与 FPC 对应关系**：

| panel | FPC.Pin | J4 | J5 |
|---|---|---|---|
| GND | 22 | | |
| D23P | 21 | GPIOT_P_06 | GPIOT_P_12 |
| D23N | 20 | GPIOT_N_06 | GPIOT_N_12 |
| GND | 19 | | |
| CK2P | 18 | GPIOT_P_07 | GPIOT_P_13 |
| CK2N | 17 | GPIOT_N_07 | GPIOT_N_13 |
| GND | 16 | | |
| D22_P | 15 | GPIOT_P_09 | GPIOT_P_14 |
| D22_N | 14 | GPIOT_N_09 | GPIOT_N_14 |
| GND | 13 | | |
| D21_P | 12 | GPIOT_P_10 | GPIOT_P_16 |
| D21_N | 11 | GPIOT_N_10 | GPIOT_N_16 |
| GND | 10 | | |
| D20_P | 9 | GPIOT_P_11 | GPIOT_P_17 |
| D20_N | 8 | GPIOT_N_11 | GPIOT_N_17 |
| GND | 7 | | |
| NC | 6 | GPIOR_16(3.3V) | GPIOR_19(3.3V) |
| 5V | 5 | | |
| | 4 | | |
| EN | 3 | GPIOR_20(3.3V) | GPIOR_15(3.3V) |
| RST_P | 2 | GPIOR_18(3.3V) | GPIOR_12(3.3V) |
| 5V | 1 | | |

**Sensor 接口与 FPC 对应关系**：

| sensor | FPC.Pin | J4 | J5 |
|---|---|---|---|
| | 22 | | |
| MD2P | 21 | GPIOT_P_06 | GPIOT_P_12 |
| MD2N | 20 | GPIOT_N_06 | GPIOT_N_12 |
| | 19 | | |
| MD0P | 18 | GPIOT_P_07 | GPIOT_P_13 |
| MD0N | 17 | GPIOT_N_07 | GPIOT_N_13 |
| | 16 | | |
| MCP | 15 | GPIOT_P_09 | GPIOT_P_14 |
| MCN | 14 | GPIOT_N_09 | GPIOT_N_14 |
| | 13 | | |
| MD1P | 12 | GPIOT_P_10 | GPIOT_P_16 |
| MD1N | 11 | GPIOT_N_10 | GPIOT_N_16 |
| | 10 | | |
| MD3P | 9 | GPIOT_P_11 | GPIOT_P_17 |
| MD3N | 8 | GPIOT_N_11 | GPIOT_N_17 |
| | 7 | | |
| RST | 6 | GPIOR_16(3.3V) | GPIOR_19(3.3V) |
| 5V | 5 | | |
| | 4 | | |
| IIC_SCL | 3 | GPIOR_20(3.3V) | GPIOR_15(3.3V) |
| IIC_SDA | 2 | GPIOR_18(3.3V) | GPIOR_12(3.3V) |
| 5V | 1 | | |

### 2.12 Flash

- 配置一片 **GD25LQ64**（8MB）SPI NOR Flash，用于存储 FPGA 程序，也可用于用户数据存储。
- 原理图中 Flash 电源使用 `VDD1V8`，位于 `VCCIO1A`。
- **FLASH 第 6 脚 CLK 上一般不需要预留电容**。
- 相关信号：`SS`、`CCK`、`CDI0~CDI3`、`CSI`、`CDONE`、`CRESET_N`、`NSTATUS`、`TEST_N`。

### 2.13 用户按键与 LED

板上配置 4 个按键和 8 个 LED（原理图为 D0~D7，由 `MMBT3904` 驱动）。

**按键管脚分配**：

| 按键名 | FPGA Pin Name | Pin Num | Bank | 电压 |
|---|---|---|---|---|
| KEY0 | GPIOL_07 | C4 | TL | 3.3V |
| KEY1 | GPIOR_22 | P14 | BR | 3.3V |
| KEY2 | GPIOR_21 | N14 | BR | 3.3V |
| KEY3 | GPIOL_03 | A3 | TL | 3.3V |

**LED 管脚分配**：

| LED 名 | FPGA Pin Name | Pin Num | Bank | 电压 |
|---|---|---|---|---|
| LED0 | GPIOR_27 | P13 | BR | 3.3V |
| LED1 | GPIOR_24 | N13 | BR | 3.3V |
| LED2 | GPIOL_P_12 | G3 | 1B | 1.8V |
| LED3 | GPIOL_P_02_CSI | N2 | 1A | 1.8V |
| LED4 | GPIOL_N_12 | G4 | 1B | 1.8V |
| LED5 | GPIOL_P_15 | E1 | 1B | 1.8V |
| LED6 | GPIOL_N_15 | E2 | 1B | 1.8V |
| LED7 | GPIOL_N_02 | M2 | 1B | 1.8V |

> 注意：LED0~LED1 为 3.3V，其余 LED 为 1.8V，修改电平时需注意硬件。

### 2.14 加载模式验证管脚 J6

Demo 板预留了 J6 排针座：

| J6 | FPGA Pin Name | Pin Num | Bank | 电压 |
|---|---|---|---|---|
| J6.1 | VCCIO1A | — | — | 1.8V |
| J6.2 | GPIOL_P_01_SSL_N | P1 | 1A | 1.8V |
| J6.3 | GPIOL_P_03_CDI0 | M1 | 1A | 1.8V |
| J6.4 | GPIOL_N_03_CDI1 | L1 | 1A | 1.8V |
| J6.5 | GPIOL_P_04_CDI2 | H5 | 1A | 1.8V |
| J6.6 | GPIOL_N_04_CDI3 | H4 | 1A | 1.8V |
| J6.7 | GPIOL_N_01_CCK | N1 | 1A | 1.8V |
| J6.8 | GND | — | — | — |

### 2.15 UART

通过板载 **FT4232** 提供 UART：

| SIGNAL | FPGA Name | FPGA Num | 说明 |
|---|---|---|---|
| UART_RX | GPIOL_02 | R4 | FPGA 为 input |
| UART_TX | GPIOR_28 | R14 | FPGA 为 output |

### 2.16 管脚分配速查汇总

- 系统时钟：见 [2.4](#24-晶振与-pll)。
- GE：见 [2.7](#27-三速以太网-geyt8531scsh)。
- HDMI：见 [2.8](#28-hdmi)。
- 扩展座 J7：见 [2.10](#210-预留-io--qse-扩展口-j7)。
- MIPI Panel/Sensor：见 [2.11](#211-mipi-接口)。
- 按键/LED：见 [2.13](#213-用户按键与-led)。
- 加载模式 J6：见 [2.14](#214-加载模式验证管脚-j6)。
- UART：见 [2.15](#215-uart)。

---

## 三、目录结构与配套资料

```
Ti60F225_DemoBoard_v4/
├── 01_Ti60F225_Key_led_osc_demo/        按键/LED/晶振入门
├── 02_Ti60F225_hdmi_demo/               HDMI RX→TX 环回
├── 03_hdmi_tx_demo/                     HDMI TMDS 彩条输出
├── 04_Ti60f225_GE_demo/                 千兆以太网 UDP
├── 05_Ti60F225_lvds_loop_demo/          LVDS 1.5Gbps 自环
├── 07_Ti60F225_MIPI_C2D_Demo/           SC431HAI → MIPI DSI
├── 08_ti60f225_soc_demo/                RISC-V Sapphire SoC（hardjtag / co_debug）
├── 09_Ti60F225_hdmi2dsi_Demo/           HDMI → MIPI DSI
├── 10_Ti60f225_sc431hai2hdmi_demo/      SC431HAI → HDMI / DSI
├── 11_TI60F225_MIPI_CSI_loop_demo/      MIPI CSI-2 自环（RGB / YUV422）
├── 12_mipi_dsi_loop_demo/               MIPI DSI 自环
├── 13_carrychain_prj_demo/              进位链延时测量（逻辑锁定）
├── 17_Ti60F225_uart_demo/               UART 回环
├── 子卡原理图/                           QSE 转 FPC / 排针 / DSI 驱动板原理图
├── 软件安装包/                           jre-8u381-windows-x64.exe
├── 驱动安装及说明/                       下载器驱动 + Zadig + 说明 PDF
├── Ti60F225A_V4_SCH.pdf                 主板原理图
├── TI60F225_DEMOBOARD-装配图.pdf         装配图
└── TI60F225I3-V4 DEMO板软硬件设计说明-260813-1.pdf
```

> 说明：编号中的 06、14、15、16 在 v4 版本中未提供；`07` 目录名写 C2D，实际为 CSI2→DSI。

---

## 四、软件 / Demo 工程说明

所有工程均面向 **Titanium / Ti60F225**，使用 **Efinity** 开发。每个工程一般包含：

- Efinity 工程 XML（`*.xml`）：器件、顶层、源文件列表、IP 信息。
- 外设/接口数据库（`*.peri.xml`）：PLL、LVDS、MIPI D-PHY、GPIO、JTAG、OSC 等。
- 时序约束（`*.sdc` / `*.pt.sdc`）。
- RTL 源码（`rtl/`、`src/`）。
- IP 目录（`ip/`，部分工程为空）。
- 综合/布局布线/时序/调试工作目录（`work_syn/`、`work_pnr/`、`work_pt/`、`work_dbg/`）与输出 `outflow/`。
- 调试配置 `debug_profile.wizard.json`、波形 `la*_waveform.vcd/gtkw`。

### 4.1 01_Ti60F225_Key_led_osc_demo

| 项目 | 值 |
|---|---|
| 工程文件 | `01_Ti60F225_Key_led_osc_demo/01_Ti60F225_key_demo/LED_8bit_Test.xml` |
| 顶层 | `LED_8bit_Test`（`src/LED_8bit_Test.v`） |
| 器件/时序 | Titanium / Ti60F225 / C4 |
| Efinity | 2026.1.132.4.5 |
| SDC | `src/sdc/LED_8bit_Test.pt.sdc` |
| IP | 无（接口级 PLL/OSC） |

**功能**：入门工程，验证 4 个晶振（54M/50M/25M×2/片上 OSC）与 4 个按键、8 个 LED。
- `sys_pll_RSTN = key_i[0]`；`sys_rst_n = sys_pll_LOCKED`；`osc_inst1_ENA = 1'b1`。
- `led_clk = clk_sel ? clk_50m : clk_54m`；4 组 `key_detect + led_ctrl` 分别以 54M/50M/25M×2/片上 OSC 工作。
- `led_data = {3{led_data4}, 2{led_data3}, led_data2, led_data1}`。

**关键模块**：
- `src/key_detect.v`：15ms 长按检测，`MAX_CNT = CLK_FREQUENCY_MHz * 10000 * 15 - 1`，产生单周期 `key_sw_en` 脉冲。
- `src/led_ctrl/led_ctrl.v`：27 位计数器，每次 `en` 脉冲切换 `led_sel`（0→3），选择更快的计数位（26/25/24/23），实现按键改变闪烁速度。

**PLL/OSC**（`LED_8bit_Test.peri.xml`）：
- `pll_27m`（PLL_TL0，27MHz）→ `clk_54m`，`locked=sys_pll_LOCKED`，`reset=sys_pll_RSTN`。
- `pll_50m`（PLL_BR0，50MHz）→ `clk_50m`。
- `pll_25m`（PLL_TR0，25MHz）→ `clk_25m_x2`。
- `osc_inst1`（OSC_0，DIV1）→ `osc_clk`/`osc_inst1_ENA`。

**LED/晶振对应测试结果**（设计说明）：

| LED | Bank | 对应时钟 |
|---|---|---|
| LED0 | BR | 54M |
| LED1 | BR | 50M |
| LED2/3 | 1B/1A | 25M |
| LED4~7 | 1B | 片上晶振 |

配置后 5 个灯同时以 1s/次闪烁；若某灯不闪可据此查找对应晶振问题。

**按键测试**：

| 按键 | 控制 |
|---|---|
| KEY0 | LED0 闪烁频率 |
| KEY1 | LED1 闪烁频率 |
| KEY2 | LED2-3 闪烁频率 |
| KEY3 | LED4-7 闪烁频率 |

### 4.2 02_Ti60F225_hdmi_demo（HDMI RX→TX 环回）

| 项目 | 值 |
|---|---|
| 工程文件 | `02_Ti60F225_hdmi_demo/02_Ti60F225_hdmi_rx2tx_loop_v19/efinity_project/DDR3_MC.xml`（工程名 `DDR3_MC`） |
| 顶层 | `example_top`（`source/top_module/example_top.v`） |
| 器件/时序 | Titanium / Ti60F225 / I3 |
| Efinity | 2025.2.288.3.8 |
| SDC | `DDR3_MC.pt.sdc` |
| IP | 无有效 IP（`ip/efx_fifo` 为遗留未实例化） |

**功能**：通过 LVDS 模拟 HDMI，实现 **HDMI RX → HDMI TX 环回**（repeater）。
- HDMI 通过 FPGA 高速 IO，用 LVDS 实现 HDMI 接收；
- 接收时钟经 PLL 产生内部处理和发送的多路径时钟；
- HDMI decoder 解出的数据直接输入 dvi encoder；
- 输出通过 LVDS。

**层次**：`example_top` → `hdmi_rx`（EDID/DDC/HPD）、`dvi_decoder`（TMDS 解码）、`vid_info_det`（帧统计）、`dvi_encoder`（TMDS 编码）。

**接收链**（`source/hdmi_src/dvi_rx/`）：`dvi_decoder` → 3×`tmds_decoder`（`frame_bitslip`→`phasealign_v1`→`channelbond`→`decoder_v1`），另有 `lvds_dynamic_delay_v2`、`de_sync`、`package_ctrl_v1`、`aux_parse`（解析音频与 AVI InfoFrame）。

**发送链**（`source/hdmi_src/dvi_tx/`）：`dvi_encoder`（27bit FIFO + `tx_aux` + 3×`encode`），`encode.v` 为 Xilinx 原创 8b→10b TMDS 编码，`tx_aux` 负责数据岛/音频包（`audio_packet.sv` 等）。

**时钟**（`DDR3_MC.peri.xml`）：核心 PLL 参考 `clk_25m`（25MHz）。

| PLL | 模块 | 输入 | 输出 |
|---|---|---|---|
| SYS_PLL | PLL_TL0 | 25MHz | sys_clk(~108M)、clk_125m、clk_10m、lcd_ref_clk |
| DDR3_PLL | PLL_BL0 | 25MHz | tdqss/tac/twd 400M、core 200M（遗留 DDR） |
| hdmi_rx_pll | PLL_TR0 | external 148.5MHz | hdmi_rx_fast_clk/hdmi_tx_fast_clk ~742MHz、hdmi_rx_slow_clk ~148.5MHz |

**LED 指示**（设计说明）：

| LED | 说明 |
|---|---|
| D3 | FPGA 系统运行灯，上电后 0.5s 闪烁 |
| D4 | HDMI 接收指示，输入 HDMI 有时钟即闪；1080p60 时间隔约 0.5s |

**Demo 框图要点/参数**：接口表见设计说明（LVDS RX `hdmi_rx_clk`、`hdmi_rx_d0/1/2/3`；TX `tmds_tx_clk`、`tmds_tx_datan`），`Enable Common Mode Driver` 勾选，动态/静态 delay 设置，`Enable Deserialization`、`Enable Half Rate` 等。

> 注意：工程名为 `DDR3_MC`，peri/SDC/.bak 中残留大量 DDR3、GE 约束，但当前顶层无 DDR 端口，属于历史遗留，不影响功能。

### 4.3 03_hdmi_tx_demo（HDMI 彩条发生）

| 项目 | 值 |
|---|---|
| 工程文件 | `03_hdmi_tx_demo/hdmi_tx_demo_v2/led_demo.xml`（工程名 `hdmi_tx`） |
| 顶层 | `top`（`rtl/top.v`） |
| 器件/时序 | Titanium / Ti60F225 / C4 |
| Efinity | 2024.2.294.3.14 |
| SDC | `led_test.pt.sdc` |
| IP | 无（`ip/` 为空） |

**功能**：单独的 HDMI 输出测试工程，输出彩条（EBU 检测图）。
- 硬件只需连接 HDMI TX 到电脑/显示器。
- 顶参数：`MAX_HRES=1920, MAX_VRES=1536, HSP=2, HBP=88, HFP=120, VSP=2, VBP=20, VFP=20`。
- 只实例化三个模块：`reset`（复位同步）、`color_bar_rgb`（TEST_MODE=2'd2，8 段竖彩条）、`dvi_encoder`（TMDS）。
- `color_bar_v3.0/color_bar_rgb.v` 四种模式：00 递增数据、01 每帧纯色循环、10 竖彩条、11 外部透传。

**时钟**：`pll_hdmi`（PLL_BR0，25MHz）→ `hdmi_tx_slow_clk` ≈148.7MHz、`hdmi_tx_fast_clk` ≈743.5MHz（5×像素时钟）。

**测试输出**：EBU 彩条从左到右为 白、黄、靛、绿、紫、红、蓝、黑。

> 工程内保留大量未使用的 HDMI RX 链、Altera IP 核（`rtl/hdmi_src/ip_core/`）、以太网 ISF，属历史遗留。

### 4.4 04_Ti60f225_GE_demo（UDP 千兆以太网）

| 项目 | 值 |
|---|---|
| 工程文件 | `04_Ti60f225_GE_demo/04_Ti60F225_tse_hj_demo_v5/led_demo.xml`（工程名 `led_test`） |
| 顶层 | `top`（`rtl/top.v`） |
| 器件/时序 | Titanium / Ti60F225 / I3 |
| Efinity | 2025.2.288.4.15 |
| SDC | `led_test.pt.sdc` |
| IP | 无（接口级 PLL/OSC） |

**功能**：RGMII 千兆 UDP 测试，含 ARP 解析、发送 "Hello From Ti60F225\n"、回显接收到的 UDP 数据。
- 顶层硬编码：源 MAC `00:0a:35:01:fe:c0`，TTL `0x80`，源 IP `192.168.0.2`、目的 IP `192.168.0.3`，源/目的端口 `0x1f90`（8080）。
- 强制全双工、1000Mbps、link up；`led_d0` 由 `rxc` 产生约 1Hz 闪烁（125MHz/125000000）。
- 发送时按 RGMII 要求：上升沿发低 4 位 + `TX_EN`，下降沿发高 4 位 + `TX_ER`；接收侧做 hi/lo 交换与一拍对齐。
- `MDIO` 需上拉，`MDC` 最大 12.5MHz。

**时钟**：`ge_0_gclk_pll`（PLL_TR0，参考 `rxc` 125MHz）→ `rx_pll_CLKOUT0` 125MHz、`ge0_tx_clk`/`ge0_tx_clk_90` 125MHz；`osc_inst1`（OSC_0 DIV8）=10MHz 用于 MDC。

**测试**：把电脑 IP 改为 `192.168.0.3`；黄灯闪烁表示千兆网。

**关键 RTL**：`rtl/udp_test_top.v`（RGMII↔GMII，`util_gmii_to_rgmii`）、`rtl/heijin_test/mac/`（`mac_test.v`、`mac_top.v`、`rx/`、`tx/`、`crc.v`、`arp_cache.v`）、`rtl/heijin_test/arbi/gmii_arbi.v`。

### 4.5 05_Ti60F225_lvds_loop_demo（1.5Gbps LVDS 自环）

| 项目 | 值 |
|---|---|
| 工程文件 | `05_Ti60F225_lvds_loop_demo/04_Ti60F225_LVDS_demo_v1.1/Efinity_2022.1.226_V1.0/lvds_loopback.xml` |
| 顶层 | `lvds_loopback_top`（`rtl/lvds_loopback_top.v`） |
| 器件/时序 | Titanium / Ti60F225 / I3（SDC 头写 C4 为旧模板） |
| Efinity | 2025.2.288.3.8 |
| SDC | `sdc/lvds_loopback.sdc` |
| IP | 无（接口级 LVDS/PLL） |

**功能**：指导使用 LVDS，实现 **1.5Gbps LVDS 自环**。

**框图/模块**：
1. `prbs_gen`：产生 8 位 PRBS 数据用于 LVDS 输出（`data_source` 选择）。
2. `vio_lvds_tx_data`：VIO 产生的数据用于输出。
3. `LVDS_TX`：Interface 中设置，**低位先传**。
4. `dyn_delay`：LVDS_RX IO 延时调整。钛金提供 64 个 delay step，每 step ≈20ps；动态校准使用 slowclk，`RX_DLY_RST` 后延时调整到 step 31，延时在时钟上升沿 5ns 后生效（注意 slow_clk >/< 200MHz 的区别）。
5. `frame_bitslip`：LVDS_RX_DATA 数据位移。
6. `prbs_det`：PRBS 校验。
7. VIO：通过 JTAG 产生控制信号。

**关键参数**：`prbs_gen` 种子 `8'h08`；`stat_all = stat1 & stat2 & stat3 & stat0`，`pass_cnt` 连续 1024（`10'h3FF`）才置 `det_pass`。LED：
```
led[0] = ~det_pass;     // 4 lane 连续 1024 次通过才灭
led[1] = ~pll_locked;
led[2] = tx_heartbeat;  // TX 域心跳
led[3] = rx_heartbeat;  // RX 域心跳
```

**时钟**：`lvds_tx_pll`（PLL_TL0，25MHz）→ `tx_fast_clk` 750.4MHz、`tx_slow_clk` 187.5MHz；`lvds_rx_pll`（PLL_TR0，外部 187.5MHz）→ `rx_fast_clk` 750.4MHz、`rx_slow_clk` 187.5MHz。

**硬件连接**：LVDS 管脚 bank 电压设为 **1.8V**（Bank 2B → J3 选 1.8V）。

**演示**：烧写程序并连接 debug；在 `vio_ctrl_status` 界面把 `data_source` 设为 0（由 VIO 的 `lvds_tx_data` 发送）；观察 `stat` 稳定为 1 说明 1.5G 自环正确。

> 还有一个 DPA 版本 `05_Ti60F225_lvds_loop_dpa_demo`（文档章节 05），把动态校准模块换成 `dpa_ctrl`，Delay Mode 设为 `dpa`，新增 `DLY_ENA/DLY_RST/DBG/LOCK`。DPA 全锁后 `dpa_all_lock` 有效。当前 v4 目录中未单独提供该工程。

### 4.6 07_Ti60F225_MIPI_C2D_Demo（SC431HAI → 双 MIPI DSI）

| 项目 | 值 |
|---|---|
| 工程文件 | `07_Ti60F225_MIPI_C2D_Demo/Ti60f225_csi2dsi_sc431hai_v3.4/ti60f225_oob.xml` |
| 顶层 | `ti60f225_oob_top`（`rtl/ti60f225_oob_top.v`） |
| 器件/时序 | Titanium / Ti60F225 / I3 |
| Efinity | 2025.2.288.3.8（文档 2025.2.288.4.15） |
| SDC | `ti60f225_oob.sdc` |
| IP | `csi_rx_controller`（efx_csi2_rx 5.9）、`dsi_tx`（efx_dsi_tx 5.13） |

**功能**：CSI RX 接收 SC431HAI（或树莓派 IMX219）→ HyperRAM/DDR3 帧缓存 → Debayer RAW→RGB → 同时输出两路 MIPI DSI panel。
- 版本变化：v3.4 可同时输出 DSI；MIPI 屏驱动芯片变化，升级参数。

**模块说明**：
1. `csi_rx_controller`：MIPI CSI 控制器（4lane，HS byte 70MHz，FIFO 4096）。
2. `i2c_master_ctrl_top`：I2C 配置 SC431HAI 寄存器，`DATA_LENGTH=161`，`I2C_DEVICE_ADDR=8'h60`，`CLK_DIV=16'h0020`（CLK_5M）。
3. `sensor_clipper`：剪裁到 1080 行（`vs_cnt` 1~1080）。
4. `frame_buffer`：视频帧缓存，读写 DDR3（3 bank，MAX 960×1080，32→16）。
5. `ddr3_top`：16 位 DDR3 控制器（AXI 128 位）。
6. `debayer_top_2to1`：RAW→RGB（RGB 增益固定 4/4/4）。
7. `dsi_tx_top` ×2：驱动两块 panel（inst1 → data0~3，inst2 → data10~13）。
8. `panel_config`：发送 panel 配置数据，`Panel_1080p_reg.mem`，`REG_DEPTH=150`。

**视频参数**：`MAX_HRES=1920, MAX_VRES=1080, HSP=4, HBP=88, HFP=120, VSP=2, VBP=20, VFP=20`。

**SC431HAI 参数**：16 位地址 I2C，1920×1080（寄存器 `0x3208/09=0x0780`、`0x320a/0b=0x0438`）。

**时钟**：`DDR3_PLL`（PLL_TR0，25M）→ 100M/400M；`USER_PLL`（PLL_BL0，25M）→ vid_clk_dvi2 70M、fb 50M、CLK_5M 5M；`MIPI_TX_PLL`（PLL_TL0，25M）→ core 100M、mipi tx serial 500M、tx byte 125M；`pll_inst4`（PLL_BR0，25M）→ 100M、mipi rx pclk 50M。

**管脚分配**（文档）：

| Interface Name | Pad assigned |
|---|---|
| Io_cam_scl | GPIOR_20 |
| Io_cam_sda | GPIOR_18 |
| o_cam_rst_p | GPIOR_16 |
| cam_ck | GPIOT_PN_09 |
| cam_d0 | GPIOT_PN_07 |
| cam_d1 | GPIOT_PN_10 |
| cam_d2 | GPIOT_PN_06 |
| cam_d3 | GPIOT_PN_11 |

**硬件连接**：Sensor 接转接卡 J34 FPC，Panel 接 J35 FPC；确保 J2/J3 选 1.2V。

**LED 指示**：

| LED | 说明 |
|---|---|
| LED0（D0） | DDR3 `cal_done` 为高时 1s 闪烁；不闪说明校准有问题 |
| LED1（D1） | 接收到稳定视频信号时 1s 闪烁；不闪说明未收到稳定视频 |

**MIPI DSI 使用要点**：
- MIPI IO bank 电压配置成 **1.2V**；输出要接相应 bank 的 `REF_RES` 管脚。
- 关键 IP 参数：Parallel Clock frequency 50~187.5（clk_byte_HS）；IP core frequency 100；Pack Type 48/64；Maximum Horizontal Resolution 必须与 hactive 匹配；FIFO Pixel Depth 要大于每行数据 2~3 倍；Video Transmission Packet Sequences（Non-burst with Sync Pulses / Sync Events / Burst）。
- 修改参数后需在 `Titanium-mipi-utility` 文件中验证，并把 input fields 信息替换到 `Panel_1080p_reg.mem`。

### 4.7 08_ti60f225_soc_demo（RISC-V Sapphire SoC）

本目录含两个工程：`09_Ti60F225_hardjtag_demo`（硬 JTAG 调试）与 `09_Ti60F225_co_debug_demo`（并发/联合调试）。两者硬件 RTL 完全相同，仅 SoC IP 的调试模式与 OpenOCD/Eclipse 配置不同。

| 项目 | 值 |
|---|---|
| 工程文件 | `par/ddr_demo_ti60/ddr_demo_ti60.xml` |
| 顶层 | `ddr3_example_top`（`rtl/ddr3_example_top.v`） |
| 器件/时序 | Titanium / Ti60F225 / I3 |
| Efinity | 2025.2.288.3.8 |
| SDC | `sdc/ddr3.sdc` |
| IP | `soc`（efinixinc.com:soc:efx_soc:3.3.0，EfxSapphireSoc） |

**功能**：RISC-V Sapphire SoC + 16 位 DDR3 控制器，运行 Efinity RISC-V IDE 提供的各外设 demo。

**SoC 配置（settings.json）**：
- CPU：1 核，ICache/DCache 4096，FPEXT 使能，FPU/LINUX 关闭。
- 内存：DDR 128 位、大小 `0xE0000000`；AXI Slave 16MB `@0xF8000000`；On-chip RAM `0xF9000000`（4KB）。
- 外设：UART0、SPI0、I2C0、GPIO0（宽度 4），其余关闭。
- 调试：`DEBUG=1'b1`，hardjtag 版 `CO_DEBUG=0`，co_debug 版 `CO_DEBUG=1`。

**`ddr3_example_top`**：实例化 `ddr3_top` 与 `soc u_sapphire_soc`；SoC 的 `io_ddrA_*` AXI4 主口接 DDR3 控制器；SoC 的 `jtagCtrl_*` 接 FPGA 的 **JTAG_USER1** 用户 tap。

**启动/地址**：
- Bootloader 位于片上 RAM `0xF9000000`（4KB）；将 SPI NOR Flash `0x00380000` 起的 `0x01F000`（124KB 用户镜像）拷贝到 `0x00001000` 运行。
- OpenOCD `instr_addr=0x00001000`，debug module base `0x10B80000`，work area `0xF9000000`。
- 链接脚本：`bootloader.ld` RAM 起点 `0xF9000000` 长度 4K；`default.ld` RAM 起点 `0x00001000` 长度 124K。

**软件工程**（`par/ddr_demo_ti60/embedded_sw/soc/software/`）：
- standalone：`apb3/apb3Demo`、`application/{coremark,dhrystone,memTest}`、`axi4/axi4Demo`、`bootloader`、`customInstruction`、`fpu`、`gpio/{gpioDemo,inlineAsmDemo}`、`i2c/{i2cDemo,i2cEepromDemo,i2cMasterDemo,i2cMasterInterruptDemo,i2cSlaveDemo}`、`smp/{smpDemo,smpIntrDemo}`、`spi/spiDemo`、`timer/{clintTimerInterruptDemo,nestedInterruptDemo,userTimerDemo,watchdogDemo}`、`uart/{uartEchoDemo,uartInterruptDemo}`、`vexriscv/{dCacheFlushDemo,iCacheFlushDemo,semihostingDemo}`。
- FreeRTOS：`freeRTOS/freertosDemo` 及 `common`/`driver`。

**OpenOCD / FTDI 配置**（`bsp/efinix/EfxSapphireSoc/openocd/`）：
- Ti60F225 使用 `ftdi_ti.cfg`：VID:PID `0x0403:0x6011`，channel 1，`_CPUTAPID 0x10660A79`；`debug_ti.cfg` 中 `adapter speed 800`，`jtag newtap fpga_spinal bridge ... irlen 5`，VexRiscv 非标准调试（`vexriscv jtagMapping 8 8 0 1 2 2`），`cpuConfigFile cpu0.yaml`。
- 首次 debug 若报错，需要修改 `.../openocd/ftdi_ti.cfg` 中的 `ftdi device_desc`、`ftdi vid_pid`、`ftdi channel` 与下载器对应。

**逻辑工程配置步骤（hardjtag）**：
1. `Open IP Catalog → Processors and Peripherals → Sapphire Soc`，Module Name `efx_soc`；打开软 JTAG 调试选项。
2. Cache/Memory 打开外部存储器 AXI 接口并使能双工。
3. Debug 默认；Generate 后在 `ip/efx_soc` 生成 `efx_soc_tmpl.v` 例化；同时生成 `embedded_sw` 目录。
4. Interface IO 连接，SOC JTAG 使用 JTAG1。
5. 编译工程，生成 hex 和 bit。

**RISC-V IDE 使用步骤**：
1. 选择工作空间（建议指向 `embedded_sw/soc/bsp`）。
2. `File → Import → Efinix Projects → Efinix Makefile Project`。
3. 选择 bsp 位置（FreeRTOS 需输入两个），勾选工程后 Finish。
4. 右键 `Build Project`。
5. debug 前先把逻辑 bit/hex 配置到 FPGA；右键 `gpioDemo_ti.launch → Debug As → gpioDemo_ti`。

**合成固化文件**：
- 在 Programmer 点击 `Combine Multiple Image Files`，把逻辑 hex 与 `gpioDemo.bin` 合成 `soc_combine_hex.hex`。
- 逻辑部分地址必须为 **0**，soc 部分为 **0x380000**（由 bootloader 指定，默认 0x380000）。
- 烧写：Programming Mode 选 `SPI Active using JTAG Bridge`，提示 `JTAG2SPI programming…done` 即完成；重新上电可见 LED 闪烁。

**IP 更新注意事项**：
- 新版本 Efinity 打开旧工程会提示升级；若报 `'java' 不是内部或外部命令`，需安装 Java8（`软件安装包/jre-8u381-windows-x64.exe`）。
- Java8 安装后要**重启 Efinity** 才能更新成功。
- IP 升级时要**关闭 RISCV IDE**。
- 升级后再次 debug 可能需要重新修改 cfg 中的三个参数：`ftdi device_desc "Quad RS232-HS"`、`ftdi vid_pid 0x0403 0x6011`、`ftdi channel 0`。

**并发调试（co_debug）**：
- 自 Efinity RISC-V 嵌入式软件 v2025.2 起，新增并发调试：通过单个 FTDI JTAG 接口同时进行 RTL 调试与 RISC-V 内核调试（不同 USER TAP）。
- 必需软件：Efinity v2025.2 + Efinity RISC-V IDE v2025.2。
- 步骤：在 HBR 选项卡启用 efx_soc IP 的 Co-Debug → 在 Efinity Debug Wizard 配置信号并编译 → 下载 bit → 启动 IDE 导入工程 → 右键 `group.launch` Run/Debug → 打开 Debugger，先启用 Shared 再 connect → 执行 RTL 调试。
- 注意：联合调试仅支持 JTAG User TAP 的 Soft Debug Tap 选项；启用联合调试后 Soft Debug Tap 会隐藏，反之亦然。
- 测试：勾选 `Use the same FTDI channel to debug RTL and RISC-V`，FPGA Tap Port 选择 **1**，Debug Wizard 中 JTAG USER TAP 选 **USER2**。

### 4.8 09_Ti60F225_hdmi2dsi_Demo（HDMI → MIPI DSI）

| 项目 | 值 |
|---|---|
| 工程文件 | `09_Ti60F225_hdmi2dsi_Demo/Ti60F225_hdmi2dsi_J7_1Gpsb_V10/ti60f225_demo.xml` |
| 顶层 | `TI60F225_MIPI_dsi`（`TI60F225_MIPI_dsi.v`） |
| 器件/时序 | Titanium / Ti60F225 / I3 |
| Efinity | 2025.2.288.3.8 |
| SDC | `ti60f225_demo.sdc` |
| IP | `dsi_tx`（efx_dsi_tx v5.13，4lane，125MHz byte，MAX_HRES 1920） |

**功能**：从 HDMI 输入到 MIPI DSI 输出（1080p）。
- HDMI RX（硬 LVDS + `dvi_decoder`）→ RGB/HS/VS/DE；
- `frame_buffer` 三缓冲经 16 位 DDR3（AXI 128）读写；
- `data_tx` 重建显示时序 → `pixcel_122` 2 像素/时钟打包 → `dsi_tx`（RGB888 datatype `0x3E`，4 lane + clock lane，125MHz byte）；
- `panel_config` 通过 AXI4-Lite 写 `Panel_1080p_reg.mem`（150 项）初始化 panel。
- `color_bar_rgb` 已实例化但输出悬空（实际用 HDMI 输入）。

**时钟**：`pll_inst1`（PLL_TL0，25M）→ i_sysclk ~144M、i_sysclk_div_2 ~72M、core 100M；`mipi_pll`（PLL_BR0，25M）→ i_mipi_clk 100M、tx byte 125M、tx serial 500M；`DDR3_PLL`（PLL_BL0，25M）→ 400M；`hdmi_rx_pll`（PLL_TR0，148.5M）→ 148.5M/742.5M。

**升级到 2024.2 时钟 MIPI DSI 报错的修复**：
1. 按文档修改时钟相位；
2. 把 mipi tx 时钟的 Parallel Clock 修改为 `i_mipi_txd_sclk`。

### 4.9 10_Ti60f225_sc431hai2hdmi_demo（SC431HAI → HDMI/DSI）

| 项目 | 值 |
|---|---|
| 工程文件 | `10_Ti60f225_sc431hai2hdmi_demo/Ti60f225_sc431hai2hdmi_v1/ti60f225_oob.xml` |
| 顶层 | `ti60f225_oob_top`（`rtl/ti60f225_oob_top.v`） |
| 器件/时序 | Titanium / Ti60F225 / I3 |
| Efinity | 2025.2.288.4.15 |
| SDC | `ti60f225_oob.sdc` |
| IP | `csi_rx_controller`（efx_csi2_rx 5.6）、`dsi_tx`（efx_dsi_tx 5.10）；`sapphire_soc` 未使用 |

**功能**：SC431HAI 摄像头 → CSI-2 → DDR3 帧缓存 → Debayer → **HDMI 输出 + 单路 MIPI DSI 输出**。

**版本历史**：
| 版本 | 说明 |
|---|---|
| v0 | hdmi 的 vs/hs 交换 |
| v3/v4 | 图像镜像与翻转；优化 `rgb_gain`；去掉 DSI 输出部分；去无用代码；增加曝光时间与 ANA 增益控制；MIPI CSI RX 从 5.8 升级到 5.15 |
| v5 | Efinity 版本升级；CSI RX IP 未升级（升级后 vs 解析不出来）；删除 `vga_gen.v` |

**模块说明**：
1. `csi_rx_controller`：MIPI CSI 控制器。
2. `i2c_master_ctrl_top`：I2C 配置 SC431HAI（与 07 相同，161 项）。
3. `sensor_clipper`：剪裁到 1920×1080。
4. `frame_buffer`：读写 DDR3。
5. `ddr3_top`：DDR3 控制器。
6. `debayer_top`：RAW→RGB（固定增益 4/4/4）。
7. `dvi_encoder`：HDMI 发送（TMDS，带音频 infoframe）。
8. `dsi_tx`：MIPI DSI 发送。
9. `panel_config`：发送 panel 配置。

**环境准备**：确保 J2、J3 选 **1.2V**。

**LED 指示**：

| LED | 说明 |
|---|---|
| LED0（D0） | 1s 闪烁说明 DDR3 `cal_done` 为高；不闪说明校准有问题 |
| LED1（D1） | 1s 闪烁说明 sensor 接收到稳定视频信号 |

**注意**：顶层将 HS/VS 交换、R/B 交换；`video_format`、`audio_*`、`i_soc_clk` 等以隐式 1-bit 网络使用。

### 4.10 11_TI60F225_MIPI_CSI_loop_demo（CSI-2 自环）

目录内含两个工程：RGB 4lane 1.4Gbps 与 YUV422 4lane 1.0Gbps。

#### 11a. `Ti60F225_csi_rgb_4lane_loopback_1p4Gbps`

| 项目 | 值 |
|---|---|
| 工程文件 | `top.xml`（工程名 `top`） |
| 顶层 | `top`（`top.sv`） |
| 器件/时序 | Titanium / Ti60F225 / C4 |
| SDC | `mipi.sdc` |
| IP | `mipi_csi_rx`（efx_csi2_rx 5.15）、`efx_csi2_tx`（5.14） |

**功能**：CSI-2 TX→RX 外部自环。`efx_csi2_tx` 驱动 4 对 D-PHY TX，需物理环回至 4 对 RX；`mipi_csi_rx` 恢复数据，`color_bar_checker` 校验 48 位递增计数。

**参数**：`PIXEL_BIT=24, PACK_BIT=48`，`DATATYPE=0x24`（RGB888），`HACT=1920, VACT=1080, HSA=44, HBP=148, HFP=88, VSA=5, VBP=4, VFP=36`；IP `NUM_DATA_LANE=4, HS_BYTECLK_MHZ=175`（700MHz DDR → 1.4Gbps/lane，4lane 共 5.6Gbps）。

**时钟**：`pll_inst1`（PLL_TL0，25M）→ tx byte 175M、tx fast 700M、mipi_clk 100M；`pll_inst2`（PLL_BR0，100M）→ CLKOUT0 100M、pixel_clk 50M。

**LED**：`O_LED[0..2] = count_led[26]`，`O_LED[3] = flash_cnt[11]`（check_pass/fail 未引到 LED）。

#### 11b. `Ti60F225_csi_yuv422_4lane_loopback_1p0Gbps_v1`

| 项目 | 值 |
|---|---|
| 顶层 | `top`（`top.sv`） |
| 器件/时序 | Titanium / Ti60F225 / C4 |
| IP | `mipi_csi_rx`/`efx_csi2_tx`，`HS_BYTECLK_MHZ=125` |

**功能**：4lane CSI-2 YUV422 自环。彩条 → RGB→YCbCr → YUV444→YUV422（64 位 = 4 个 YUV422 像素/时钟）→ CSI-2 TX → 外部环回 → RX → `data_unpack` → 与 `pattern_gen` 黄金参考比较。

**参数**：`PIXEL_BIT=16, PACK_BIT=64`，`DATATYPE=0x1E`（YUV422 8-bit），`HACT=1920, VACT=1080, HSA=8, HBP=8, HFP=5000, VSA=1, VBP=1, VFP=100`；500MHz DDR → 1.0Gbps/lane，4lane 共 4.0Gbps。

**LED**：
```
O_LED[0] = count_led[26];
O_LED[1] = r_fail && count_led[26];   // 失败闪烁
O_LED[2] = r_pass && count_led[26];   // 通过闪烁
O_LED[3] = flash_cnt[11];
```

**MIPI 自环速率与像素时钟评估**：
- MIPI TX：`PIX_CLK_MHZ <= (DATARATE_MBPS * NUM_DATA_LANE) / PACK_BIT`
- MIPI RX：`PIX_CLK_MHZ >= (DATARATE_MBPS * NUM_DATA_LANE) / PACK_BIT`
- 例：DATARATE=1400、LANE=4、PACK_BIT=48 → `PIX_CLK <= 116.67MHz`。修改 lane 数后需用 utility 评估带宽是否 PASS。
- 也可通过 Debug 触发 `check_pass` 确认接收是否正确。

### 4.11 12_mipi_dsi_loop_demo（DSI 自环）

| 项目 | 值 |
|---|---|
| 工程文件 | `12_mipi_dsi_loop_demo/Ti60F225_dsi_loop_demo/ti60f225_demo.xml` |
| 顶层 | `TI60F225_MIPI_dsi`（`TI60F225_MIPI_dsi.v`） |
| 器件/时序 | Titanium / Ti60F225 / C4 |
| SDC | `ti60f225_demo.sdc` |
| IP | `mipi_dsi_rx`（efx_dsi_rx 5.3）、`efx_dsi_tx`（v5.11） |

**功能**：DSI TX→RX 外部自环，带完整视频测试图检查。
- `dsichk` 产生基于坐标的测试图（`{y,x}`），经 `vga_gen` → DSI TX（4lane）→ 物理环回 → DSI RX → `vga_chk` 重建期望 x/y/sync，比较 HSYNC/VSYNC 计数与像素数据。
- `panel_config` 通过 AXI4-Lite 推送 `IPhone_7p_1080p_reg.mem`，`o_confdone` 门控视频发生器。
- 参数：`NUM_DATA_LANE=4, HS_BYTECLK_MHZ=125` → 1.0Gbps/lane；`datatype=6'h3E`（RGB888），`PACK_48`；`MAX_HRES=1080, MAX_VRES=1920`（竖屏 1080×1920），`HSP=100, HBP=100, HFP=250, VSP=3, VBP=5, VFP=6`。

**时钟**：`pll_inst1`（PLL_TL0，25M）→ i_fb_clk 25M、i_sysclk 80M；`pll_inst2`（PLL_BR0，25M）→ mipi 100M、tx serial 500M、tx byte 125M；rx byte 125M。

**LED**：
```
led[0] = o_hsync_match;
led[1] = o_vsync_match;
led[2] = o_pdata_match;
led[3] = w_frame_cnt[5];
```

### 4.12 13_carrychain_prj_demo（进位链延时测量）

| 项目 | 值 |
|---|---|
| 工程文件 | `13_carrychain_prj_demo/carrychain_prj_v3/carrychain_prj.xml` |
| 顶层 | `carry_chain_top` |
| 器件/时序 | Titanium / Ti60F225 / I3 |
| Efinity | 2024.1.163.4.11 |
| SDC | `carrychain_prj.pt.sdc` |
| IP | 无（使用 `EFX_ADD`、`EFX_GBUFCE` 原语） |

**功能**：验证逻辑锁定功能，通过进位链做亚纳秒级延时/时间测量。
- `carry_chain #(.TAP(128))`：用 `EFX_ADD` 构建 128 级 ripple chain，600MHz 采样得到 `carry_tap[127:0]`。
- 记录从左进入的 `pos_left_one` 与从右进入的 `pos_right_one` 的 0 游程计数（`lef_zero_cnt`/`right_zero_cnt`），即边沿位置测量。
- `dyn_delay` 实例被注释，LVDS 动态 delay 由 VIO1 驱动。
- PnR 使用 `load_delaym=on`（对进位链延时模型重要）。
- LVDS RX/TX 各 1 对，`GPIOT_PN_12`/`GPIOT_PN_06`，dynamic delay，half rate，serial_width=4。

**时钟**：`pll_inst1`（PLL_TL0，25M）→ clk_100m、clk_600m（phase 2）、clk_300m。

**调试**：`debug_top.v` 内建 `la0`（6 probe，深度 128）、`vio0`、`vio1`。

### 4.13 17_Ti60F225_uart_demo（UART 回环）

| 项目 | 值 |
|---|---|
| 工程文件 | `17_Ti60F225_uart_demo/17_Ti60F225_uart_demo/top.xml` |
| 顶层 | `top`（`src/top.v`） |
| 器件/时序 | Titanium / Ti60F225 / C4 |
| Efinity | 2025.2.288.3.8 |
| SDC | `src/sdc/LED_8bit_Test.pt.sdc` |
| IP | 无 |

**功能**：115200-8N1 UART 回环/回显，27MHz 时钟，128 深度 FIFO 解耦收发。
- `DC_FIFO`（FIFO_MODE "Normal"，DATA_WIDTH 8，FIFO_DEPTH 128）收 `rx_data`，TX 需要时读出重发。
- `uart_rx_tx #(.CLK_RATE(27000000), .BPS_RATE(115200), .STOP_BIT_W(1), .CHECKSUM_EN(1'b0))`。
- RXD/TXD 在 TR bank；LED 指示：
```
assign led[1:0] = {rxd,txd};   // 正常收发时 D3/D4 闪烁
assign led[3:2] = 2'b11;       // 固定为暗
```
- 程序带 debug，可设触发条件为 `tx_valid`。

**时钟**：虽有 `pll_50m`/`pll_25m`/`pll_27m`，但逻辑实际只用原始 27MHz `gpio_clk_27m`，PLL 输出仅用于 `sys_pll_LOCKED` 复位门控。

> `src/key_detect.v` 与 `src/led_ctrl/` 为从 01 复制来的死代码，未在 `top.xml` 中。

---

## 五、通用开发流程

### 5.1 新建 Efinity 工程

1. 打开 Efinity，设置 Preferences，`Top Level project path` 指向工程目录。
2. `File → Create Project...`：
   - Name：工程名；
   - Location：工程位置；
   - Family：`Titanium`；
   - Device：`Ti60F225`；
   - Timing Mode：`I3`。
3. 在 Design 中设置 Top Module/Entity（**必须指定**，否则可能自动推断出错）。
4. 添加 IO：`show/Hide GPIO Resource Assigner` 可查看 IO 分配。
5. 添加片上晶振：Interface 中选 `Osillator` → 右键 `Create Block`；可选频率 10/20/40/80MHz。
6. 生成约束：点击 `Generate Efinity Constraint Files`，在 `outflow/` 生成 `xxx.pt.sdc`。
7. 把 sdc 拷贝出来手动补充约束（如外部时钟频率），右键 Constraint → add 添加 sdc。
8. 编译工程。
9. 程序测试。

### 5.2 添加 PLL / LVDS / MIPI

- PLL：Interface 中右键 PLL → Create Block，设置 Instance Name、PLL_Resource、Clock source，用 Automated Clock Calculation 生成。
- LVDS RX/TX：Interface 中右键 `LVDS/SLVS RX(TX)` → Create Block；注意 `LVDS_RX_CLK` 为 `PLL_IN` 属性；勾选 `Enable Deserialization`、`Enable Half Rate`，设置 Serial/Parallel Clock、Delay Mode（dynamic/static/dpa）。
- LVDS 信号控制示例：
```verilog
assign hdmi_rx_clk_RX_ENA = 1'b1;
assign hdmi_rx_d0_RX_ENA  = 1'b1;
assign hdmi_rx_d0_RX_RST  = 1'b0;
assign tmds_tx_data0_TX_OE  = 1'b1;
assign tmds_tx_data0_TX_RST = 1'b0;
```
- MIPI：使用 IP Catalog 中的 `efx_csi2_rx` / `efx_dsi_tx` / `efx_csi2_tx`，或 Interface 中的 MIPI D-PHY 块。

### 5.3 程序下载与固化

- **JTAG 下载（SRAM）**：Programmer 选择 `*.bit`，直接下载，掉电丢失。
- **Flash 固化（SPI Active）**：选择 `*.hex`，Programming Mode 选 `SPI Active using JTAG Bridge`，Start Program；提示 `JTAG2SPI programming…done` 完成。
- **SoC 镜像合成**：逻辑 hex @ `0x000000` + 软件 bin/hex @ `0x380000`，用 `Combine Multiple Image Files` 合成后烧写。
- **AS 模式**：见 [2.6](#26-jtag-下载与编程方式)。

### 5.4 调试

- 使用 Efinity Debugger（LA/VIO）通过 JTAG 观测/驱动内部信号；工程内 `debug_profile.wizard.json` 记录配置，`la*_waveform.vcd` 为波形。
- RISC-V SoC 使用 Efinity RISC-V IDE + OpenOCD（见 [4.7](#47-08_ti60f225_soc_demorisc-v-sapphire-soc)）。

### 5.5 学习资料（公众号）

文档中提供了若干易灵思学习资料链接：Efinity 软件安装-v5、下载器驱动安装-v2、Efinity 入门使用-v8、InterfaceDesinger 使用案例-v4、LVDS-V1、Efinity RISC-V IDE 入门使用-4、RISCV 操作常见问题集-v7、RISCV soft JTAG 调试_v1.2、自定义 RISC-V bootloader-v3 等。

---

## 六、工具版本与工程属性汇总

| 工程 | 工程文件 | 顶层模块 | 器件/时序 | Efinity | SDC |
|---|---|---|---|---|---|
| 01 Key/LED/OSC | `LED_8bit_Test.xml` | `LED_8bit_Test` | Ti60F225 / C4 | 2026.1.132.4.5 | `src/sdc/LED_8bit_Test.pt.sdc` |
| 02 HDMI RX→TX | `DDR3_MC.xml` | `example_top` | Ti60F225 / I3 | 2025.2.288.3.8 | `DDR3_MC.pt.sdc` |
| 03 HDMI TX | `led_demo.xml` | `top` | Ti60F225 / C4 | 2024.2.294.3.14 | `led_test.pt.sdc` |
| 04 GE | `led_demo.xml` | `top` | Ti60F225 / I3 | 2025.2.288.4.15 | `led_test.pt.sdc` |
| 05 LVDS | `lvds_loopback.xml` | `lvds_loopback_top` | Ti60F225 / I3 | 2025.2.288.3.8 | `sdc/lvds_loopback.sdc` |
| 07 CSI2→DSI | `ti60f225_oob.xml` | `ti60f225_oob_top` | Ti60F225 / I3 | 2025.2.288.3.8 | `ti60f225_oob.sdc` |
| 08 SOC hardjtag | `ddr_demo_ti60.xml` | `ddr3_example_top` | Ti60F225 / I3 | 2025.2.288.3.8 | `sdc/ddr3.sdc` |
| 08 SOC co_debug | `ddr_demo_ti60.xml` | `ddr3_example_top` | Ti60F225 / I3 | 2025.2.288.3.8 | `sdc/ddr3.sdc` |
| 09 HDMI→DSI | `ti60f225_demo.xml` | `TI60F225_MIPI_dsi` | Ti60F225 / I3 | 2025.2.288.3.8 | `ti60f225_demo.sdc` |
| 10 CSI→HDMI | `ti60f225_oob.xml` | `ti60f225_oob_top` | Ti60F225 / I3 | 2025.2.288.4.15 | `ti60f225_oob.sdc` |
| 11a CSI RGB | `top.xml` | `top` | Ti60F225 / C4 | — | `mipi.sdc` |
| 11b CSI YUV | `top.xml` | `top` | Ti60F225 / C4 | — | `mipi.sdc` |
| 12 DSI loop | `ti60f225_demo.xml` | `TI60F225_MIPI_dsi` | Ti60F225 / C4 | — | `ti60f225_demo.sdc` |
| 13 carrychain | `carrychain_prj.xml` | `carry_chain_top` | Ti60F225 / I3 | 2024.1.163.4.11 | `carrychain_prj.pt.sdc` |
| 17 UART | `top.xml` | `top` | Ti60F225 / C4 | 2025.2.288.3.8 | `src/sdc/LED_8bit_Test.pt.sdc` |

**IP 使用情况**：

| 工程 | IP |
|---|---|
| 07 | `csi_rx_controller`（efx_csi2_rx 5.9）、`dsi_tx`（efx_dsi_tx 5.13） |
| 08 | `soc`（efx_soc 3.3.0 / EfxSapphireSoc） |
| 09 | `dsi_tx`（efx_dsi_tx 5.13） |
| 10 | `csi_rx_controller`（efx_csi2_rx 5.6）、`dsi_tx`（efx_dsi_tx 5.10） |
| 11a | `mipi_csi_rx`（efx_csi2_rx 5.15）、`efx_csi2_tx`（5.14） |
| 11b | `mipi_csi_rx`（efx_csi2_rx 5.14）、`efx_csi2_tx`（5.14） |
| 12 | `mipi_dsi_rx`（efx_dsi_rx 5.3）、`efx_dsi_tx`（5.11） |
| 01/03/04/05/13/17 | 无 IP（仅接口级 PLL/OSC/LVDS） |
| 02 | `ip/efx_fifo` 为遗留未实例化 |

---

## 七、常见问题与注意事项

1. **Bank 电压必须与 Interface 一致**：BR/BL/TR/TL 为 3.3V，误选 1.8V 会烧坏 VCCIO；MIPI 必须 1.2V；LVDS 必须 1.8V。
2. **J2/J3 选择**：MIPI 选 1.2V，LVDS 选 1.8V；更换用途时务必先改跳线。
3. **上电时序**：VCC/VCCA 先上，VCCAUX/VCCIO 后上；复位需等电源稳定。
4. **FPGA 差分对 P/N 对调**（HDMI）。
5. **HDMI 勾选 Enable Common Mode Driver**。
6. **FLASH CLK 脚不预留电容**。
7. **新建工程必须指定 Top Module**。
8. **Java8 依赖**：旧工程升级/生成 IP 报 `'java' 不是内部或外部命令` 时，安装 `jre-8u381-windows-x64.exe`，重启 Efinity。
9. **IP 升级时关闭 RISC-V IDE**，升级后可能需要修改 OpenOCD cfg。
10. **下载器 VCC 必须连接**，否则内部电平转换芯片不工作；UART 电平由 VCC 决定。
11. **SoC 固化地址**：逻辑 `0x000000`，软件 `0x380000`；bootloader 位于 `0xF9000000`。
12. **SDC 中的占位符**：多个工程保留 `create_clock -period <USER_PERIOD> [get_ports {...}]`，需要手动填入实际频率。
13. **大量遗留死代码**：多个工程（02、03、04、08、10、11、13、17）包含未实例化的模块、`.bak`、旧 IP、SDC 模板等，阅读时以 XML 中 `<design_info>` 文件列表和顶层实例为准。
14. **07/10 的 SDC 占位符与 05 的时序模型标注**：05 的 SDC 头写 C4 而工程为 I3，属旧模板残留。
15. **自环 demo 的物理连接**：11（CSI）和 12（DSI）需要将 TX 差分对物理环回到 RX 差分对。
16. **修改 MIPI DSI 参数后**：需在 `Titanium-mipi-utility` 验证并同步更新 `Panel_1080p_reg.mem`。
17. **并发调试**：仅 v2025.2 及以上支持，且 Soft Debug Tap 与 Co-Debug 互斥。

---

## 附录 A：顶层工程文件与顶层模块速查

| 编号 | 工程根目录 | 工程 XML | 顶层 RTL |
|---|---|---|---|
| 01 | `01_Ti60F225_Key_led_osc_demo/01_Ti60F225_key_demo` | `LED_8bit_Test.xml` | `src/LED_8bit_Test.v` |
| 02 | `02_Ti60F225_hdmi_demo/02_Ti60F225_hdmi_rx2tx_loop_v19/efinity_project` | `DDR3_MC.xml` | `source/top_module/example_top.v` |
| 03 | `03_hdmi_tx_demo/hdmi_tx_demo_v2` | `led_demo.xml` | `rtl/top.v` |
| 04 | `04_Ti60f225_GE_demo/04_Ti60F225_tse_hj_demo_v5` | `led_demo.xml` | `rtl/top.v` |
| 05 | `05_Ti60F225_lvds_loop_demo/04_Ti60F225_LVDS_demo_v1.1/Efinity_2022.1.226_V1.0` | `lvds_loopback.xml` | `../rtl/lvds_loopback_top.v` |
| 07 | `07_Ti60F225_MIPI_C2D_Demo/Ti60f225_csi2dsi_sc431hai_v3.4` | `ti60f225_oob.xml` | `rtl/ti60f225_oob_top.v` |
| 08 | `08_ti60f225_soc_demo/09_Ti60F225_hardjtag_demo/par/ddr_demo_ti60` | `ddr_demo_ti60.xml` | `rtl/ddr3_example_top.v` |
| 08 | `08_ti60f225_soc_demo/09_Ti60F225_co_debug_demo/par/ddr_demo_ti60` | `ddr_demo_ti60.xml` | `rtl/ddr3_example_top.v` |
| 09 | `09_Ti60F225_hdmi2dsi_Demo/Ti60F225_hdmi2dsi_J7_1Gpsb_V10` | `ti60f225_demo.xml` | `TI60F225_MIPI_dsi.v` |
| 10 | `10_Ti60f225_sc431hai2hdmi_demo/Ti60f225_sc431hai2hdmi_v1` | `ti60f225_oob.xml` | `rtl/ti60f225_oob_top.v` |
| 11a | `11_TI60F225_MIPI_CSI_loop_demo/Ti60F225_csi_rgb_4lane_loopback_1p4Gbps` | `top.xml` | `top.sv` |
| 11b | `11_TI60F225_MIPI_CSI_loop_demo/Ti60F225_csi_yuv422_4lane_loopback_1p0Gbps_v1` | `top.xml` | `top.sv` |
| 12 | `12_mipi_dsi_loop_demo/Ti60F225_dsi_loop_demo` | `ti60f225_demo.xml` | `TI60F225_MIPI_dsi.v` |
| 13 | `13_carrychain_prj_demo/carrychain_prj_v3` | `carrychain_prj.xml` | `carry_chain_top.v` |
| 17 | `17_Ti60F225_uart_demo/17_Ti60F225_uart_demo` | `top.xml` | `src/top.v` |

---

## 附录 B：资料与文件清单

### 主板资料

| 文件 | 说明 |
|---|---|
| `TI60F225I3-V4 DEMO板软硬件设计说明-260813-1.pdf` | 软硬件设计说明（硬件篇 + 软件篇） |
| `Ti60F225A_V4_SCH.pdf` | 主板原理图（13 页） |
| `TI60F225_DEMOBOARD-装配图.pdf` | 装配/位号图 |

### 子卡原理图（`子卡原理图/`）

| 文件 | 说明 |
|---|---|
| `CSI2QSE_MIPI.pdf` | QSE 转两路 MIPI CSI 15pin FPC（树莓派 Sensor） |
| `MIPI DSI subcard.pdf` | QSE 转两路 MIPI 22pin FPC |
| `MIPI DSI Driver.pdf` | MIPI LCD 背光/偏压驱动板 |
| `QSE转排针.pdf` | QSE 转 2×20 2.54mm 排针 |
| `JJX035FHD05-V9_...pdf` | 3.5" 1920×1080 MIPI LCD 屏规格书 |

### 驱动与软件（`驱动安装及说明/`、`软件安装包/`）

| 文件 | 说明 |
|---|---|
| `炫览下载器说明及驱动安装-v2.1.pdf` | 下载器说明与驱动安装 |
| `zadig-2.8.exe` | Zadig 通用 USB 驱动工具 |
| `XL_YLS_DL_Composite_Parent/` | 同时安装 Interface0+1 的驱动包 |
| `XL_YLS_DL_Interface_0/` | 仅 Interface 0（AS 下载）驱动包 |
| `XL_YLS_DL_Interface_1/` | 仅 Interface 1（JTAG）驱动包 |
| `软件安装包/jre-8u381-windows-x64.exe` | Java Runtime 8u381（Efinity/RISC-V IDE 依赖） |

> 下载器驱动 HWID：Interface 0 = `VID_0403&PID_6010&MI_00`，Interface 1 = `VID_0403&PID_6010&MI_01`；Composite Parent = `VID_0403&PID_6010`；驱动由 `libusbK` 提供。

---

*文档结束。*
