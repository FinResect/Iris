//=====================================================================
// Camera capture front-end (device/video specific)
//   RAW10 packed CSI stream (4 px/clk) -> decimated grayscale frame
//   - decimates by 2^DECIM_LOG2 in both X and Y (aligned to frame origin)
//   - writes one 8-bit gray sample per selected pixel into frame_buf
//   - wr_bank toggles at every camera vsync (double buffering)
//=====================================================================

module cam_capture #(
    parameter IMG_W       = 240,
    parameter IMG_H       = 135,
    parameter DECIM_LOG2  = 3,     // sample every 2^3 = 8 pixels / lines
    parameter PIX_PER_CLK = 4      // RAW10 Pack_40 -> 4 pixels per beat
)(
    input  wire         clk,               // CSI pixel clock
    input  wire         rst_n,

    input  wire [63:0]  pixel_data,
    input  wire         pixel_data_valid,
    input  wire         hsync,
    input  wire         vsync,

    output reg          wr_en,
    output reg  [15:0]  wr_addr,
    output reg  [7:0]   wr_data,
    output reg          wr_bank,
    output reg          frame_valid,
    output reg          vsync_seen,
    output reg          data_seen
);

reg [11:0] x_idx;
reg [11:0] line_idx;
reg        hs_d;
reg        vs_d;

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n) begin
        x_idx       <= 12'd0;
        line_idx    <= 12'd0;
        hs_d        <= 1'b0;
        vs_d        <= 1'b0;
        wr_en       <= 1'b0;
        wr_addr     <= 16'd0;
        wr_data     <= 8'd0;
        wr_bank     <= 1'b0;
        frame_valid <= 1'b0;
        vsync_seen  <= 1'b0;
        data_seen   <= 1'b0;
    end else begin
        hs_d <= hsync;
        vs_d <= vsync;
        wr_en <= 1'b0;

        if (pixel_data_valid)
            data_seen <= 1'b1;

        if (vsync & ~vs_d) begin
            x_idx      <= 12'd0;
            line_idx   <= 12'd0;
            wr_bank    <= ~wr_bank;
            vsync_seen <= 1'b1;
        end else begin
            if (hsync & ~hs_d)
                x_idx <= 12'd0;
            else if (hsync & pixel_data_valid)
                x_idx <= x_idx + PIX_PER_CLK;

            if (hsync & pixel_data_valid &&
                (x_idx[DECIM_LOG2-1:0] == {DECIM_LOG2{1'b0}}) &&
                (line_idx[DECIM_LOG2-1:0] == {DECIM_LOG2{1'b0}}) &&
                (line_idx[11:DECIM_LOG2] < IMG_H)) begin
                wr_en   <= 1'b1;
                wr_data <= pixel_data[9:2];
                wr_addr <= (line_idx[11:DECIM_LOG2] * IMG_W) + x_idx[11:DECIM_LOG2];
            end

            if (~hsync & hs_d) begin
                line_idx <= line_idx + 1'b1;
                if (line_idx[11:DECIM_LOG2] == (IMG_H-1))
                    frame_valid <= 1'b1;
            end
        end
    end
end

endmodule
