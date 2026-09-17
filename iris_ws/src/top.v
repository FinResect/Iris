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
    output                      tmds_clk_TX_RST
);

//=====================================================================
// LED blink (27MHz counter)
//=====================================================================
reg [26:0] led_cnt = 'd0;
always @(posedge gpio_clk_27m)
    led_cnt <= led_cnt + 1'b1;

assign led[0] = rxd;
assign led[1] = txd;
assign led[2] = led_cnt[24];
assign led[3] = led_cnt[23];

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
parameter   MAX_VRES    = 12'd1536;
parameter   HSP         = 8'd2;
parameter   HBP         = 8'd88;
parameter   HFP         = 8'd120;
parameter   VSP         = 8'd2;
parameter   VBP         = 8'd20;
parameter   VFP         = 8'd20;

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

dvi_encoder dvi_encoder_m0
(
    .pixelclk   (hdmi_tx_slow_clk),
    .rstin      (~sys_rst_n),
    .blue_din   (video_b),
    .green_din  (video_g),
    .red_din    (video_r),
    .hsync      (video_hs),
    .vsync      (video_vs),
    .de         (video_de),
    .tmds_data0 (tmds_data0),
    .tmds_data1 (tmds_data1),
    .tmds_data2 (tmds_data2),
    .tmds_clk   (tmds_clk)
);

assign tmds_clk_o   = ~tmds_clk;
assign tmds_data0_o = ~tmds_data0;
assign tmds_data1_o = ~tmds_data1;
assign tmds_data2_o = ~tmds_data2;

endmodule
