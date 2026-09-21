//=====================================================================
// MIPI RAW10 (4 px/clk @ mipi_clk) -> RGGB debayer -> RGB565 (2 px/clk)
//
// A small asynchronous FIFO carries every MIPI word (40-bit RAW10 + vs/hs/de)
// from mipi_clk (50 MHz) into core clk (100 MHz).  Because core clk is twice
// mipi_clk, the reader emits one MIPI word as two debayer inputs, giving an
// exact 2 px/clk stream with no line-buffer reconstruction.
//
// debayer output: rgb_data[31:0] = 2 x RGB565, with rgb_de / rgb_vs.
//=====================================================================
module mipi_rgb_frontend #(
    parameter FMW    = 48,       // FIFO word width
    parameter FMW_AW = 7         // FIFO depth = 128
)(
    input  wire        mipi_clk,
    input  wire        clk,                  // core clk (2x mipi_clk)
    input  wire        rst_n,

    input  wire [63:0] pixel_data,           // 4 x RAW10 in [39:0]
    input  wire        pixel_data_valid,
    input  wire        hsync,
    input  wire        vsync,

    output wire        rgb_de,
    output wire        rgb_vs,
    output wire [31:0] rgb_data
);

localparam FMW_FULL = FMW_AW + 1;

//---------------------------------------------------------------------
// Asynchronous FIFO: write mipi_clk, read clk
//---------------------------------------------------------------------
reg  [FMW-1:0]    mem [0:(1<<FMW_AW)-1];
reg  [FMW_FULL-1:0] wbin, wgray, rbin, rgray;
reg  [FMW_FULL-1:0] wgray_s1, wgray_s2;
reg  [FMW_FULL-1:0] rgray_s1, rgray_s2;
reg  [FMW-1:0]    rd_dout;

wire [FMW_AW-1:0] widx = wbin[FMW_AW-1:0];
wire [FMW_AW-1:0] ridx = rbin[FMW_AW-1:0];

wire fifo_full  = (wgray == {~rgray_s2[FMW_FULL-1:FMW_FULL-2], rgray_s2[FMW_AW-2:0]});
wire fifo_empty = (rgray == wgray_s2);

function [FMW_FULL-1:0] bin2gray; input [FMW_FULL-1:0] b; bin2gray = (b >> 1) ^ b; endfunction

wire cap_de = pixel_data_valid & hsync;

always @(posedge mipi_clk or negedge rst_n) begin
    if (!rst_n) begin
        wbin  <= 0;
        wgray <= 0;
    end else if (!fifo_full) begin
        mem[widx] <= {vsync, hsync, cap_de, pixel_data[39:0]};
        wbin  <= wbin + 1'b1;
        wgray <= bin2gray(wbin + 1'b1);
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        wgray_s1 <= 0;
        wgray_s2 <= 0;
    end else begin
        wgray_s1 <= wgray;
        wgray_s2 <= wgray_s1;
    end
end

always @(posedge mipi_clk or negedge rst_n) begin
    if (!rst_n) begin
        rgray_s1 <= 0;
        rgray_s2 <= 0;
    end else begin
        rgray_s1 <= rgray;
        rgray_s2 <= rgray_s1;
    end
end

//---------------------------------------------------------------------
// Read side: one MIPI word -> two 2-px debayer inputs
//   phase=1: rd_dout holds the word just read -> first pair (p0,p1)
//   phase=0: cur holds the same word       -> second pair (p2,p3)
//---------------------------------------------------------------------
reg  run, phase, rd_en;
reg  [FMW-1:0] cur;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rbin <= 0; rgray <= 0;
        run <= 1'b0; phase <= 1'b0; rd_en <= 1'b0; cur <= {FMW{1'b0}};
    end else begin
        rd_en <= 1'b0;
        if (!run) begin
            if (!fifo_empty)
                run <= 1'b1;
        end else begin
            phase <= ~phase;
            if (!phase) begin
                if (!fifo_empty) begin
                    rd_en <= 1'b1;
                    rbin  <= rbin + 1'b1;
                    rgray <= bin2gray(rbin + 1'b1);
                end
            end else begin
                cur <= rd_dout;
            end
        end
    end
end

always @(posedge clk) begin
    if (rd_en)
        rd_dout <= mem[ridx];
end

wire [FMW-1:0] wc  = phase ? rd_dout : cur;
wire [39:0]    cx  = wc[39:0];
wire           cvs = wc[42];
wire           chs = wc[41];
wire           cde = wc[40];

wire [15:0] dbg_pair = phase ? {cx[19:12], cx[9:2]}     // p1,p0
                              : {cx[39:32], cx[29:22]}; // p3,p2
wire        dbg_de   = cde;
wire        dbg_vs   = cvs;
wire        dbg_hs   = chs;

//---------------------------------------------------------------------
// Debayer (2 px/clk)
//---------------------------------------------------------------------
wire        dbg_vs_o, dbg_hs_o, dbg_de_o, dbg_val_o;
wire [47:0] dbg_rgb;

debayer_top_2to1 u_debayer (
    .in_pclk     (clk),
    .in_rstn     (rst_n),
    .raw_vs_i    (dbg_vs),
    .raw_hs_i    (dbg_hs),
    .raw_de_i    (dbg_de),
    .raw_valid_i (dbg_de),
    .raw_datax4_i(dbg_pair),
    .rgb_vs_o    (dbg_vs_o),
    .rgb_hs_o    (dbg_hs_o),
    .rgb_de_o    (dbg_de_o),
    .rgb_valid_o (dbg_val_o),
    .rgb_datax2_o(dbg_rgb)
);

wire [7:0] r1 = dbg_rgb[47:40];
wire [7:0] g1 = dbg_rgb[39:32];
wire [7:0] b1 = dbg_rgb[31:24];
wire [7:0] r0 = dbg_rgb[23:16];
wire [7:0] g0 = dbg_rgb[15:8];
wire [7:0] b0 = dbg_rgb[7:0];

assign rgb_data = { r1[7:3], g1[7:2], b1[7:3],
                    r0[7:3], g0[7:2], b0[7:3] };
assign rgb_de   = dbg_de_o;
assign rgb_vs   = dbg_vs_o;

endmodule
