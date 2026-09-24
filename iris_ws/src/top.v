//=====================================================================
// L0 merged top: official CSI->frame buffer->debayer->HDMI path.
//   MIPI RAW10 -> sensor_clipper -> frame_buffer (Bayer mosaic in DDR3) ->
//   debayer (display domain) -> RGB888 -> TMDS/HDMI 1080p.
//=====================================================================

module top
(
    ////////////////////////    CLOCK     ////////////////////////
    input                       gpio_clk_27m,     // 27MHz board clock (UART + LED)

    ////////////////////////    DDR3 clocks    ////////////////////////
    input                       core_clk,          // 100MHz system / AXI clock
    input                       core_pll_locked,
    input                       ddr_pll_locked,
    input                       ddr_tdqss_clk,     // 400MHz
    input                       ddr_tac_clk,       // 400MHz (dyn phase)
    input                       ddr_twd_clk,       // 400MHz
    input                       ddr_core_clk,      // 200MHz controller core

    ////////////////////////    DDR3 memory    ////////////////////////
    output                      ddr_reset,
    output                      ddr_cs,
    output                      ddr_ras,
    output                      ddr_cas,
    output                      ddr_we,
    output                      ddr_cke,
    output [15:0]               ddr_addr,
    output [2:0]                ddr_ba,
    output                      ddr_odt,
    output [1:0]                o_ddr_dm_hi,
    output [1:0]                o_ddr_dm_lo,
    input  [1:0]                i_ddr_dqs_hi,
    input  [1:0]                i_ddr_dqs_lo,
    input  [1:0]                i_ddr_dqs_n_hi,
    input  [1:0]                i_ddr_dqs_n_lo,
    output [1:0]                o_ddr_dqs_hi,
    output [1:0]                o_ddr_dqs_lo,
    output [1:0]                o_ddr_dqs_oe,
    output [1:0]                o_ddr_dqs_n_oe,
    input  [15:0]               i_ddr_dq_hi,
    input  [15:0]               i_ddr_dq_lo,
    output [15:0]               o_ddr_dq_hi,
    output [15:0]               o_ddr_dq_lo,
    output [15:0]               o_ddr_dq_oe,

    ////////////////////////    DDR3 PLL calibration   ////////////////////////
    (* syn_peri_port = 0 *) output [2:0] pll_shift,
    (* syn_peri_port = 0 *) output [4:0] pll_shift_sel,
    (* syn_peri_port = 0 *) output         pll_shift_ena,

    ////////////////////////    UART      ////////////////////////
    input                       rxd,
    output                      txd,

    ////////////////////////    LED       ////////////////////////
    output [3:0]                led,

    ////////////////////////    HDMI TX   ////////////////////////
    input                       hdmi_tx_locked,
    input                       hdmi_tx_slow_clk,
    input                       hdmi_tx_half_clk,
    output [9:0]                tmds_data0_o,
    output [9:0]                tmds_data1_o,
    output [9:0]                tmds_data2_o,
    output [9:0]                tmds_clk_o,
    output                      tmds_data0_TX_OE,
    output                      tmds_data1_TX_OE,
    output                      tmds_data2_TX_OE,
    output                      tmds_clk_TX_OE,
    output                      tmds_data0_TX_RST,
    output                      tmds_data1_TX_RST,
    output                      tmds_data2_TX_RST,
    output                      tmds_clk_TX_RST,

    ////////////////////////    MIPI RX (J4 sensor)   ////////////////////////
    (* syn_peri_port = 0 *) input           mipi_clk,
    (* syn_peri_port = 0 *) input           mipi_pixel_clk,
    (* syn_peri_port = 0 *) input           mipi_pll_locked,

    (* syn_peri_port = 0 *) input           i_cam_ck_LP_P_IN,
    (* syn_peri_port = 0 *) input           i_cam_ck_LP_N_IN,
    (* syn_peri_port = 0 *) input           i_cam_ck_CLKOUT,
    (* syn_peri_port = 0 *) output          o_cam_ck_HS_ENA,
    (* syn_peri_port = 0 *) output          o_cam_ck_HS_TERM,

    (* syn_peri_port = 0 *) input  [7:0]    cam_d0_HS_IN,
    (* syn_peri_port = 0 *) input           cam_d0_LP_P_IN,
    (* syn_peri_port = 0 *) input           cam_d0_LP_N_IN,
    (* syn_peri_port = 0 *) input           cam_d0_FIFO_EMPTY,
    (* syn_peri_port = 0 *) output          cam_d0_FIFO_RD,
    (* syn_peri_port = 0 *) output          cam_d0_HS_ENA,
    (* syn_peri_port = 0 *) output          cam_d0_HS_TERM,
    (* syn_peri_port = 0 *) output          cam_d0_RST,

    (* syn_peri_port = 0 *) input  [7:0]    cam_d1_HS_IN,
    (* syn_peri_port = 0 *) input           cam_d1_LP_P_IN,
    (* syn_peri_port = 0 *) input           cam_d1_LP_N_IN,
    (* syn_peri_port = 0 *) input           cam_d1_FIFO_EMPTY,
    (* syn_peri_port = 0 *) output          cam_d1_FIFO_RD,
    (* syn_peri_port = 0 *) output          cam_d1_HS_ENA,
    (* syn_peri_port = 0 *) output          cam_d1_HS_TERM,
    (* syn_peri_port = 0 *) output          cam_d1_RST,

    (* syn_peri_port = 0 *) input  [7:0]    cam_d2_HS_IN,
    (* syn_peri_port = 0 *) input           cam_d2_LP_P_IN,
    (* syn_peri_port = 0 *) input           cam_d2_LP_N_IN,
    (* syn_peri_port = 0 *) input           cam_d2_FIFO_EMPTY,
    (* syn_peri_port = 0 *) output          cam_d2_FIFO_RD,
    (* syn_peri_port = 0 *) output          cam_d2_HS_ENA,
    (* syn_peri_port = 0 *) output          cam_d2_HS_TERM,
    (* syn_peri_port = 0 *) output          cam_d2_RST,

    (* syn_peri_port = 0 *) input  [7:0]    cam_d3_HS_IN,
    (* syn_peri_port = 0 *) input           cam_d3_LP_P_IN,
    (* syn_peri_port = 0 *) input           cam_d3_LP_N_IN,
    (* syn_peri_port = 0 *) input           cam_d3_FIFO_EMPTY,
    (* syn_peri_port = 0 *) output          cam_d3_FIFO_RD,
    (* syn_peri_port = 0 *) output          cam_d3_HS_ENA,
    (* syn_peri_port = 0 *) output          cam_d3_HS_TERM,
    (* syn_peri_port = 0 *) output          cam_d3_RST,

    ////////////////////////    Camera I2C / reset (J4)   ////////////////////////
    (* syn_peri_port = 0 *) input           io_cam_scl_IN,
    (* syn_peri_port = 0 *) output          io_cam_scl_OUT,
    (* syn_peri_port = 0 *) output          io_cam_scl_OE,
    (* syn_peri_port = 0 *) input           io_cam_sda_IN,
    (* syn_peri_port = 0 *) output          io_cam_sda_OUT,
    (* syn_peri_port = 0 *) output          io_cam_sda_OE,
    (* syn_peri_port = 0 *) output          o_cam_rst
);

//=====================================================================
// MIPI CSI-2 RX (J4) + sensor frame clip
//=====================================================================
wire        mipi_data_valid;
wire [63:0] mipi_pixel_data;
wire [3:0]  mipi_pixel_per_clk;
wire [5:0]  mipi_datatype;
wire [15:0] mipi_word_count;
wire        mipi_hsync;
wire        mipi_vsync;
wire        mipi_irq;

wire        ddr_cal_done;
wire        ddr_cal_pass;
wire [7:0]  ddr_cal_fail_log;

wire        video_rst_n = mipi_pll_locked & core_pll_locked & ddr_pll_locked & hdmi_tx_locked;

mipi_rx u_mipi_rx
(
    .clk                    (mipi_clk),
    .clk_pixel              (mipi_pixel_clk),
    .reset_n                (mipi_pll_locked),

    .i_cam_ck_LP_P_IN       (i_cam_ck_LP_P_IN),
    .i_cam_ck_LP_N_IN       (i_cam_ck_LP_N_IN),
    .i_cam_ck_CLKOUT        (i_cam_ck_CLKOUT),
    .o_cam_ck_HS_ENA        (o_cam_ck_HS_ENA),
    .o_cam_ck_HS_TERM       (o_cam_ck_HS_TERM),

    .cam_d0_HS_IN           (cam_d0_HS_IN),
    .cam_d0_LP_P_IN         (cam_d0_LP_P_IN),
    .cam_d0_LP_N_IN         (cam_d0_LP_N_IN),
    .cam_d0_FIFO_EMPTY      (cam_d0_FIFO_EMPTY),
    .cam_d0_FIFO_RD         (cam_d0_FIFO_RD),
    .cam_d0_HS_ENA          (cam_d0_HS_ENA),
    .cam_d0_HS_TERM         (cam_d0_HS_TERM),
    .cam_d0_RST             (cam_d0_RST),

    .cam_d1_HS_IN           (cam_d1_HS_IN),
    .cam_d1_LP_P_IN         (cam_d1_LP_P_IN),
    .cam_d1_LP_N_IN         (cam_d1_LP_N_IN),
    .cam_d1_FIFO_EMPTY      (cam_d1_FIFO_EMPTY),
    .cam_d1_FIFO_RD         (cam_d1_FIFO_RD),
    .cam_d1_HS_ENA          (cam_d1_HS_ENA),
    .cam_d1_HS_TERM         (cam_d1_HS_TERM),
    .cam_d1_RST             (cam_d1_RST),

    .cam_d2_HS_IN           (cam_d2_HS_IN),
    .cam_d2_LP_P_IN         (cam_d2_LP_P_IN),
    .cam_d2_LP_N_IN         (cam_d2_LP_N_IN),
    .cam_d2_FIFO_EMPTY      (cam_d2_FIFO_EMPTY),
    .cam_d2_FIFO_RD         (cam_d2_FIFO_RD),
    .cam_d2_HS_ENA          (cam_d2_HS_ENA),
    .cam_d2_HS_TERM         (cam_d2_HS_TERM),
    .cam_d2_RST             (cam_d2_RST),

    .cam_d3_HS_IN           (cam_d3_HS_IN),
    .cam_d3_LP_P_IN         (cam_d3_LP_P_IN),
    .cam_d3_LP_N_IN         (cam_d3_LP_N_IN),
    .cam_d3_FIFO_EMPTY      (cam_d3_FIFO_EMPTY),
    .cam_d3_FIFO_RD         (cam_d3_FIFO_RD),
    .cam_d3_HS_ENA          (cam_d3_HS_ENA),
    .cam_d3_HS_TERM         (cam_d3_HS_TERM),
    .cam_d3_RST             (cam_d3_RST),

    .pixel_data_valid       (mipi_data_valid),
    .pixel_data             (mipi_pixel_data),
    .pixel_per_clk          (mipi_pixel_per_clk),
    .datatype               (mipi_datatype),
    .word_count             (mipi_word_count),
    .hsync                  (mipi_hsync),
    .vsync                  (mipi_vsync),
    .irq                    (mipi_irq)
);

wire [39:0] clip_hs, clip_vs, clip_de, clip_dat;
sensor_clipper u_sensor_clipper (
    .clk    (mipi_pixel_clk),
    .i_hs   (mipi_hsync),
    .i_vs   (mipi_vsync),
    .i_de   (mipi_data_valid),
    .i_dat  (mipi_pixel_data[39:0]),
    .o_hs   (clip_hs),
    .o_vs   (clip_vs),
    .o_de   (clip_de),
    .o_dat  (clip_dat)
);

// 4 RAW10 pixels -> 4 x 8-bit Bayer mosaic (packed 32-bit)
wire [31:0] fb_vin = {clip_dat[39:32], clip_dat[29:22],
                      clip_dat[19:12], clip_dat[9:2]};
wire        fb_ide = clip_de & clip_hs;
wire        fb_ihs = clip_hs;
wire        fb_ivs = clip_vs;

//=====================================================================
// DDR3 streaming frame buffer (Bayer mosaic), read side at 74.25MHz
//=====================================================================
// shared address channel: AXI bridge -> DDR3 soft controller
wire [7:0]  ddr_ax_aid;
wire [27:0] ddr_ax_aaddr;
wire [7:0]  ddr_ax_alen;
wire [2:0]  ddr_ax_asize;
wire [1:0]  ddr_ax_aburst;
wire [1:0]  ddr_ax_alock;
wire        ddr_ax_atype;
wire        ddr_ax_avalid;
wire        ddr_ax_aready;
wire [7:0]  ddr_ax_bid8;
wire [7:0]  ddr_ax_rid8;

wire [5:0]   fb_awid;
wire [27:0]  fb_awaddr;
wire [7:0]   fb_awlen;
wire [2:0]   fb_awsize;
wire [1:0]   fb_awburst;
wire [3:0]   fb_awcache;
wire [2:0]   fb_awprot;
wire         fb_awlock;
wire         fb_awvalid;
wire         fb_awready;

wire [5:0]   fb_arid;
wire [27:0]  fb_araddr;
wire [7:0]   fb_arlen;
wire [2:0]   fb_arsize;
wire [1:0]   fb_arburst;
wire         fb_arlock;
wire         fb_arvalid;
wire         fb_arready;

wire [127:0] fb_wdata;
wire [15:0]  fb_wstrb;
wire         fb_wlast;
wire         fb_wvalid;
wire         fb_wready;

wire [7:0]   fb_rid8;
wire [127:0] fb_rdata;
wire         fb_rlast;
wire         fb_rvalid;
wire         fb_rready;
wire [1:0]   fb_rresp;
wire [5:0]   fb_rid;
wire [7:0]   fb_bid8;
wire [5:0]   fb_bid;
wire         fb_bvalid;
wire         fb_bready;
wire [1:0]   fb_bresp;

wire [15:0]  fb_vout;
wire         fb_hs, fb_vs, fb_de;
wire         fb_wr_sw;

frame_buffer #(
    .I_VID_WIDTH    (32),
    .O_VID_WIDTH    (16),
    .AXI_DATA_WIDTH (128),
    .AXI_ADDR_WIDTH (28),
    .WR_FIFO_DEPTH  (1024),
    .RD_FIFO_DEPTH  (1024),
    .START_ADDR     (28'h0000000),
    .BURST_LEN      (8'd127),
    .FB_NUM         (3),
    .MAX_VID_WIDTH  (1280),
    .MAX_VID_HIGHT  (720)
) u_frame_buffer (
    .axi_clk        (core_clk),
    .rst_n          (video_rst_n),

    .i_clk          (mipi_pixel_clk),
    .i_vs           (fb_ivs),
    .i_hs           (fb_ihs),
    .i_de           (fb_ide),
    .vin            (fb_vin),

    .o_clk          (hdmi_tx_half_clk),
    .o_hs           (fb_hs),
    .o_vs           (fb_vs),
    .o_de           (fb_de),
    .vout           (fb_vout),

    .H_FRONT_PORCH  (13'd55),
    .H_SYNC         (13'd20),
    .H_VALID        (13'd640),
    .H_BACK_PORCH   (13'd110),
    .V_FRONT_PORCH  (13'd5),
    .V_SYNC         (13'd5),
    .V_VALID        (13'd720),
    .V_BACK_PORCH   (13'd20),

    .awid           (fb_awid),
    .awaddr         (fb_awaddr),
    .awlen          (fb_awlen),
    .awsize         (fb_awsize),
    .awburst        (fb_awburst),
    .awcache        (fb_awcache),
    .awprot         (fb_awprot),
    .awlock         (fb_awlock),
    .awvalid        (fb_awvalid),
    .awcobuf        (),
    .awapcmd        (),
    .awallstrb      (),
    .awqos          (),
    .awready        (fb_awready),

    .arid           (fb_arid),
    .araddr         (fb_araddr),
    .arlen          (fb_arlen),
    .arsize         (fb_arsize),
    .arburst        (fb_arburst),
    .arlock         (fb_arlock),
    .arvalid        (fb_arvalid),
    .arapcmd        (),
    .arqos          (),
    .arready        (fb_arready),

    .wdata          (fb_wdata),
    .wstrb          (fb_wstrb),
    .wlast          (fb_wlast),
    .wvalid         (fb_wvalid),
    .wready         (fb_wready),

    .rid            (fb_rid),
    .rdata          (fb_rdata),
    .rlast          (fb_rlast),
    .rvalid         (fb_rvalid),
    .rready         (fb_rready),
    .rresp          (fb_rresp),

    .bid            (fb_bid),
    .bvalid         (fb_bvalid),
    .bready         (fb_bready),

    .test_rd_fifo_rddata (),
    .test_wdata          (),
    .test_rdata          (),
    .test_BURST_LEN      (),
    .o_wr_sw             (fb_wr_sw)
);

assign fb_rid = fb_rid8[5:0];
assign fb_bid = fb_bid8[5:0];

//=====================================================================
// Display: debayer (74.25MHz, RGGB) then 2 -> 1 expansion to 148.5MHz
//=====================================================================
wire        dbg_vs_o, dbg_hs_o, dbg_de_o, dbg_val_o;
wire [47:0] dbg_rgb;
wire [2:0]  awb_r_gain, awb_g_gain, awb_b_gain;
wire [31:0] awb_sum_r, awb_sum_g, awb_sum_b;
wire        awb_upd;

// Gray-world AWB: stats on debayer RGB, gains feed rgb_gain (same clock).
awb_stats u_awb_stats (
    .clk     (hdmi_tx_half_clk),
    .rst_n   (video_rst_n),
    .i_de    (dbg_de_o),
    .i_vs    (dbg_vs_o),
    .i_rgb   (dbg_rgb),
    .o_sum_r (awb_sum_r),
    .o_sum_g (awb_sum_g),
    .o_sum_b (awb_sum_b),
    .o_upd   (awb_upd)
);

awb_ctrl u_awb_ctrl (
    .clk      (hdmi_tx_half_clk),
    .rst_n    (video_rst_n),
    .i_upd    (awb_upd),
    .i_sum_r  (awb_sum_r),
    .i_sum_g  (awb_sum_g),
    .i_sum_b  (awb_sum_b),
    .o_r_gain (awb_r_gain),
    .o_g_gain (awb_g_gain),
    .o_b_gain (awb_b_gain)
);

debayer_top_2to1 u_debayer (
    .in_pclk     (hdmi_tx_half_clk),
    .in_rstn     (video_rst_n),
    .raw_vs_i    (fb_vs),
    .raw_hs_i    (fb_hs),
    .raw_de_i    (fb_de),
    .raw_valid_i (fb_de),
    .raw_datax4_i({fb_vout[7:0], fb_vout[15:8]}),
    // AWB temporarily pinned to unity: tests whether the grey-world gains
    // (applied per byte_0/byte_1 in rgb_gain) cause the 2-px vertical stripes.
    // Revert to awb_*_gain once the stripe root cause is confirmed.
    .i_r_gain    (3'd4),
    .i_g_gain    (3'd4),
    .i_b_gain    (3'd4),
    .rgb_vs_o    (dbg_vs_o),
    .rgb_hs_o    (dbg_hs_o),
    .rgb_de_o    (dbg_de_o),
    .rgb_valid_o (dbg_val_o),
    .rgb_datax2_o(dbg_rgb)
);

// phase-insensitive 2->1 expansion: async FIFO 74.25MHz -> 148.5MHz
wire [50:0] af_din = {dbg_hs_o, dbg_vs_o, dbg_de_o, dbg_rgb};
wire [50:0] af_dout;
wire        af_wfull, af_rempty;
reg         af_rinc;

afifo_simple #(.DW(51), .AW(3)) u_exp_fifo (
    .wclk   (hdmi_tx_half_clk),
    .wrst_n (video_rst_n),
    .winc   (1'b1),
    .din    (af_din),
    .wfull  (af_wfull),
    .rclk   (hdmi_tx_slow_clk),
    .rrst_n (video_rst_n),
    .rinc   (af_rinc),
    .dout   (af_dout),
    .rempty (af_rempty)
);

reg        rphase, rrun;
reg [50:0] cur;

always @(posedge hdmi_tx_slow_clk or negedge video_rst_n) begin
    if (!video_rst_n) begin
        rphase  <= 1'b0;
        rrun    <= 1'b0;
        af_rinc <= 1'b0;
        cur     <= 51'd0;
    end else begin
        if (!rrun) begin
            af_rinc <= 1'b0;
            if (!af_rempty)
                rrun <= 1'b1;
        end else begin
            rphase  <= ~rphase;
            af_rinc <= ~rphase;
            if (rphase)
                cur <= af_dout;
        end
    end
end

wire [50:0] ew = rphase ? af_dout : cur;
wire [23:0] p_first  = ew[47:24];
wire [23:0] p_second = ew[23:0];
wire [23:0] exp_px   = rphase ? p_first : p_second;

reg [23:0] px_r;
reg        hs_r, vs_r, de_r;
always @(posedge hdmi_tx_slow_clk or negedge video_rst_n) begin
    if (!video_rst_n) begin
        px_r <= 24'd0;
        hs_r <= 1'b0;
        vs_r <= 1'b0;
        de_r <= 1'b0;
    end else begin
        px_r <= exp_px;
        hs_r <= ew[50];
        vs_r <= ew[49];
        de_r <= ew[48];
    end
end

//=====================================================================
// Camera FPS: two 1 s gates on core_clk.
//   sens_fps : mipi_vsync edges = true sensor output rate  -> OSD left
//   wr_fps   : fb_wr_sw edges   = DDR frame-write rate     -> OSD right
//   The pair separates "sensor slow" from "write path dropping frames".
//=====================================================================
wire [7:0] sens_fps, wr_fps;
wire       sens_upd, wr_upd;

// mipi_vsync lives in mipi_pixel_clk; 2-FF sync into core_clk
reg [2:0] vs_sync;
always @(posedge core_clk or negedge video_rst_n) begin
    if (!video_rst_n) vs_sync <= 3'b000;
    else              vs_sync <= {vs_sync[1:0], mipi_vsync};
end

fps_counter #(
    .CLK_FREQ_HZ (100_000_000)
) u_fps_sensor (
    .clk         (core_clk),
    .rst_n       (video_rst_n),
    .frame_pulse (vs_sync[2]),
    .fps         (sens_fps),
    .upd_toggle  (sens_upd)
);

fps_counter #(
    .CLK_FREQ_HZ (100_000_000)
) u_fps_wr (
    .clk         (core_clk),
    .rst_n       (video_rst_n),
    .frame_pulse (fb_wr_sw),
    .fps         (wr_fps),
    .upd_toggle  (wr_upd)
);

//=====================================================================
// HDMI TX (our TMDS encoder)
//=====================================================================
localparam SWAP_RB   = 1'b1;    // 1: blue<-red, red<-blue
localparam SWAP_HSVS = 1'b0;    // 1: hsync<-vs, vsync<-hs

wire [23:0] px_osd1, px_osd;

// left  : sensor fps (mipi_vsync)   right : write fps (wr_sw)
osd_fps #(
    .X_START (16)
) u_osd_sensor (
    .clk       (hdmi_tx_slow_clk),
    .rst_n     (video_rst_n),
    .i_hs      (hs_r),
    .i_vs      (vs_r),
    .i_de      (de_r),
    .i_rgb     (px_r),
    .i_fps     (sens_fps),
    .i_fps_upd (sens_upd),
    .o_rgb     (px_osd1)
);

osd_fps #(
    .X_START (56)
) u_osd_wr (
    .clk       (hdmi_tx_slow_clk),
    .rst_n     (video_rst_n),
    .i_hs      (hs_r),
    .i_vs      (vs_r),
    .i_de      (de_r),
    .i_rgb     (px_osd1),
    .i_fps     (wr_fps),
    .i_fps_upd (wr_upd),
    .o_rgb     (px_osd)
);

wire [9:0] tmds_data0;
wire [9:0] tmds_data1;
wire [9:0] tmds_data2;
wire [9:0] tmds_clk;

assign tmds_data0_TX_OE = 1'b1;
assign tmds_data1_TX_OE = 1'b1;
assign tmds_data2_TX_OE = 1'b1;
assign tmds_clk_TX_OE   = 1'b1;

assign tmds_data0_TX_RST = 1'b0;
assign tmds_data1_TX_RST = 1'b0;
assign tmds_data2_TX_RST = 1'b0;
assign tmds_clk_TX_RST   = 1'b0;

dvi_encoder dvi_encoder_m0
(
    .pixelclk   (hdmi_tx_slow_clk),
    .rstin      (~video_rst_n),
    .blue_din   (SWAP_RB   ? px_osd[23:16] : px_osd[7:0]),
    .green_din  (px_osd[15:8]),
    .red_din    (SWAP_RB   ? px_osd[7:0]   : px_osd[23:16]),
    .hsync      (SWAP_HSVS ? vs_r : hs_r),
    .vsync      (SWAP_HSVS ? hs_r : vs_r),
    .de         (de_r),
    .tmds_data0 (tmds_data0),
    .tmds_data1 (tmds_data1),
    .tmds_data2 (tmds_data2),
    .tmds_clk   (tmds_clk)
);

assign tmds_clk_o   = ~tmds_clk;
assign tmds_data0_o = ~tmds_data0;
assign tmds_data1_o = ~tmds_data1;
assign tmds_data2_o = ~tmds_data2;

//=====================================================================
// UART loopback
//=====================================================================
wire        RdEmpty;
wire        tx_valid;
wire        rx_valid;
wire        tx_req;
wire [7:0]  tx_data;
wire [7:0]  rx_data;
wire [7:0]  RdDNum;

DC_FIFO #(
    .FIFO_MODE  ("Normal"),
    .DATA_WIDTH (8),
    .FIFO_DEPTH (128)
) DC_FIFO_inst (
    .Reset      (1'b0),
    .WrClk      (gpio_clk_27m),
    .WrEn       (rx_valid),
    .WrDNum     (),
    .WrFull     (),
    .WrData     (rx_data),
    .RdClk      (gpio_clk_27m),
    .RdEn       (tx_req & (~RdEmpty)),
    .RdDNum     (RdDNum),
    .RdEmpty    (RdEmpty),
    .DataVal    (tx_valid),
    .RdData     (tx_data)
);

uart_rx_tx #(
    .CLK_RATE       (27000000),
    .BPS_RATE       (115200),
    .STOP_BIT_W     (1),
    .CHECKSUM_MODE  (2'b00),
    .CHECKSUM_EN    (1'b0)
) uart_rx_tx_inst (
    .clk        (gpio_clk_27m),
    .rst_n      (1'b1),
    .rxd        (rxd),
    .txd        (txd),
    .tx_valid   (tx_valid),
    .tx_data    (tx_data),
    .tx_req     (tx_req),
    .rx_valid   (rx_valid),
    .rx_data    (rx_data)
);

//=====================================================================
// SC431HAI I2C bring-up
//=====================================================================
wire sc431hai_done;
wire sensor_id_ok;
wire cam_scl_padoen;
wire cam_sda_padoen;

sc431hai_init u_sc431hai_init
(
    .clk            (gpio_clk_27m),
    .rst_n          (mipi_pll_locked),
    .cam_rst        (o_cam_rst),
    .scl_pad_i      (io_cam_scl_IN),
    .scl_pad_o      (io_cam_scl_OUT),
    .scl_padoen_o   (cam_scl_padoen),
    .sda_pad_i      (io_cam_sda_IN),
    .sda_pad_o      (io_cam_sda_OUT),
    .sda_padoen_o   (cam_sda_padoen),
    .init_done      (sc431hai_done),
    .sensor_id_ok   (sensor_id_ok),
    .cpu_mode       (1'b0),
    .cpu_addr       (3'd0),
    .cpu_wdata      (8'd0),
    .cpu_we         (1'b0),
    .cpu_stb        (1'b0),
    .cpu_rdata      (),
    .cpu_ack        ()
);

assign io_cam_scl_OE = ~cam_scl_padoen;
assign io_cam_sda_OE = ~cam_sda_padoen;

//=====================================================================
// AXI4 -> shared-address bridge (frame buffer -> DDR3 soft controller)
//=====================================================================
axi_atype_bridge #(
    .IDW (4),
    .AW  (28)
) u_axi_atype_bridge (
    .clk         (core_clk),
    .rst_n       (core_pll_locked & ddr_pll_locked),

    .s_awid      (fb_awid[3:0]),
    .s_awaddr    (fb_awaddr),
    .s_awlen     (fb_awlen),
    .s_awsize    (fb_awsize),
    .s_awburst   (fb_awburst),
    .s_awlock    (fb_awlock),
    .s_awvalid   (fb_awvalid),
    .s_awready   (fb_awready),

    .s_arid      (fb_arid[3:0]),
    .s_araddr    (fb_araddr),
    .s_arlen     (fb_arlen),
    .s_arsize    (fb_arsize),
    .s_arburst   (fb_arburst),
    .s_arlock    (fb_arlock),
    .s_arvalid   (fb_arvalid),
    .s_arready   (fb_arready),

    .m_aid       (ddr_ax_aid),
    .m_aaddr     (ddr_ax_aaddr),
    .m_alen      (ddr_ax_alen),
    .m_asize     (ddr_ax_asize),
    .m_aburst    (ddr_ax_aburst),
    .m_alock     (ddr_ax_alock),
    .m_atype     (ddr_ax_atype),
    .m_avalid    (ddr_ax_avalid),
    .m_aready    (ddr_ax_aready),

    .bvalid      (fb_bvalid),
    .bready      (fb_bready),
    .rvalid      (fb_rvalid),
    .rlast       (fb_rlast),
    .rready      (fb_rready)
);

//=====================================================================
// Efinix DDR3 soft controller (AXI variant, 16-bit DDR3, 128-bit AXI)
//=====================================================================
efx_ddr3_axi u_efx_ddr3_axi (
    .clk              (core_clk),
    .core_clk         (ddr_core_clk),
    .tdqss_clk        (ddr_tdqss_clk),
    .tac_clk          (ddr_tac_clk),
    .twd_clk          (ddr_twd_clk),
    .reset_n          (core_pll_locked & ddr_pll_locked),

    .reset            (ddr_reset),
    .cs               (ddr_cs),
    .ras              (ddr_ras),
    .cas              (ddr_cas),
    .we               (ddr_we),
    .cke              (ddr_cke),
    .addr             (ddr_addr),
    .ba               (ddr_ba),
    .odt              (ddr_odt),

    .o_dm_hi          (o_ddr_dm_hi),
    .o_dm_lo          (o_ddr_dm_lo),

    .i_dq_hi          (i_ddr_dq_hi),
    .i_dq_lo          (i_ddr_dq_lo),
    .o_dq_hi          (o_ddr_dq_hi),
    .o_dq_lo          (o_ddr_dq_lo),
    .o_dq_oe          (o_ddr_dq_oe),

    .i_dqs_hi         (i_ddr_dqs_hi),
    .i_dqs_lo         (i_ddr_dqs_lo),
    .i_dqs_n_hi       (i_ddr_dqs_n_hi),
    .i_dqs_n_lo       (i_ddr_dqs_n_lo),
    .o_dqs_hi         (o_ddr_dqs_hi),
    .o_dqs_lo         (o_ddr_dqs_lo),
    .o_dqs_n_hi       (),
    .o_dqs_n_lo       (),
    .o_dqs_oe         (o_ddr_dqs_oe),
    .o_dqs_n_oe       (o_ddr_dqs_n_oe),

    .axi_aid          (ddr_ax_aid),
    .axi_aaddr        ({4'b0, ddr_ax_aaddr}),
    .axi_alen         (ddr_ax_alen),
    .axi_asize        (ddr_ax_asize),
    .axi_aburst       (ddr_ax_aburst),
    .axi_alock        (ddr_ax_alock),
    .axi_avalid       (ddr_ax_avalid),
    .axi_aready       (ddr_ax_aready),
    .axi_atype        (ddr_ax_atype),

    .axi_wid          ({2'b0, fb_awid}),
    .axi_wdata        (fb_wdata),
    .axi_wstrb        (fb_wstrb),
    .axi_wlast        (fb_wlast),
    .axi_wvalid       (fb_wvalid),
    .axi_wready       (fb_wready),

    .axi_rid          (fb_rid8),
    .axi_rdata        (fb_rdata),
    .axi_rlast        (fb_rlast),
    .axi_rvalid       (fb_rvalid),
    .axi_rready       (fb_rready),
    .axi_rresp        (fb_rresp),

    .axi_bid          (fb_bid8),
    .axi_bresp        (fb_bresp),
    .axi_bvalid       (fb_bvalid),
    .axi_bready       (fb_bready),

    .shift            (pll_shift),
    .shift_sel        (pll_shift_sel),
    .shift_ena        (pll_shift_ena),
    .cal_ena          (1'b1),
    .cal_done         (ddr_cal_done),
    .cal_pass         (ddr_cal_pass),
    .cal_shift_val    (),
    .cal_fail_log     (ddr_cal_fail_log)
);

//=====================================================================
// TEMPORARY probes: display-side activity
//   led0=dbg_de_o (debayer de), led1=fb_de (frame buf read de),
//   led2=hdmi_tx_locked, led3=dbg_hs_o (debayer hs)
//=====================================================================
reg [23:0] dbg_de_cnt, fb_de_cnt, dbg_hs_cnt;

always @(posedge core_clk or negedge video_rst_n) begin
    if (!video_rst_n) begin
        dbg_de_cnt <= 24'd0;
        fb_de_cnt  <= 24'd0;
        dbg_hs_cnt <= 24'd0;
    end else begin
        if (dbg_de_o) dbg_de_cnt <= dbg_de_cnt + 1'b1;
        if (fb_de)    fb_de_cnt  <= fb_de_cnt  + 1'b1;
        if (dbg_hs_o) dbg_hs_cnt <= dbg_hs_cnt + 1'b1;
    end
end

// led[0] = sensor/wr fps mismatch (on => write path dropping frames)
// led[1] = wr_fps   >= 32        led[3] = sens_fps >= 32
// led[2] = hdmi_tx_locked
assign led[0] = (sens_fps != wr_fps);
assign led[1] = wr_fps[5];
assign led[2] = hdmi_tx_locked;
assign led[3] = sens_fps[5];

endmodule
