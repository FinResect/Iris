//=====================================================================
// MIPI CSI-2 RX (J4 sensor interface)
//   - Efinix hard MIPI D-PHY RX (configured in iris_ws.peri.xml)
//   - Efinix efx_csi2_rx soft IP (ip/csi_rx)
//   - J4 pin mapping (Ti60F225_DemoBoard_v4):
//       CLK  -> GPIOT_PN_09
//       D0   -> GPIOT_PN_07
//       D1   -> GPIOT_PN_10
//       D2   -> GPIOT_PN_06
//       D3   -> GPIOT_PN_11
//=====================================================================

module mipi_rx
(
    // clocks / reset
    input           clk,                // IP core clock (100MHz)
    input           clk_pixel,          // pixel domain clock (50MHz)
    input           reset_n,            // async reset, active low

    // D-PHY clock lane
    input           i_cam_ck_LP_P_IN,
    input           i_cam_ck_LP_N_IN,
    input           i_cam_ck_CLKOUT,
    output          o_cam_ck_HS_ENA,
    output          o_cam_ck_HS_TERM,

    // D-PHY data lane 0
    input  [7:0]    cam_d0_HS_IN,
    input           cam_d0_LP_P_IN,
    input           cam_d0_LP_N_IN,
    input           cam_d0_FIFO_EMPTY,
    output          cam_d0_FIFO_RD,
    output          cam_d0_HS_ENA,
    output          cam_d0_HS_TERM,
    output          cam_d0_RST,

    // D-PHY data lane 1
    input  [7:0]    cam_d1_HS_IN,
    input           cam_d1_LP_P_IN,
    input           cam_d1_LP_N_IN,
    input           cam_d1_FIFO_EMPTY,
    output          cam_d1_FIFO_RD,
    output          cam_d1_HS_ENA,
    output          cam_d1_HS_TERM,
    output          cam_d1_RST,

    // D-PHY data lane 2
    input  [7:0]    cam_d2_HS_IN,
    input           cam_d2_LP_P_IN,
    input           cam_d2_LP_N_IN,
    input           cam_d2_FIFO_EMPTY,
    output          cam_d2_FIFO_RD,
    output          cam_d2_HS_ENA,
    output          cam_d2_HS_TERM,
    output          cam_d2_RST,

    // D-PHY data lane 3
    input  [7:0]    cam_d3_HS_IN,
    input           cam_d3_LP_P_IN,
    input           cam_d3_LP_N_IN,
    input           cam_d3_FIFO_EMPTY,
    output          cam_d3_FIFO_RD,
    output          cam_d3_HS_ENA,
    output          cam_d3_HS_TERM,
    output          cam_d3_RST,

    // decoded pixel stream (VC0)
    output          pixel_data_valid,
    output [63:0]   pixel_data,
    output [3:0]    pixel_per_clk,
    output [5:0]    datatype,
    output [15:0]   word_count,
    output          hsync,
    output          vsync,
    output          irq
);

//=====================================================================
// per-domain reset synchronizers
//=====================================================================
wire reset_byte_HS_n;
wire reset_pixel_n;

reset #(.IN_RST_ACTIVE("LOW"), .OUT_RST_ACTIVE("LOW"), .CYCLE(3))
u_rst_byte_HS (
    .i_arst (reset_n),
    .i_clk  (i_cam_ck_CLKOUT),
    .o_srst (reset_byte_HS_n)
);

reset #(.IN_RST_ACTIVE("LOW"), .OUT_RST_ACTIVE("LOW"), .CYCLE(3))
u_rst_pixel (
    .i_arst (reset_n),
    .i_clk  (clk_pixel),
    .o_srst (reset_pixel_n)
);

//=====================================================================
// CSI-2 RX controller (efx_csi2_rx 5.17, 4-lane, RAW10, continuous clock)
//=====================================================================
csi_rx_controller u_csi_rx
(
    .reset_n            (reset_n),
    .clk                (clk),
    .reset_byte_HS_n    (reset_byte_HS_n),
    .clk_byte_HS        (i_cam_ck_CLKOUT),
    .reset_pixel_n      (reset_pixel_n),
    .clk_pixel          (clk_pixel),

    // clock lane
    .Rx_LP_CLK_P        (i_cam_ck_LP_P_IN),
    .Rx_LP_CLK_N        (i_cam_ck_LP_N_IN),
    .Rx_HS_enable_C     (o_cam_ck_HS_ENA),
    .LVDS_termen_C      (o_cam_ck_HS_TERM),

    // data lanes
    .Rx_LP_D_P          ({cam_d3_LP_P_IN, cam_d2_LP_P_IN, cam_d1_LP_P_IN, cam_d0_LP_P_IN}),
    .Rx_LP_D_N          ({cam_d3_LP_N_IN, cam_d2_LP_N_IN, cam_d1_LP_N_IN, cam_d0_LP_N_IN}),
    .Rx_HS_D_0          (cam_d0_HS_IN),
    .Rx_HS_D_1          (cam_d1_HS_IN),
    .Rx_HS_D_2          (cam_d2_HS_IN),
    .Rx_HS_D_3          (cam_d3_HS_IN),
    .Rx_HS_D_4          (8'd0),
    .Rx_HS_D_5          (8'd0),
    .Rx_HS_D_6          (8'd0),
    .Rx_HS_D_7          (8'd0),
    .Rx_HS_enable_D     ({cam_d3_HS_ENA, cam_d2_HS_ENA, cam_d1_HS_ENA, cam_d0_HS_ENA}),
    .LVDS_termen_D      ({cam_d3_HS_TERM, cam_d2_HS_TERM, cam_d1_HS_TERM, cam_d0_HS_TERM}),
    .fifo_rd_enable     ({cam_d3_FIFO_RD, cam_d2_FIFO_RD, cam_d1_FIFO_RD, cam_d0_FIFO_RD}),
    .fifo_rd_empty      ({cam_d3_FIFO_EMPTY, cam_d2_FIFO_EMPTY, cam_d1_FIFO_EMPTY, cam_d0_FIFO_EMPTY}),

    .DLY_enable_D       (),
    .DLY_inc_D          (),
    .u_dly_enable_D     (4'd0),
    .u_dly_inc_D        (4'd0),

    // AXI4-Lite (unused, tied off)
    .axi_clk            (clk),
    .axi_reset_n        (reset_n),
    .axi_awaddr         (6'd0),
    .axi_awvalid        (1'b0),
    .axi_awready        (),
    .axi_wdata          (32'd0),
    .axi_wvalid         (1'b0),
    .axi_wready         (),
    .axi_bvalid         (),
    .axi_bready         (1'b0),
    .axi_araddr         (6'd0),
    .axi_arvalid        (1'b0),
    .axi_arready        (),
    .axi_rdata          (),
    .axi_rvalid         (),
    .axi_rready         (1'b1),

    // virtual channel 0
    .hsync_vc0          (hsync),
    .hsync_vc1          (),
    .hsync_vc2          (),
    .hsync_vc3          (),
    .hsync_vc4          (),
    .hsync_vc5          (),
    .hsync_vc6          (),
    .hsync_vc7          (),
    .hsync_vc8          (),
    .hsync_vc9          (),
    .hsync_vc10         (),
    .hsync_vc11         (),
    .hsync_vc12         (),
    .hsync_vc13         (),
    .hsync_vc14         (),
    .hsync_vc15         (),
    .vsync_vc0          (vsync),
    .vsync_vc1          (),
    .vsync_vc2          (),
    .vsync_vc3          (),
    .vsync_vc4          (),
    .vsync_vc5          (),
    .vsync_vc6          (),
    .vsync_vc7          (),
    .vsync_vc8          (),
    .vsync_vc9          (),
    .vsync_vc10         (),
    .vsync_vc11         (),
    .vsync_vc12         (),
    .vsync_vc13         (),
    .vsync_vc14         (),
    .vsync_vc15         (),
    .vc                 (),
    .vcx                (),
    .word_count         (word_count),
    .shortpkt_data_field(),
    .datatype           (datatype),
    .pixel_per_clk      (pixel_per_clk),
    .pixel_data         (pixel_data),
    .pixel_data_valid   (pixel_data_valid),
    .irq                (irq)
);

// 5.9 IP has no fifo_rd_reset output: hold the D-PHY data-lane reset low
assign cam_d0_RST = 1'b0;
assign cam_d1_RST = 1'b0;
assign cam_d2_RST = 1'b0;
assign cam_d3_RST = 1'b0;

endmodule
