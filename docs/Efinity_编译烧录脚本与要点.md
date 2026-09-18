# Efinity 编译/烧录脚本与要点（Iris 工程）

> 适用范围：本仓库 `iris_ws` 工程的命令行编译、烧录、清理，以及踩过的坑与增量编译调研。
> 工具链版本：Efinity `2026.1.132.4.5`（器件 `Titanium / Ti60F225`，时序档 `I3`）。
> 相关脚本统一放在仓库根目录 `.script/`。

---

## 1. 目录与脚本总览

| 文件 | 作用 | 是否需要 Efinity |
|---|---|---|
| `.script/efinity-env` | 共享 helper：解析 `EFINITY_HOME` 并 `source setup.sh`（被 build/sync/setup-env 脚本 source） | 是 |
| `.script/setup-env` | 一键环境配置：解析 `EFINITY_HOME` + 装 USB 规则 + 版本校验 | 是 |
| `.script/build-iris` | 编译：map → interface → 修 sdc → pnr → pgm | 是 |
| `.script/sync-iris` | 烧录：`efx_run -f program`，默认 `jtag_bridge`（经 JTAG 桥烧 flash），可传 `jtag`/`passive` | 是 |
| `.script/clean-iris` | 清理编译产物（`outflow/`、`work_*/`、`iris_ws.pt.sdc`） | 否（纯 `rm`） |
| `.script/setup-usb` | 安装 USB udev 规则并重载（需 sudo），给 Efinix 下载器节点授权 | 否 |
| `.script/80-efx-pgm.rules` | udev 规则文件（无组 `MODE=0666`），由 `setup-usb` 安装 | 否 |

工程目录：`iris_ws/`，顶层模块 `top`，工程文件 `iris_ws/iris_ws.xml`。

用法：

```bash
.script/setup-env           # 首次/换机：一键环境配置（EFINITY_HOME + USB 规则），之后拔插一次
.script/build-iris          # 全量编译，生成 bit/hex
.script/sync-iris           # 默认 jtag_bridge：经 JTAG 桥烧 SPI flash（掉电保持）
.script/sync-iris jtag      # 写 SRAM（掉电丢失，调试快）
.script/sync-iris active    # SPI 直连（板载 USB 下载器不支持，需外接下载器）
.script/clean-iris          # 清掉编译产物
```

---

## 2. EFINITY_HOME 的解析与持久化

`efinity-env` 按以下优先级确定 `EFINITY_HOME`（Efinity 安装根目录，如 `/home/fr/efinity/2026.1`）：

1. 环境变量 `EFINITY_HOME`（若在 `~/.bashrc` 里 export 过，优先用它）；
2. 配置文件 `Iris/path/efinity_home`（首次输入后自动写入，之后免提示）；
3. 都没有时，交互式提示输入，并写入上述配置文件。

然后 `source "$EFINITY_HOME/bin/setup.sh"` 设置 `PATH`/`PYTHONPATH` 等。

> 配置文件由首选用例输入并持久化，避免每次运行都提示。路径失效时会自动清除并重新提示。
> `path/` 已加入 `.gitignore`，不会把本机路径提交进仓库。

---

## 3. 编译流程与产物

### 3.1 流程

`build-iris` 按阶段执行（**不是**一步 `-f compile`，原因见 5.3）：

```
map  ──► interface ──► [patch sdc] ──► pnr ──► pgm
综合     接口/约束      补时钟周期     布局布线  生成 bit/hex
```

对应命令：

```bash
efx_run --prj iris_ws -f map
efx_run --prj iris_ws -f interface
sed -i 's|<USER_PERIOD> -name CLK_25M|40.000 -name CLK_25M|; s|<USER_PERIOD> -name gpio_clk_27m|37.037 -name gpio_clk_27m|' outflow/iris_ws.pt.sdc
efx_run --prj iris_ws -f pnr
efx_run --prj iris_ws -f pgm
```

### 3.2 产物位置

| 类别 | 默认位置 | 内容 |
|---|---|---|
| 主要产物 | `iris_ws/outflow/` | `iris_ws.bit`、`iris_ws.hex`、`.pt.sdc`、`.pinout.*`、`.timing.rpt`、各类报告 |
| 综合中间 | `iris_ws/work_syn/` | map 临时文件 |
| 布线中间 | `iris_ws/work_pnr/` | pnr 临时文件 |
| 仿真中间 | `iris_ws/work_sim/` | 仿真临时文件（若跑过） |

### 3.3 产物位置可以指定

- 主产物目录：`efx_run ... --output_dir <路径>`（默认 `outflow`，相对工程目录；见 `efx_run.py` 的 `default_outdir`）。
- 中间 work 目录：`efx_run ... --work_dir <路径>`，或改 `iris_ws.xml` 里的
  `<efx:param name="work_dir" value="work_syn"/>` / `value="work_pnr"`。

> 注意：若改了 `--output_dir`，`build-iris` 里 patch sdc 的路径 `outflow/iris_ws.pt.sdc` 要同步改。

### 3.4 `-f full` 与 `-f compile` 的区别

- `-f compile` = 综合 + 接口 + 布线 + 生成 bit/hex（**构建用这个**）。
- `-f full` = 在 compile 基础上**还包含 RTL/映射/布线仿真**，无 testbench 时会报 Python 异常。故构建不要用 `full`。

---

## 4. 烧录流程

### 4.1 模式与文件格式对应

| 模式 (`--pgm_opts mode=...`) | 用到的产物 | 说明 |
|---|---|---|
| `jtag_bridge`（默认） | `outflow/iris_ws.hex` | 经 **JTAG 桥**写 SPI flash，掉电保持、上电自启动（板载 USB 下载器的推荐方式） |
| `jtag` | `outflow/iris_ws.bit` | 直接写 FPGA SRAM，掉电丢失，迭代快（**已验证可用**） |
| `active` | `outflow/iris_ws.hex` | SPI **直连** flash；板载 USB 下载器**不支持**，需外接下载器接到 `J6` 的 SPI 引脚并拉低 `CRESET_N` |
| `passive` | `outflow/iris_ws.hex` | 由外部主控提供时钟/数据 |

命令形态：

```bash
efx_run --prj iris_ws -f program --pgm_opts "mode=jtag_bridge"
```

> 板卡用户手册 2.6：**默认连接 USB，通过 JTAG Bridge 编程 flash**。用 `active` 会报
> `could not get flash device`（直连 SPI 读不到 flash），那是选错模式的预期现象，不是故障。

**`jtag_bridge` 需要先加载「JTAG Bridge 位流」**：它是 Efinity 自带的一段桥接位流，先配置进 FPGA，
工具才能经 JTAG 去读写 SPI flash。**GUI 的 Programmer 有 "Auto configure JTAG Bridge Image" 勾选框会自动做，
但 CLI 不会**——直接 `--pgm_opts mode=jtag_bridge` 会报：

```
Unsupported JTAG Bridge version: 0.0. Please choose the latest bundled JTAG Bridge image and then try again.
```

桥位流位置按器件 IDCODE 命名：`$EFINITY_HOME/pgm/fli/<family>/u<IDCODE>.bit`。
本板 Ti60F225 的 IDCODE = `0x10660A79` → `$EFINITY_HOME/pgm/fli/titanium/u10660A79.bit`。

手动两步（`sync-iris` 已自动封装这两步）：

```bash
B=$EFINITY_HOME/pgm/fli/titanium/u10660A79.bit
efx_run --prj iris_ws -f program --pgm_opts "mode=jtag" --pgm_opts "source=$B"   # 1) 加载桥位流
efx_run --prj iris_ws -f program --pgm_opts "mode=jtag_bridge"                   # 2) 经桥烧 flash
# 断电重上电验证从 flash 自启动
```

### 4.2 USB 权限（重要）

板卡用 **FT4232H**（USB `0403:6011`）完成供电+下载+UART。Linux 下访问原始 USB 设备节点需要 udev 给
**读写权限**，否则报：

```
An exception occurred: [Errno 13] Access denied (insufficient permissions)
```

> 说明：Linux 上官方说的「装 USB 驱动」（`install_usb_driver.sh`）其实就是**装 udev 规则**给节点授权，
> 不是 Windows 那种要换 `libusbK` 的内核驱动。

**一键安装（推荐）：**

```bash
.script/setup-usb           # 复制 .script/80-efx-pgm.rules 到 /etc/udev/rules.d/ 并重载
# 然后拔插一次 USB 线；确认节点权限：
ls -l /dev/bus/usb/*/*      # FT4232H 节点应为 crw-rw-rw-
```

规则内容（`MODE=0666` 世界可写，**故意不写 `GROUP=`**）：

```
SUBSYSTEM=="usb", ATTR{idVendor}=="0403", ATTR{idProduct}=="6011", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="0403", ATTR{idProduct}=="6010", MODE="0666"
```

**坑 1：官方规则用了不存在的 `plugdev` 组。** 官方 `80-efx-pgm.rules` 每条 FTDI 规则都写
`GROUP="plugdev"`；若该组不存在，udev 报 `Failed to resolve group 'plugdev', ignoring: Unknown group`，
且该行 `MODE=666` 不落地，节点保持默认 `crw-rw-r-- root root`。且 `plugdev` 是**非系统组**，
udev 会告警 deprecated。→ 改用上面的**无组规则**即可。

**坑 2：常驻 `udevd` 可能没真正加载新规则。** 判断方法：`udevadm test` 会显示
`80-efx-pgm.rules:NN MODE="666": Set mode: 0666`（模拟命中），但实际节点仍是 0664 —— 说明守护进程
还在用旧规则集。解决：

```bash
sudo udevadm control --reload
sudo udevadm trigger --action=change --subsystem-match=usb
# 仍不行则强制重启：
sudo systemctl restart systemd-udevd
# 再拔插 USB
```

**坑 3：节点号会变，`chmod` 不能持久。** 每次拔插/重枚举，设备号都会变（如 `/dev/bus/usb/001/013`
→ `.../014`），只 `chmod` 当前节点只是临时权宜；务必用 udev 规则让它对**任意节点号**生效。

**关于 `ftdi_sio`（更正）**：一度怀疑内核 `ftdi_sio` 占用接口导致失败，但实测在 `ftdi_sio` **加载状态下**
`jtag` 也能成功——只要节点权限正确。`ftdi_sio` 在本机**不是**障碍，无需卸载/黑名单。

### 4.3 烧录排错速查（症状 → 根因 → 修复）

| 症状 | 根因 | 修复 |
|---|---|---|
| `[Errno 13] Access denied (insufficient permissions)` | 设备节点无写权限 | `.script/setup-usb`（需 sudo）后拔插 USB |
| `could not get flash device`（`mode=active`） | 模式选错：`active` 是 SPI 直连，板载 USB 不支持 | 改用 `jtag_bridge`（或 `jtag`） |
| `Caught IOError from JtagEngine.configure() for url ...` | 目标节点权限不对（常见于重枚举后节点号变了，却只 `chmod` 了旧节点） | 让 udev 规则对任意节点号生效，**勿用 `chmod`** |
| `Unsupported JTAG Bridge version: 0.0`（`mode=jtag_bridge`） | CLI 未先加载 JTAG Bridge 位流 | 先 `mode=jtag source=<桥位流>`，再 `mode=jtag_bridge`（`sync-iris` 已自动两步） |
| 节点权限已是 `crw-rw-rw-` 仍失败 | udevd 未加载新规则 / 模式问题 | `udevadm control --reload` + trigger / 重启 udevd；确认模式 |

**已验证记录：**

```
$ .script/sync-iris jtag
Programming using Board Profile: Generic Board Profile Using FT4232H
Connecting to JTAG_TAP: efx_ti
JTAG Programming on ftdi://0x0403:0x6011:1:f/2
Programming 'outflow/iris_ws.bit' via JTAG at freq 3.0 MHz
Device ID read from JTAG: 0x10660A79
... finished with JTAG programming
烧录完成
```

> `jtag_bridge`（flash 固化）的"先桥位流、再烧 flash"两步已封装进 `.script/sync-iris`，
> 但**尚待在实板上确认**（若桥位流的 SPI 引脚与本板 flash 走线不匹配，会失败，届时改用 GUI Programmer
> 并勾选 "Auto configure JTAG Bridge Image"）。

---

## 5. 关键坑与修复记录

以下问题都在 `build-iris`/`sync-iris`/`efinity-env` 的联调中实际踩到并修复。

### 5.1 `setup.sh` 触发 SIGPIPE（退出码 141），时好时坏

- 现象：脚本偶发以 **141**（128+13，SIGPIPE）退出，且常**无任何输出**，多跑几次才成功。
- 原因：脚本开了 `set -o pipefail`，而官方 `setup.sh` 内含良性管道，如
  `SYSTEM_GLIBC_VERSION_STRING=$(ldd --version | head -n 1)`。
  当 `head` 读够行数提前关管道，上游 `ldd` 收到 SIGPIPE；`pipefail` 把整条管道判为失败，`-e` 于是中止脚本。
- 修复：在 `efinity-env` 里 `source setup.sh` 前后**临时关闭** `errexit/nounset/pipefail`，source 完再恢复。

### 5.2 `set -e` 恢复失败，导致失败不中止（曾“烧录失败却报成功”）

- 现象：`sync-iris` 明明烧录失败（`efx_run` 退出码 1），却继续打印“烧录完成”。
- 原因：最初用 `_s=$(set +o)` + `eval "$_s"` 保存/恢复选项。但 **bash 在 `$( )` 命令替换子 shell 中不继承 `-e`**
  （实测：外层 `$-=ehBc`，子 shell `$-=hBc`），于是把 `errexit` 误存为“关闭”，`eval` 后 `-e` 丢失。
- 修复：改为**显式记录并恢复** `e/u/pipefail`：

```bash
_saved_e=0; _saved_u=0; _saved_pf=0
if [[ $- == *e* ]]; then _saved_e=1; fi
if [[ $- == *u* ]]; then _saved_u=1; fi
if [[ -o pipefail ]]; then _saved_pf=1; fi

set +e +u
set +o pipefail
source "$SETUP_SH"

(( _saved_u ))  && set -u          || true
(( _saved_pf )) && set -o pipefail || true
(( _saved_e ))  && set -e          || true
```

- 附带：`sync-iris` 现用 `if ! efx_run ...; then ... exit 1; fi` 显式判断，失败时给出「USB 权限 / 模式选错」两类提示。

### 5.3 `setup.sh` 引用未定义变量 `$PYTHONPATH`（`set -u` 报错）

- 现象：`setup.sh: line 104: PYTHONPATH: unbound variable`。
- 原因：`setup.sh` 第 104 行 `export PYTHONPATH=$EFINITY_HOME/lib:$PYTHONPATH` 在 `$PYTHONPATH` 未设时，被 `set -u` 判为错误。
- 修复：脚本不启用 `-u`（用 `set -eo pipefail`），且 5.1 的临时关闭也覆盖了 `-u`。

### 5.4 sdc 里的 `<USER_PERIOD>` 占位符

- 现象：`interface` 步骤会**重新生成** `outflow/iris_ws.pt.sdc`，其中板级输入时钟写成占位符
  `create_clock -period <USER_PERIOD> -name CLK_25M`。
- 原因：Interface Designer 无法自动得知外部晶振频率（peri 的输入时钟 GPIO 没有频率字段），故留占位符由用户填。
- 修复：`build-iris` 在 `interface` 之后、`pnr` 之前用 `sed` 填入实际周期：
  - `CLK_25M` → `40.000`（25 MHz）
  - `gpio_clk_27m` → `37.037`（27 MHz）

> 本 L0 设计时序余量极大，不填也能跑通；但后续 L1+ 时钟变多后必须填，否则该时钟不受约束。
> 因此**不能用一步 `-f compile`**（它会在 pnr 前重新生成 sdc 覆盖手工填写）。

### 5.5 Interface Designer 的 peri 文件名必须是 `<工程名>.peri.xml`

- 现象：接口步骤在日志里打印 `Design file iris_ws.peri.xml doesn't exist, create a new one`，
  结果是**空的外设配置**（GPIO/PLL/LVDS 全为 0），引脚全部未分配。
- 原因：`efx_run_pt_unified.py` 默认按**工程名**取 peri 文件（`<design>.peri.xml`），而非 XML 里 `peri_file` 指定的名字。
- 修复：把外设配置文件命名为 `iris_ws.peri.xml`（与工程同名），并在 `iris_ws.xml` 里对应引用。

### 5.6 其它小坑

- 工程 `.xml` 会被工具重排格式（自闭合标签加空格），编辑时注意匹配。
- 外设 XML 里 PLL 的 `comp_output_clock` 必须正确闭合，标签不匹配会导致 lxml 解析失败。
- 编译失败时 `outflow/*.err.log`、`*.map.out`、`*.route.out` 是最直接的排查入口。

---

## 6. 增量编译调研（Efinity 2026.1）

> 结论：**CLI 没有简单的增量开关**；官方增量机制是 Partition Planner（Beta）。当前小工程用全量即可，
> 需要提速时优先考虑“脚本级分阶段”。

### 6.1 CLI 现状

- `efx_run` 的 `--flow` 选项只有 `compile / map / pnr / interface / pgm / program / …`，**没有 `incremental`**。
- 工程状态文件 `outflow/<design>.proj_state.ini` 会记录 `design_ood / place_ood / route_ood`，
  但 `efx_run.py` 只用它**写状态**，并不据此跳过阶段；跳过逻辑主要在 GUI（Dashboard 的 Run 按钮）。
- `efx_map`/`efx_pnr` 的 CLI 帮助里也没有 incremental/reuse 类选项。

### 6.2 官方增量方案

1. **Partition Planner（Beta，2026.1）** —— 把设计切成 partition，跨次编译复用结果。
   - 工程 XML 字段：`partition_definitions`、`partition_interface_assignments`（见 `enf_proj.xsd`）。
   - 支持三种工作流：团队并行、设计复用、**增量编译**。
   - 适合把稳定大模块（如 HDMI/LVDS、后续的 CNN IP）声明为 partition，只重编改动的部分。
   - 参考文档（本地）：`doc/topics/efn-pp-intro.html`、`efn-pp-output.html`、`efn-project-editor.html`。

2. **Out-of-Context (OOC) 综合** —— 把模块单独综合成黑盒网表，顶层直接例化，避免重复综合。
   - 工程里已有 `iris_ws/ooc/` 目录。
   - 参考文档：`doc/topics/syn-ooc.html`、`syn-ooc-design.html`、`syn-ooc-import.html`。

### 6.3 实用替代：脚本级分阶段（推荐先用这个）

全量编译对小设计很快，真正的痛点是“改一点全跑”。可按改动类型选择阶段：

| 改动 | 需要重跑 |
|---|---|
| RTL 逻辑 | map → interface → pnr → pgm（全量） |
| 仅 `iris_ws.peri.xml`（引脚/电压/PLL） | interface → pnr → pgm |
| 仅 sdc 约束 | pnr → pgm |
| 仅 bitstream 选项（`efx_pgm` 参数） | pgm |
| 仅烧录 | sync-iris |

需要时可把 `build-iris` 扩展成接受阶段参数（如 `build-iris map|pnr|pgm`），
或另加分阶段脚本；本次按需求**未实现**，仅作后续选项记录。

---

## 7. 常用命令速查

```bash
# 环境（可选，写入 ~/.bashrc 可免提示）
export EFINITY_HOME=/home/fr/efinity/2026.1

# 首次/换机：一键环境配置（EFINITY_HOME + USB 规则），之后拔插一次 USB
.script/setup-env

# 编译 / 烧录 / 清理
.script/build-iris           # 全量编译，生成 bit/hex
.script/sync-iris            # 默认 jtag_bridge（经桥烧 flash，掉电保持）
.script/sync-iris jtag       # 写 SRAM（掉电丢失，快）
.script/clean-iris           # 清掉编译产物

# 单独跑某阶段
source .script/efinity-env
cd iris_ws
efx_run --prj iris_ws -f map
efx_run --prj iris_ws -f interface
efx_run --prj iris_ws -f pnr
efx_run --prj iris_ws -f pgm
efx_run --prj iris_ws -f program --pgm_opts "mode=jtag"
# jtag_bridge 两步（sync-iris 已自动封装）：
B=$EFINITY_HOME/pgm/fli/titanium/u10660A79.bit
efx_run --prj iris_ws -f program --pgm_opts "mode=jtag" --pgm_opts "source=$B"
efx_run --prj iris_ws -f program --pgm_opts "mode=jtag_bridge"

# 排查
ls -l /dev/bus/usb/*/*          # USB 节点权限（FT4232H 应为 crw-rw-rw-）
udevadm test /sys/$(udevadm info -q path -n /dev/bus/usb/001/014)   # 规则是否命中
cat iris_ws/outflow/iris_ws.err.log
```

---

*文档基于 L0（LED + HDMI 彩条 + UART 回环）编译烧录过程中实际遇到的问题整理。*
