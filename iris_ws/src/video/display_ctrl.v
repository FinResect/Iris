//=====================================================================
// 1080p60 display controller with integer up-scaling (nearest)
//   reads an IMG_W x IMG_H grayscale frame and outputs RGB888 video
//   with hs/vs/de at the HDMI pixel clock.
//   Reusable video building block.
//=====================================================================

module display_ctrl #(
    parameter H_ACT  = 1920,
    parameter H_FP   = 88,
    parameter H_SYNC = 44,
    parameter H_BP   = 148,
    parameter V_ACT  = 1080,
    parameter V_FP   = 4,
    parameter V_SYNC = 5,
    parameter V_BP   = 36,
    parameter IMG_W  = 240,
    parameter IMG_H  = 135,
    parameter HS_POL = 1'b1,
    parameter VS_POL = 1'b1
)(
    input  wire         pixel_clk,
    input  wire         rst_n,

    output wire [15:0]  rd_addr,
    input  wire [7:0]   rd_data,

    output reg  [7:0]   video_r,
    output reg  [7:0]   video_g,
    output reg  [7:0]   video_b,
    output reg          hs,
    output reg          vs,
    output reg          de,
    output reg          frame_pulse
);

localparam H_TOTAL = H_SYNC + H_BP + H_ACT + H_FP;
localparam V_TOTAL = V_SYNC + V_BP + V_ACT + V_FP;

localparam [11:0] H_SYNC_END = H_SYNC;
localparam [11:0] H_ACT_BEG  = H_SYNC + H_BP;
localparam [11:0] H_ACT_END  = H_SYNC + H_BP + H_ACT;
localparam [11:0] V_SYNC_END = V_SYNC;
localparam [11:0] V_ACT_BEG  = V_SYNC + V_BP;
localparam [11:0] V_ACT_END  = V_SYNC + V_BP + V_ACT;

reg [11:0] hcnt;
reg [11:0] vcnt;

wire h_last = (hcnt == H_TOTAL-1);
wire v_last = (vcnt == V_TOTAL-1);

always @(posedge pixel_clk or negedge rst_n)
begin
    if (~rst_n) begin
        hcnt <= 12'd0;
        vcnt <= 12'd0;
    end else begin
        if (h_last) begin
            hcnt <= 12'd0;
            if (v_last) vcnt <= 12'd0;
            else        vcnt <= vcnt + 1'b1;
        end else begin
            hcnt <= hcnt + 1'b1;
        end
    end
end

wire h_sync_i = (hcnt < H_SYNC_END);
wire v_sync_i = (vcnt < V_SYNC_END);
wire h_act_i  = (hcnt >= H_ACT_BEG) && (hcnt < H_ACT_END);
wire v_act_i  = (vcnt >= V_ACT_BEG) && (vcnt < V_ACT_END);
wire de_i     = h_act_i & v_act_i;

wire [11:0] x_act = hcnt - H_ACT_BEG;
wire [11:0] y_act = vcnt - V_ACT_BEG;

// source coords: divide by 8 (integer nearest up-scale of 8x)
wire [11:0] src_col = x_act[11:3];
wire [11:0] src_row = y_act[11:3];

assign rd_addr = de_i ? (src_row * IMG_W + src_col) : 16'd0;

wire hs_o = HS_POL ? h_sync_i : ~h_sync_i;
wire vs_o = VS_POL ? v_sync_i : ~v_sync_i;

// 2-stage delay: 1 for BRAM address reg, 1 for BRAM output reg
reg de_d1, hs_d1, vs_d1;
reg de_d2, hs_d2, vs_d2;

always @(posedge pixel_clk or negedge rst_n)
begin
    if (~rst_n) begin
        de_d1 <= 1'b0; hs_d1 <= 1'b0; vs_d1 <= 1'b0;
        de_d2 <= 1'b0; hs_d2 <= 1'b0; vs_d2 <= 1'b0;
        video_r <= 8'd0; video_g <= 8'd0; video_b <= 8'd0;
        frame_pulse <= 1'b0;
    end else begin
        de_d1 <= de_i;
        hs_d1 <= hs_o;
        vs_d1 <= vs_o;

        de_d2 <= de_d1;
        hs_d2 <= hs_d1;
        vs_d2 <= vs_d1;

        if (de_d1) begin
            video_r <= rd_data;
            video_g <= rd_data;
            video_b <= rd_data;
        end else begin
            video_r <= 8'd0;
            video_g <= 8'd0;
            video_b <= 8'd0;
        end

        frame_pulse <= (hcnt == 12'd0) && (vcnt == 12'd0);
    end
end

always @(*)
begin
    de <= de_d2;
    hs <= hs_d2;
    vs <= vs_d2;
end

endmodule
