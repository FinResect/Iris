# Iris

基于 Efinix **Titanium Ti60F225I3**的实时风格化视频渲染系统工程。

- 工具链：Efinity `2026.1.132.4.5`
- 板卡：Ti60F225_DemoBoard_v4

## 目录结构

```
Iris/
├── iris_ws/          # Efinity 工程（top=top）
│   ├── iris_ws.xml        # 工程文件（源码清单 / peri / sdc 引用）
│   ├── iris_ws.peri.xml   # Interface Designer（引脚/电压/PLL/LVDS）
│   └── src/               # RTL 源码（top + hdmi + uart）
├── .script/          # 构建/烧录脚本
├── docs/             # 方案、板卡手册、编译烧录要点等
└── Ti60F225_DemoBoard_v4/   # 官方 Demo、驱动、原理图（gitignore）
```

## 快速开始

### 0. 前置

- Efinity `2026.1.132.4.5`
- Linux 环境

### 1. git clone

```bash
git clone https://github.com/FinResect/Iris.git
```

### 2. 环境配置

```bash
.script/setup-env
```

### 3. 编译

```bash
.script/build-iris
```

生成 `iris_ws/outflow/iris_ws.bit` 与 `iris_ws.hex`。

### 4. 烧录

```bash
.script/sync-iris          # 默认 jtag_bridge：经 JTAG 桥烧 SPI flash
.script/sync-iris jtag     # 写 SRAM
```

## 脚本一览（`.script/`）

| 脚本 | 作用 |
|---|---|
| `setup-env` | 一键环境配置：解析 `EFINITY_HOME` + 装 USB 规则 + 版本校验 |
| `setup-usb` | 安装 USB udev 规则并重载 |
| `80-efx-pgm.rules` | udev 规则文件（给 Efinix 下载器节点授权） |
| `build-iris` | 编译
| `sync-iris` | 烧录：默认 `jtag_bridge`，可传 `jtag`（SRAM）/`active`（需外接下载器） |
| `clean-iris` | 清理编译产物（`outflow/`、`work_*/`） |
| `efinity-env` | 共享 helper：解析 `EFINITY_HOME` 并 source `setup.sh` |

## 常见问题

- **烧录报 `Access denied (insufficient permissions)`**：USB 节点无写权限。运行 `.script/setup-usb`（或 `.script/setup-env`），然后拔插一次 USB。
- **`active` 模式报 `could not get flash device`**：`active` 是 SPI 直连，板载 USB 下载器不支持；用 `jtag_bridge`（flash）或 `jtag`（SRAM）。
- **`Unsupported JTAG Bridge version: 0.0`**：`jtag_bridge` 需先加载 JTAG Bridge 位流，`sync-iris` 已自动处理。
- **`setup.sh` 打印 `libstdc++` 警告**：仅为提示，不影响运行。
