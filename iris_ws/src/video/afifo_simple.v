//=====================================================================
// Small asynchronous FIFO (gray-code pointers, registered read).
//   rinc -> dout valid on the next rclk edge.
//=====================================================================
module afifo_simple #(
    parameter DW = 51,
    parameter AW = 3          // depth = 2^AW
)(
    input  wire          wclk,
    input  wire          wrst_n,
    input  wire          winc,
    input  wire [DW-1:0] din,
    output wire          wfull,

    input  wire          rclk,
    input  wire          rrst_n,
    input  wire          rinc,
    output reg  [DW-1:0] dout,
    output wire          rempty
);

localparam DEPTH = 1 << AW;

reg [DW-1:0] mem [0:DEPTH-1];
reg [AW:0]   wbin, wgray, rbin, rgray;
reg [AW:0]   wgray_s1, wgray_s2;
reg [AW:0]   rgray_s1, rgray_s2;

function [AW:0] bin2gray; input [AW:0] b; bin2gray = (b >> 1) ^ b; endfunction

always @(posedge wclk or negedge wrst_n) begin
    if (!wrst_n) begin
        wbin  <= 0;
        wgray <= 0;
    end else if (winc && !wfull) begin
        mem[wbin[AW-1:0]] <= din;
        wbin  <= wbin + 1'b1;
        wgray <= bin2gray(wbin + 1'b1);
    end
end

always @(posedge rclk or negedge rrst_n) begin
    if (!rrst_n) begin
        wgray_s1 <= 0;
        wgray_s2 <= 0;
    end else begin
        wgray_s1 <= wgray;
        wgray_s2 <= wgray_s1;
    end
end

always @(posedge wclk or negedge wrst_n) begin
    if (!wrst_n) begin
        rgray_s1 <= 0;
        rgray_s2 <= 0;
    end else begin
        rgray_s1 <= rgray;
        rgray_s2 <= rgray_s1;
    end
end

always @(posedge rclk or negedge rrst_n) begin
    if (!rrst_n) begin
        rbin  <= 0;
        rgray <= 0;
        dout  <= 0;
    end else if (rinc && !rempty) begin
        dout  <= mem[rbin[AW-1:0]];
        rbin  <= rbin + 1'b1;
        rgray <= bin2gray(rbin + 1'b1);
    end
end

assign wfull  = (wgray == {~rgray_s2[AW:AW-1], rgray_s2[AW-2:0]});
assign rempty = (rgray == wgray_s2);

endmodule
