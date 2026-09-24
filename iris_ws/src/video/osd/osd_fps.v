//=====================================================================
// osd_fps: top-left 2-digit camera-FPS overlay, 8x16 white-on-black.
//   Display domain (default 148.75 MHz, 1 px/clk).
//   - CDC: 2-FF sync of fps_upd_toggle, capture fps (stable 1 s).
//   - Rebuilds active-area x/y from hs/vs/de.
//   - Combinational blend so output stays aligned with i_hs/i_de/i_rgb.
//=====================================================================

module osd_fps #(
    parameter X_START   = 16,   // active-area pixel of left edge of digits
    parameter Y_START   = 16,   // active-area line of top edge of digits
    parameter PAD       = 2,    // black backdrop padding around digits
    parameter DIGIT_W   = 8,
    parameter DIGIT_H   = 16,
    parameter DIGIT_GAP = 1     // horizontal gap between the two digits
) (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        i_hs,
    input  wire        i_vs,
    input  wire        i_de,
    input  wire [23:0] i_rgb,
    input  wire [7:0]  i_fps,      // core_clk domain, quasi-static
    input  wire        i_fps_upd,  // core_clk domain toggle
    output wire [23:0] o_rgb
);

//---------------------------------------------------------------------
// CDC: capture fps when the source toggle is observed (data stable 1 s)
//---------------------------------------------------------------------
reg [2:0] upd_sync;
reg [7:0] fps_meta;
reg [3:0] tens_r, ones_r;

// tens = fps/10, ones = fps%10 for 0..99 without inferring a divider
reg [3:0] tens_c, ones_c;
always @(*) begin
    if      (fps_meta < 8'd10) begin tens_c = 4'd0; ones_c = fps_meta - 8'd0;  end
    else if (fps_meta < 8'd20) begin tens_c = 4'd1; ones_c = fps_meta - 8'd10; end
    else if (fps_meta < 8'd30) begin tens_c = 4'd2; ones_c = fps_meta - 8'd20; end
    else if (fps_meta < 8'd40) begin tens_c = 4'd3; ones_c = fps_meta - 8'd30; end
    else if (fps_meta < 8'd50) begin tens_c = 4'd4; ones_c = fps_meta - 8'd40; end
    else if (fps_meta < 8'd60) begin tens_c = 4'd5; ones_c = fps_meta - 8'd50; end
    else if (fps_meta < 8'd70) begin tens_c = 4'd6; ones_c = fps_meta - 8'd60; end
    else if (fps_meta < 8'd80) begin tens_c = 4'd7; ones_c = fps_meta - 8'd70; end
    else if (fps_meta < 8'd90) begin tens_c = 4'd8; ones_c = fps_meta - 8'd80; end
    else                     begin tens_c = 4'd9; ones_c = fps_meta - 8'd90; end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        upd_sync <= 3'b000;
        fps_meta <= 8'd0;
        tens_r   <= 4'd0;
        ones_r   <= 4'd0;
    end else begin
        upd_sync <= {upd_sync[1:0], i_fps_upd};
        fps_meta <= i_fps;
        if (upd_sync[2] ^ upd_sync[1]) begin
            tens_r <= tens_c;
            ones_r <= ones_c;
        end
    end
end

//---------------------------------------------------------------------
// Active-area x/y rebuilt from de / vs
//   x: held 0 while !de, increments each active pixel
//      (first active cycle already sees x=0)
//   y: reset on vs rise, increments at end of each active line
//---------------------------------------------------------------------
localparam H_ACTIVE = 1920;
localparam V_ACTIVE = 1080;

reg [10:0] x_cnt;
reg [10:0] y_cnt;
reg        de_d, vs_d;

wire de_fall = ~i_de & de_d;
wire vs_rise = i_vs & ~vs_d;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        x_cnt <= 11'd0;
        y_cnt <= 11'd0;
        de_d  <= 1'b0;
        vs_d  <= 1'b0;
    end else begin
        de_d <= i_de;
        vs_d <= i_vs;

        if (vs_rise)
            y_cnt <= 11'd0;
        else if (de_fall && y_cnt < V_ACTIVE - 1)
            y_cnt <= y_cnt + 1'b1;

        if (vs_rise)
            x_cnt <= 11'd0;
        else if (!i_de)
            x_cnt <= 11'd0;
        else if (x_cnt < H_ACTIVE - 1)
            x_cnt <= x_cnt + 1'b1;
    end
end

//---------------------------------------------------------------------
// Window geometry
//   backdrop : [X_START-PAD, X_START + 2*DIGIT_W + DIGIT_GAP + PAD)
//   tens digit at X_START, ones at X_START + DIGIT_W + DIGIT_GAP
//---------------------------------------------------------------------
localparam WIN_W  = 2 * DIGIT_W + DIGIT_GAP + 2 * PAD;
localparam WIN_H  = DIGIT_H + 2 * PAD;
localparam WIN_X0 = X_START - PAD;
localparam WIN_Y0 = Y_START - PAD;
localparam WIN_X1 = WIN_X0 + WIN_W;   // exclusive
localparam WIN_Y1 = WIN_Y0 + WIN_H;   // exclusive

wire in_backdrop = (x_cnt >= WIN_X0) && (x_cnt < WIN_X1) &&
                   (y_cnt >= WIN_Y0) && (y_cnt < WIN_Y1);

wire in_digit_row = (y_cnt >= Y_START) && (y_cnt < Y_START + DIGIT_H);

// row / col relative to digit box, full-width subtract (origin-independent)
localparam ONES_X0 = X_START + DIGIT_W + DIGIT_GAP;

wire [10:0] row_ofs  = y_cnt - Y_START[10:0];
wire [10:0] tcol_ofs = x_cnt - X_START[10:0];
wire [10:0] ocol_ofs = x_cnt - ONES_X0[10:0];

wire [3:0] row      = row_ofs[3:0];
wire [2:0] tens_col = tcol_ofs[2:0];
wire [2:0] ones_col = ocol_ofs[2:0];

wire tens_sel = in_digit_row &&
                (x_cnt >= X_START) && (x_cnt < X_START + DIGIT_W);
wire ones_sel = in_digit_row &&
                (x_cnt >= ONES_X0) && (x_cnt < ONES_X0 + DIGIT_W);

//---------------------------------------------------------------------
// 8x16 digit font: each digit = 16 rows x 8 bit, bit7 = leftmost.
// Stored top row first: bits [127:120] = row 0.
//---------------------------------------------------------------------
function [127:0] digit_rom;
    input [3:0] d;
    begin
        case (d)
            4'd0: digit_rom = {
                8'h3C,8'h7E,8'hE7,8'hC3,8'hC3,8'hC3,8'hC3,8'hC3,
                8'hC3,8'hC3,8'hC3,8'hC3,8'hC3,8'hE7,8'h7E,8'h3C};
            4'd1: digit_rom = {
                8'h18,8'h38,8'h78,8'h18,8'h18,8'h18,8'h18,8'h18,
                8'h18,8'h18,8'h18,8'h18,8'h18,8'h18,8'hFF,8'hFF};
            4'd2: digit_rom = {
                8'h3C,8'h7E,8'hE7,8'hC3,8'h03,8'h07,8'h0E,8'h1C,
                8'h38,8'h70,8'hE0,8'hC0,8'hC0,8'hFF,8'hFF,8'h00};
            4'd3: digit_rom = {
                8'h3C,8'h7E,8'hE7,8'hC3,8'h03,8'h1E,8'h1E,8'h1E,
                8'h03,8'hC3,8'hE7,8'h7E,8'h3C,8'h00,8'h00,8'h00};
            4'd4: digit_rom = {
                8'h06,8'h0E,8'h1E,8'h36,8'h66,8'hC6,8'hFF,8'hFF,
                8'h06,8'h06,8'h06,8'h06,8'h06,8'h06,8'h06,8'h00};
            4'd5: digit_rom = {
                8'hFF,8'hFF,8'hC0,8'hC0,8'hFC,8'hFE,8'hC7,8'h03,
                8'h03,8'hC3,8'hE7,8'h7E,8'h3C,8'h00,8'h00,8'h00};
            4'd6: digit_rom = {
                8'h1E,8'h3C,8'h70,8'hE0,8'hC0,8'hFC,8'hFE,8'hC7,
                8'hC3,8'hC3,8'hC3,8'hE7,8'h7E,8'h3C,8'h00,8'h00};
            4'd7: digit_rom = {
                8'hFF,8'hFF,8'h03,8'h06,8'h0C,8'h0C,8'h18,8'h18,
                8'h30,8'h30,8'h60,8'h60,8'h60,8'h60,8'h60,8'h00};
            4'd8: digit_rom = {
                8'h3C,8'h7E,8'hE7,8'hC3,8'hC3,8'hE7,8'h7E,8'h7E,
                8'hE7,8'hC3,8'hC3,8'hE7,8'h7E,8'h3C,8'h00,8'h00};
            4'd9: digit_rom = {
                8'h3C,8'h7E,8'hE7,8'hC3,8'hC3,8'hE3,8'h7F,8'h3F,
                8'h03,8'h07,8'h0E,8'h1C,8'h38,8'h70,8'hE0,8'h00};
            default: digit_rom = 128'd0;
        endcase
    end
endfunction

wire [127:0] tens_bits = digit_rom(tens_r);
wire [127:0] ones_bits = digit_rom(ones_r);

// row 0 -> bits [127:120], row 15 -> bits [7:0]
wire [7:0] tens_row = tens_bits[127 - {row, 3'b000} -: 8];
wire [7:0] ones_row = ones_bits[127 - {row, 3'b000} -: 8];

wire tens_px = tens_sel & tens_row[3'd7 - tens_col];
wire ones_px = ones_sel & ones_row[3'd7 - ones_col];
wire digit_px = tens_px | ones_px;

//---------------------------------------------------------------------
// Combinational blend: backdrop black / glyph white / else passthrough
//---------------------------------------------------------------------
assign o_rgb = in_backdrop ? (digit_px ? 24'hFFFFFF : 24'h000000)
                           : i_rgb;

endmodule
