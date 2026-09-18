//=====================================================================
// L0 merged top: LED blink + UART loopback + HDMI color bar
//=====================================================================

module top
(
    ////////////////////////    CLOCK     ////////////////////////
    input                       gpio_clk_27m,     // 27MHz board clock (UART + LED)

    ////////////////////////    UART      ////////////////////////
    input                       rxd,
    output                      txd,

    ////////////////////////    LED       ////////////////////////
    output [3:0]                led,

    ////////////////////////    HDMI TX   ////////////////////////
    input                       hdmi_tx_locked,
    input                       hdmi_tx_slow_clk,
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
// LED
//   board LED2 (led[0]) = rxd
//   board LED3 (led[1]) = txd
//   board LED4 (led[2]) = sc431hai_done   (I2C init complete)
//   board LED5 (led[3]) = cam_frame_valid (camera streaming)
//=====================================================================
assign led[0] = rxd;
assign led[1] = txd;
assign led[2] = sc431hai_done;
assign led[3] = cam_frame_valid;

//=====================================================================
// UART loopback (replicate 17 demo)
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
// HDMI color bar TX (replicate 03 demo)
//=====================================================================
parameter   MAX_HRES    = 12'd1920;
parameter   MAX_VRES    = 12'd1080;
parameter   HSP         = 8'd44;
parameter   HBP         = 8'd148;
parameter   HFP         = 8'd88;
parameter   VSP         = 8'd5;
parameter   VBP         = 8'd36;
parameter   VFP         = 8'd4;

wire        video_hs;
wire        video_vs;
wire        video_de;
wire [7:0]  video_r;
wire [7:0]  video_g;
wire [7:0]  video_b;
wire        sys_rst_n;

reset
#(
    .IN_RST_ACTIVE  ("LOW"),
    .OUT_RST_ACTIVE ("LOW"),
    .CYCLE          (3)
)
inst_rst
(
    .i_arst (hdmi_tx_locked),
    .i_clk  (hdmi_tx_slow_clk),
    .o_srst (sys_rst_n)
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

color_bar_rgb #(
    .HS_POLORY      (1'b1),
    .VS_POLORY      (1'b1),
    .SYMBOL_WIDTH   (8),
    .SYMBOL_NUM     (3),
    .PAR_PIXEL_NUM  (1),
    .HFP            (HFP),
    .HST            (HSP),
    .HACT           (MAX_HRES),
    .HBP            (HBP),
    .VFP            (VFP),
    .VST            (VSP),
    .VACT           (MAX_VRES),
    .VBP            (VBP),
    .TEST_MODE      (2'd2)
) u_color_bar_rgb (
    .clk        (hdmi_tx_slow_clk),
    .rst_n      (sys_rst_n),
    .hs         (video_hs),
    .vs         (video_vs),
    .de         (video_de),
    .o_vid_data ({video_r, video_g, video_b})
);

// camera video (from MIPI -> frame_buf -> display_ctrl), declared below
wire        cam_hs;
wire        cam_vs;
wire        cam_de;
wire [7:0]  cam_r;
wire [7:0]  cam_g;
wire [7:0]  cam_b;
wire        cam_frame_valid;

// 0 : color bar, 1 : camera (as soon as the first camera frame is captured)
// synchronize the select flag into the HDMI pixel clock domain
reg  [1:0]  vsel_sync;
always @(posedge hdmi_tx_slow_clk or negedge sys_rst_n)
begin
    if (~sys_rst_n)
        vsel_sync <= 2'b00;
    else
        vsel_sync <= {vsel_sync[0], cam_frame_valid};
end
wire        video_sel = vsel_sync[1];
wire [7:0]  enc_r = video_sel ? cam_r : video_r;
wire [7:0]  enc_g = video_sel ? cam_g : video_g;
wire [7:0]  enc_b = video_sel ? cam_b : video_b;
wire        enc_hs = video_sel ? cam_hs : video_hs;
wire        enc_vs = video_sel ? cam_vs : video_vs;
wire        enc_de = video_sel ? cam_de : video_de;

dvi_encoder dvi_encoder_m0
(
    .pixelclk   (hdmi_tx_slow_clk),
    .rstin      (~sys_rst_n),
    .blue_din   (enc_b),
    .green_din  (enc_g),
    .red_din    (enc_r),
    .hsync      (enc_hs),
    .vsync      (enc_vs),
    .de         (enc_de),
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
// MIPI CSI-2 RX (J4)
//=====================================================================
wire        mipi_data_valid;
wire [63:0] mipi_pixel_data;
wire [3:0]  mipi_pixel_per_clk;
wire [5:0]  mipi_datatype;
wire [15:0] mipi_word_count;
wire        mipi_hsync;
wire        mipi_vsync;
wire        mipi_irq;

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

//=====================================================================
// Camera live view: RAW10 -> decimated gray -> frame_buf -> 1080p display
//=====================================================================
wire        cam_wr_en;
wire [15:0] cam_wr_addr;
wire [7:0]  cam_wr_data;
wire        cam_wr_bank;
wire        cam_vsync_seen;
wire        cam_data_seen;

cam_capture #(
    .IMG_W       (240),
    .IMG_H       (135),
    .DECIM_LOG2  (3),
    .PIX_PER_CLK (4)
) u_cam_capture (
    .clk              (mipi_pixel_clk),
    .rst_n            (mipi_pll_locked),
    .pixel_data       (mipi_pixel_data),
    .pixel_data_valid (mipi_data_valid),
    .hsync            (mipi_hsync),
    .vsync            (mipi_vsync),
    .wr_en            (cam_wr_en),
    .wr_addr          (cam_wr_addr),
    .wr_data          (cam_wr_data),
    .wr_bank          (cam_wr_bank),
    .frame_valid      (cam_frame_valid),
    .vsync_seen       (cam_vsync_seen),
    .data_seen        (cam_data_seen)
);

// sync camera write-bank into the display clock domain and read the
// completed (not currently written) bank
reg [1:0] cam_wb_sync;
reg       cam_rd_bank;
wire      cam_frame_pulse;

always @(posedge hdmi_tx_slow_clk or negedge sys_rst_n)
begin
    if (~sys_rst_n) begin
        cam_wb_sync <= 2'b00;
        cam_rd_bank <= 1'b0;
    end else begin
        cam_wb_sync <= {cam_wb_sync[0], cam_wr_bank};
        if (cam_frame_pulse)
            cam_rd_bank <= ~cam_wb_sync[1];
    end
end

wire [15:0] cam_rd_addr;
wire [7:0]  cam_rd_data;

frame_buf #(
    .IMG_W      (240),
    .IMG_H      (135),
    .ADDR_WIDTH (16),
    .BANK_SHIFT (15)
) u_frame_buf (
    .wr_clk  (mipi_pixel_clk),
    .wr_en   (cam_wr_en),
    .wr_addr (cam_wr_addr),
    .wr_data (cam_wr_data),
    .wr_bank (cam_wr_bank),
    .rd_clk  (hdmi_tx_slow_clk),
    .rd_addr (cam_rd_addr),
    .rd_bank (cam_rd_bank),
    .rd_data (cam_rd_data)
);

display_ctrl #(
    .H_ACT  (1920),
    .H_FP   (88),
    .H_SYNC (44),
    .H_BP   (148),
    .V_ACT  (1080),
    .V_FP   (4),
    .V_SYNC (5),
    .V_BP   (36),
    .IMG_W  (240),
    .IMG_H  (135),
    .HS_POL (1'b1),
    .VS_POL (1'b1)
) u_display_ctrl (
    .pixel_clk   (hdmi_tx_slow_clk),
    .rst_n       (sys_rst_n),
    .rd_addr     (cam_rd_addr),
    .rd_data     (cam_rd_data),
    .video_r     (cam_r),
    .video_g     (cam_g),
    .video_b     (cam_b),
    .hs          (cam_hs),
    .vs          (cam_vs),
    .de          (cam_de),
    .frame_pulse (cam_frame_pulse)
);

//=====================================================================
// SC431HAI I2C bring-up (power-up reset + register init)
//   CPU port left unconnected for now; when the RISC-V SoC is added,
//   drive cpu_mode/cpu_addr/cpu_wdata/cpu_we/cpu_stb from APB/AXI4-Lite.
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

endmodule
