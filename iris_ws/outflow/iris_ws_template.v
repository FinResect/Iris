
// Efinity Top-level template
// Version: 2026.1.132.4.5
// Date: 2026-09-17 02:40

// Copyright (C) 2013 - 2026 Efinix Inc. All rights reserved.

// This file may be used as a starting point for Efinity synthesis top-level target.
// The port list here matches what is expected by Efinity constraint files generated
// by the Efinity Interface Designer.

// To use this:
//     #1)  Save this file with a different name to a different directory, where source files are kept.
//              Example: you may wish to save as iris_ws.v
//     #2)  Add the newly saved file into Efinity project as design file
//     #3)  Edit the top level entity in Efinity project to:  iris_ws
//     #4)  Insert design content.


module iris_ws
(
  (* syn_peri_port = 0 *) input rxd,
  (* syn_peri_port = 0 *) input hdmi_tx_locked,
  (* syn_peri_port = 0 *) input hdmi_tx_slow_clk,
  (* syn_peri_port = 0 *) input FB,
  (* syn_peri_port = 0 *) input hdmi_tx_fast_clk,
  (* syn_peri_port = 0 *) input gpio_clk_27m,
  (* syn_peri_port = 0 *) input CLK_25M,
  (* syn_peri_port = 0 *) output txd,
  (* syn_peri_port = 0 *) output tmds_clk_TX_OE,
  (* syn_peri_port = 0 *) output [9:0] tmds_clk_o,
  (* syn_peri_port = 0 *) output tmds_clk_TX_RST,
  (* syn_peri_port = 0 *) output tmds_data0_TX_OE,
  (* syn_peri_port = 0 *) output [9:0] tmds_data0_o,
  (* syn_peri_port = 0 *) output tmds_data0_TX_RST,
  (* syn_peri_port = 0 *) output tmds_data1_TX_OE,
  (* syn_peri_port = 0 *) output [9:0] tmds_data1_o,
  (* syn_peri_port = 0 *) output tmds_data1_TX_RST,
  (* syn_peri_port = 0 *) output tmds_data2_TX_OE,
  (* syn_peri_port = 0 *) output [9:0] tmds_data2_o,
  (* syn_peri_port = 0 *) output tmds_data2_TX_RST,
  (* syn_peri_port = 0 *) output [3:0] led
);


endmodule

