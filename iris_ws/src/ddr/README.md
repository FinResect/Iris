# DDR3

This directory contains the Ti60F225 DDR3 controller used by Iris.

- Memory: MT41J128M16, 16-bit DDR3
- AXI data width: 128 bits
- Fabric clock: 100 MHz
- DDR clock: 400 MHz, with separate read/write calibration clocks
- Controller entry point: `ddr3_wrapper`

The controller and PHY sources under `ddr3_controller/` are copied from the
validated Ti60F225 board demo. The wrapper exposes the controller's AXI4
slave interface and the split DDR3 PHY signals used by Interface Designer.

The current top-level instance keeps AXI request channels idle. It brings up
the PHY and exposes `cal_done`; a frame-buffer or SoC AXI master can be
connected to `ddr3_wrapper` when that client is added.
