//=====================================================================
// awb_ctrl: gray-world white balance -> 3-bit rgb_gain codes.
//   G anchored at 4 (1.0x). For R/B pick code c in [2,7] minimizing
//   |c * sum_ch - 4 * sum_g|  (round(4*mG/mCh); n cancels).
//   Dead-zone ~3% and +1/-1 per frame damping to avoid flicker.
//   3-stage pipeline so the c*sum compare never sits in one cycle
//   with the 32-bit inputs (timing-friendly; update once per frame).
//=====================================================================

module awb_ctrl (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        i_upd,      // 1-cycle when sums are valid
    input  wire [31:0] i_sum_r,
    input  wire [31:0] i_sum_g,
    input  wire [31:0] i_sum_b,
    output reg  [2:0]  o_r_gain,
    output reg  [2:0]  o_g_gain,
    output reg  [2:0]  o_b_gain
);

//---------------------------------------------------------------------
// Stage 0: capture sums
//---------------------------------------------------------------------
reg        s0_valid;
reg [31:0] s0_r, s0_g, s0_b;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        s0_valid <= 1'b0;
        s0_r     <= 32'd0;
        s0_g     <= 32'd0;
        s0_b     <= 32'd0;
    end else begin
        s0_valid <= i_upd;
        if (i_upd) begin
            s0_r <= i_sum_r;
            s0_g <= i_sum_g;
            s0_b <= i_sum_b;
        end
    end
end

//---------------------------------------------------------------------
// Stage 1: dead-zone + best code (shift/add products, no * operator)
//   c*sum for c=2..7 via shifts of s0_* (registered inputs only)
//---------------------------------------------------------------------
function [2:0] best_code;
    input [31:0] sum_ch;
    input [31:0] sum_ref;
    reg [34:0] target;
    reg [34:0] p2, p3, p4, p5, p6, p7;
    reg [34:0] e2, e3, e4, e5, e6, e7;
    reg [34:0] best_err;
    reg [2:0]  best;
    begin
        target = {sum_ref, 2'b00};          // 4*sum_ref
        p2 = {sum_ch, 1'b0};                 // 2*
        p3 = p2 + sum_ch;                    // 3*
        p4 = {sum_ch, 2'b00};                // 4*
        p5 = p4 + sum_ch;                    // 5*
        p6 = p4 + p2;                        // 6*
        p7 = p4 + p3;                        // 7*

        e2 = (p2 >= target) ? (p2 - target) : (target - p2);
        e3 = (p3 >= target) ? (p3 - target) : (target - p3);
        e4 = (p4 >= target) ? (p4 - target) : (target - p4);
        e5 = (p5 >= target) ? (p5 - target) : (target - p5);
        e6 = (p6 >= target) ? (p6 - target) : (target - p6);
        e7 = (p7 >= target) ? (p7 - target) : (target - p7);

        best     = 3'd4;
        best_err = e4;
        if (e2 < best_err) begin best_err = e2; best = 3'd2; end
        if (e3 < best_err) begin best_err = e3; best = 3'd3; end
        if (e5 < best_err) begin best_err = e5; best = 3'd5; end
        if (e6 < best_err) begin best_err = e6; best = 3'd6; end
        if (e7 < best_err) begin best_err = e7; best = 3'd7; end
        best_code = best;
    end
endfunction

wire [31:0] diff_r = (s0_r >= s0_g) ? (s0_r - s0_g) : (s0_g - s0_r);
wire [31:0] diff_b = (s0_b >= s0_g) ? (s0_b - s0_g) : (s0_g - s0_b);
wire dead_r = (s0_g == 32'd0) || (diff_r <= (s0_g >> 5));
wire dead_b = (s0_g == 32'd0) || (diff_b <= (s0_g >> 5));
wire skip_r = dead_r || (s0_r == 32'd0);
wire skip_b = dead_b || (s0_b == 32'd0);

wire [2:0] tgt_r = best_code(s0_r, s0_g);
wire [2:0] tgt_b = best_code(s0_b, s0_g);

reg        s1_valid;
reg        s1_skip_r, s1_skip_b;
reg [2:0]  s1_tgt_r, s1_tgt_b;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        s1_valid  <= 1'b0;
        s1_skip_r <= 1'b1;
        s1_skip_b <= 1'b1;
        s1_tgt_r  <= 3'd4;
        s1_tgt_b  <= 3'd4;
    end else begin
        s1_valid  <= s0_valid;
        s1_skip_r <= skip_r;
        s1_skip_b <= skip_b;
        s1_tgt_r  <= tgt_r;
        s1_tgt_b  <= tgt_b;
    end
end

//---------------------------------------------------------------------
// Stage 2: +/-1 damping toward target
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        o_r_gain <= 3'd4;
        o_g_gain <= 3'd4;
        o_b_gain <= 3'd4;
    end else if (s1_valid) begin
        o_g_gain <= 3'd4;
        if (!s1_skip_r) begin
            if (s1_tgt_r > o_r_gain)      o_r_gain <= o_r_gain + 3'd1;
            else if (s1_tgt_r < o_r_gain) o_r_gain <= o_r_gain - 3'd1;
        end
        if (!s1_skip_b) begin
            if (s1_tgt_b > o_b_gain)      o_b_gain <= o_b_gain + 3'd1;
            else if (s1_tgt_b < o_b_gain) o_b_gain <= o_b_gain - 3'd1;
        end
    end
end

endmodule
