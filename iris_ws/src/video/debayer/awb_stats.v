//=====================================================================
// awb_stats: per-frame R/G/B accumulation on display-domain RGB.
//   - 2 px/clk while i_de (matches debayer rgb_datax2_o packing)
//   - On VS rising edge: latch sums, pulse o_upd, clear accumulators
//   - Gray-world ratios use sumG/sumR (pixel count cancels)
//=====================================================================

module awb_stats (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        i_de,
    input  wire        i_vs,
    input  wire [47:0] i_rgb, // {R1,G1,B1, R0,G0,B0} each 8-bit
    output reg  [31:0] o_sum_r,
    output reg  [31:0] o_sum_g,
    output reg  [31:0] o_sum_b,
    output reg         o_upd
);

wire [7:0] r0 = i_rgb[23:16];
wire [7:0] g0 = i_rgb[15:8];
wire [7:0] b0 = i_rgb[7:0];
wire [7:0] r1 = i_rgb[47:40];
wire [7:0] g1 = i_rgb[39:32];
wire [7:0] b1 = i_rgb[31:24];

// two 8-bit adds into 32-bit acc: max frame sum < 2^30
wire [31:0] add_r = {24'd0, r0} + {24'd0, r1};
wire [31:0] add_g = {24'd0, g0} + {24'd0, g1};
wire [31:0] add_b = {24'd0, b0} + {24'd0, b1};

reg        vs_d;
reg [31:0] acc_r, acc_g, acc_b;

wire vs_rise = i_vs & ~vs_d;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        vs_d    <= 1'b0;
        acc_r   <= 32'd0;
        acc_g   <= 32'd0;
        acc_b   <= 32'd0;
        o_sum_r <= 32'd0;
        o_sum_g <= 32'd0;
        o_sum_b <= 32'd0;
        o_upd   <= 1'b0;
    end else begin
        vs_d  <= i_vs;
        o_upd <= 1'b0;

        if (vs_rise) begin
            o_sum_r <= acc_r;
            o_sum_g <= acc_g;
            o_sum_b <= acc_b;
            o_upd   <= 1'b1;
            acc_r   <= 32'd0;
            acc_g   <= 32'd0;
            acc_b   <= 32'd0;
        end else if (i_de) begin
            acc_r <= acc_r + add_r;
            acc_g <= acc_g + add_g;
            acc_b <= acc_b + add_b;
        end
    end
end

endmodule
