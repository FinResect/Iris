// 240x135 8-bit grayscale DDR3 frame buffer.
//
// Camera samples cross into axi_clk through a small asynchronous FIFO. The
// writer packs 16 pixels into one 128-bit beat, stages up to 16 beats in a
// BRAM FIFO and then streams a single INCR burst to DDR3. A completed camera
// bank is read back into a dual-clock local cache before display uses it. The
// local cache keeps the existing display_ctrl fixed-latency interface intact.
module ddr3_gray_frame_buffer #(
    parameter IMG_W       = 240,
    parameter IMG_H       = 135,
    parameter BANK_BYTES  = 32768,
    parameter FIFO_DEPTH  = 1024
) (
    input  wire         wr_clk,
    input  wire         rd_clk,
    input  wire         axi_clk,
    input  wire         rst_n,
    input  wire         ddr_ready,

    input  wire         cam_wr_en,
    input  wire [15:0]  cam_wr_addr,
    input  wire [7:0]   cam_wr_data,
    input  wire         cam_wr_bank,
    input  wire         display_rd_bank,
    input  wire [15:0]  display_rd_addr,
    output reg  [7:0]   display_rd_data,

    output reg  [3:0]   s_axi_awid,
    output reg  [27:0]  s_axi_awaddr,
    output reg  [7:0]   s_axi_awlen,
    output reg  [2:0]   s_axi_awsize,
    output reg  [1:0]   s_axi_awburst,
    output reg          s_axi_awlock,
    output reg  [3:0]   s_axi_awcache,
    output reg  [2:0]   s_axi_awprot,
    output reg  [3:0]   s_axi_awqos,
    output reg          s_axi_awvalid,
    input  wire         s_axi_awready,
    output wire [127:0] s_axi_wdata,
    output reg  [15:0]  s_axi_wstrb,
    output wire         s_axi_wlast,
    output wire         s_axi_wvalid,
    input  wire         s_axi_wready,
    output reg          s_axi_bready,
    input  wire [3:0]   s_axi_bid,
    input  wire [1:0]   s_axi_bresp,
    input  wire         s_axi_bvalid,
    output reg  [3:0]   s_axi_arid,
    output reg  [27:0]  s_axi_araddr,
    output reg  [7:0]   s_axi_arlen,
    output reg  [2:0]   s_axi_arsize,
    output reg  [1:0]   s_axi_arburst,
    output reg          s_axi_arlock,
    output reg  [3:0]   s_axi_arcache,
    output reg  [2:0]   s_axi_arprot,
    output reg  [3:0]   s_axi_arqos,
    output reg          s_axi_arvalid,
    input  wire         s_axi_arready,
    output reg          s_axi_rready,
    input  wire [3:0]   s_axi_rid,
    input  wire [127:0] s_axi_rdata,
    input  wire [1:0]   s_axi_rresp,
    input  wire         s_axi_rlast,
    input  wire         s_axi_rvalid,

    // temporary debug
    output wire         dbg_rd_busy,
    output wire         dbg_valid0,
    output wire         dbg_valid1,
    output wire         dbg_bank_diff,
    output reg          dbg_wr_abort,
    output reg          dbg_wr_burst,
    output reg          dbg_rd_burst,
    output reg          dbg_rd_done
);

localparam FRAME_BYTES = IMG_W * IMG_H;
localparam FIFO_AW = 10;

// Camera-to-AXI asynchronous sample FIFO.
reg [24:0] wr_fifo_mem [0:FIFO_DEPTH-1];
reg [FIFO_AW:0] wr_ptr_bin, wr_ptr_gray;
reg [FIFO_AW:0] wr_ptr_sync1, wr_ptr_sync2;
reg [FIFO_AW:0] rd_ptr_bin, rd_ptr_gray;
reg [FIFO_AW:0] rd_ptr_sync1, rd_ptr_sync2;
wire fifo_full = (wr_ptr_gray == {~rd_ptr_sync2[FIFO_AW:FIFO_AW-1], rd_ptr_sync2[FIFO_AW-2:0]});
wire fifo_empty = (rd_ptr_gray == wr_ptr_sync2);
wire [FIFO_AW-1:0] fifo_wr_index = wr_ptr_bin[FIFO_AW-1:0];
wire [FIFO_AW-1:0] fifo_rd_index = rd_ptr_bin[FIFO_AW-1:0];
wire [24:0] fifo_rd_data = wr_fifo_mem[fifo_rd_index];

function [FIFO_AW:0] bin2gray;
    input [FIFO_AW:0] value;
    bin2gray = (value >> 1) ^ value;
endfunction

always @(posedge wr_clk or negedge rst_n) begin
    if (!rst_n) begin
        wr_ptr_bin  <= 0;
        wr_ptr_gray <= 0;
    end else if (cam_wr_en && !fifo_full) begin
        wr_fifo_mem[fifo_wr_index] <= {cam_wr_bank, cam_wr_addr, cam_wr_data};
        wr_ptr_bin  <= wr_ptr_bin + 1'b1;
        wr_ptr_gray <= bin2gray(wr_ptr_bin + 1'b1);
    end
end

always @(posedge wr_clk or negedge rst_n) begin
    if (!rst_n) begin
        rd_ptr_sync1 <= 0;
        rd_ptr_sync2 <= 0;
    end else begin
        rd_ptr_sync1 <= rd_ptr_gray;
        rd_ptr_sync2 <= rd_ptr_sync1;
    end
end

always @(posedge axi_clk or negedge rst_n) begin
    if (!rst_n) begin
        wr_ptr_sync1 <= 0;
        wr_ptr_sync2 <= 0;
    end else begin
        wr_ptr_sync1 <= wr_ptr_gray;
        wr_ptr_sync2 <= wr_ptr_sync1;
    end
end

// Dual-clock cache. The AXI side writes it, the display side reads it.
reg        cache_we;
reg [11:0] cache_waddr;
reg [127:0] cache_wdata;
wire [11:0] cache_raddr = (display_rd_bank ? (BANK_BYTES / 16) : 0) + (display_rd_addr >> 4);
wire [127:0] cache_rword;
reg cache_valid0, cache_valid1;
reg display_bank_d1, display_bank_d2;
reg valid0_d1, valid0_d2, valid1_d1, valid1_d2;
wire display_cache_valid = display_rd_bank ? valid1_d2 : valid0_d2;

// temporary debug
reg  dbg_rd_busy_r, dbg_bank_diff_r;
assign dbg_rd_busy   = dbg_rd_busy_r;
assign dbg_bank_diff = dbg_bank_diff_r;
assign dbg_valid0    = cache_valid0;
assign dbg_valid1    = cache_valid1;

true_dual_port_ram #(
    .DATA_WIDTH   (128),
    .ADDR_WIDTH   (12),
    .WRITE_MODE_1 ("READ_FIRST"),
    .WRITE_MODE_2 ("READ_FIRST"),
    .OUTPUT_REG_1 ("FALSE"),
    .OUTPUT_REG_2 ("FALSE"),
    .RAM_INIT_FILE("")
) u_frame_cache (
    .we1   (cache_we),
    .we2   (1'b0),
    .clka  (axi_clk),
    .clkb  (rd_clk),
    .din1  (cache_wdata),
    .din2  (128'd0),
    .addr1 (cache_waddr),
    .addr2 (cache_raddr),
    .dout1 (),
    .dout2 (cache_rword)
);

always @(posedge rd_clk or negedge rst_n) begin
    if (!rst_n) begin
        display_bank_d1 <= 1'b0;
        display_bank_d2 <= 1'b0;
        valid0_d1 <= 1'b0;
        valid0_d2 <= 1'b0;
        valid1_d1 <= 1'b0;
        valid1_d2 <= 1'b0;
        display_rd_data <= 8'd0;
    end else begin
        display_bank_d1 <= display_rd_bank;
        display_bank_d2 <= display_bank_d1;
        valid0_d1 <= cache_valid0;
        valid0_d2 <= valid0_d1;
        valid1_d1 <= cache_valid1;
        valid1_d2 <= valid1_d1;
        if (display_cache_valid)
            display_rd_data <= cache_rword[(display_rd_addr[3:0] * 8) +: 8];
        else
            display_rd_data <= 8'd0;
    end
end

//=====================================================================
// AXI writer: streaming INCR bursts addressed by the FIFO head.
//   16 pixels -> one 128-bit beat, staged in a BRAM FIFO, then a 16-beat
//   burst at the head address. The head address is the DDR frame offset,
//   so the layout self-aligns after the first wrap. A burst that reaches a
//   camera frame boundary is committed short (no abort / resync loop).
//=====================================================================
localparam WR_IDLE = 3'd0, WR_COLLECT = 3'd1, WR_AW = 3'd2,
           WR_W = 3'd3, WR_B = 3'd4;

localparam WR_BEATS = 16;

reg [2:0]   wr_state;
reg [4:0]   wr_beat;        // completed beats in current burst (0..WR_BEATS)
reg [4:0]   wr_beats;       // beats committed to the active burst
reg [3:0]   wr_bpix;        // pixel index within the beat being assembled
reg [127:0] wr_pack;        // 16-pixel beat being assembled
reg         wr_flush;       // push assembled beat into the staging FIFO
reg [15:0]  wr_burst_base;  // byte address of the current burst start
reg         wr_bank;
reg [4:0]   wr_widx;        // W beat index while draining
reg         wr_rdy;         // staged beat is available on bf_rddata
reg         wr_frame_end;   // active burst reached a camera frame boundary
reg         wr_frame_done;  // pulse: a complete frame has been written
reg         wr_done_bank;   // bank of the frame just written

// BRAM staging FIFO (128-bit x 32).
wire [127:0] bf_rddata;
wire         bf_rdempty;
wire         bf_dataval;
wire         bf_wrfull;
reg          bf_wren;
reg          wr_req;
wire         bf_rden = wr_req;

DC_FIFO #(
    .FIFO_MODE  ("Normal"),
    .DATA_WIDTH (128),
    .FIFO_DEPTH (32)
) u_burst_fifo (
    .Reset      (~rst_n),
    .WrClk      (axi_clk),
    .WrEn       (bf_wren),
    .WrDNum     (),
    .WrFull     (bf_wrfull),
    .WrData     (wr_pack),
    .RdClk      (axi_clk),
    .RdEn       (bf_rden),
    .RdDNum     (),
    .RdEmpty    (bf_rdempty),
    .DataVal    (bf_dataval),
    .RdData     (bf_rddata)
);

assign s_axi_wdata  = bf_rddata;
assign s_axi_wvalid = wr_rdy;
assign s_axi_wlast  = (wr_widx == (wr_beats - 1'b1));

always @(posedge axi_clk or negedge rst_n) begin
    if (!rst_n) begin
        rd_ptr_bin <= 0;
        rd_ptr_gray <= 0;
        wr_state <= WR_IDLE;
        wr_beat <= 5'd0;
        wr_beats <= 5'd0;
        wr_bpix <= 4'd0;
        wr_pack <= 128'd0;
        wr_flush <= 1'b0;
        wr_burst_base <= 16'd0;
        wr_bank <= 1'b0;
        wr_widx <= 5'd0;
        wr_rdy <= 1'b0;
        wr_req <= 1'b0;
        wr_frame_end <= 1'b0;
        wr_frame_done <= 1'b0;
        wr_done_bank <= 1'b0;
        bf_wren <= 1'b0;
        s_axi_awvalid <= 1'b0;
        s_axi_bready <= 1'b0;
        s_axi_awid <= 0;
        s_axi_awaddr <= 0;
        s_axi_awlen <= 8'd15;
        s_axi_awsize <= 3'd4;
        s_axi_awburst <= 2'b01;
        s_axi_awlock <= 0;
        s_axi_awcache <= 0;
        s_axi_awprot <= 0;
        s_axi_awqos <= 0;
        s_axi_wstrb <= 16'hffff;
        dbg_wr_abort <= 1'b0;
        dbg_wr_burst <= 1'b0;
    end else begin
        bf_wren <= 1'b0;
        dbg_wr_abort <= 1'b0;
        dbg_wr_burst <= 1'b0;
        wr_frame_done <= 1'b0;
        case (wr_state)
            WR_IDLE: begin
                s_axi_awvalid <= 1'b0;
                s_axi_bready <= 1'b0;
                wr_rdy <= 1'b0;
                wr_req <= 1'b0;
                wr_flush <= 1'b0;
                if (ddr_ready && !fifo_empty) begin
                    // burst base follows the FIFO head: the head address is
                    // the DDR frame offset, so the layout self-aligns.
                    wr_bank       <= fifo_rd_data[24];
                    wr_burst_base <= fifo_rd_data[23:8];
                    wr_beat       <= 5'd0;
                    wr_bpix       <= 4'd0;
                    wr_pack       <= 128'd0;
                    wr_state      <= WR_COLLECT;
                end
            end
            WR_COLLECT: begin
                if (wr_flush) begin
                    // beat finished last cycle; write the complete beat out
                    bf_wren  <= 1'b1;
                    wr_flush <= 1'b0;
                    if (wr_beat == WR_BEATS) begin
                        wr_beats <= 5'd16;
                        wr_state <= WR_AW;
                    end
                end else if (!fifo_empty) begin
                    if ((wr_bpix == 4'd0) && (fifo_rd_data[24] != wr_bank)) begin
                        // crossed into the next camera frame: commit the burst
                        // collected so far (short at the frame tail).
                        dbg_wr_abort <= 1'b1;
                        if (wr_beat != 5'd0) begin
                            wr_beats     <= wr_beat;
                            wr_frame_end <= 1'b1;
                            wr_state     <= WR_AW;
                        end else begin
                            wr_state <= WR_IDLE;
                        end
                    end else begin
                        wr_pack[wr_bpix*8 +: 8] <= fifo_rd_data[7:0];
                        rd_ptr_bin  <= rd_ptr_bin + 1'b1;
                        rd_ptr_gray <= bin2gray(rd_ptr_bin + 1'b1);
                        if (wr_bpix == 4'd15) begin
                            wr_bpix  <= 4'd0;
                            wr_beat  <= wr_beat + 1'b1;
                            wr_flush <= 1'b1;
                        end else begin
                            wr_bpix <= wr_bpix + 1'b1;
                        end
                    end
                end
            end
            WR_AW: begin
                s_axi_awaddr  <= (wr_bank ? BANK_BYTES : 0) + wr_burst_base;
                s_axi_awlen   <= wr_beats - 1'b1;
                s_axi_awvalid <= 1'b1;
                if (s_axi_awready) begin
                    s_axi_awvalid <= 1'b0;
                    wr_widx  <= 5'd0;
                    wr_rdy   <= 1'b0;
                    wr_req   <= 1'b1;
                    wr_state <= WR_W;
                end
            end
            WR_W: begin
                wr_req <= 1'b0;
                if (!wr_rdy) begin
                    if (bf_dataval)
                        wr_rdy <= 1'b1;
                end else if (s_axi_wready) begin
                    if (wr_widx == (wr_beats - 1'b1)) begin
                        wr_rdy       <= 1'b0;
                        s_axi_bready <= 1'b1;
                        wr_state     <= WR_B;
                    end else begin
                        wr_widx <= wr_widx + 1'b1;
                        wr_rdy  <= 1'b0;
                        wr_req  <= 1'b1;
                    end
                end
            end
            WR_B: begin
                if (s_axi_bvalid) begin
                    dbg_wr_burst <= 1'b1;
                    s_axi_bready <= 1'b0;
                    if (wr_frame_end) begin
                        wr_frame_end  <= 1'b0;
                        wr_frame_done <= 1'b1;
                        wr_done_bank  <= wr_bank;
                    end
                    wr_state <= WR_IDLE;
                end
            end
            default: wr_state <= WR_IDLE;
        endcase
    end
end

// AXI reader: refresh the completed camera bank into the local cache,
// using RD_BEATS-beat INCR bursts.
localparam RD_IDLE = 2'd0, RD_AR = 2'd1, RD_R = 2'd2;
localparam RD_BEATS  = 16;
localparam RD_BYTES  = RD_BEATS * 16;                                   // 256
localparam RD_BURSTS = (FRAME_BYTES + RD_BYTES - 1) / RD_BYTES;         // 127

reg [1:0] rd_state;
reg [7:0] rd_burst;
reg [4:0] rd_beat;
reg read_bank;
integer ri;

always @(posedge axi_clk or negedge rst_n) begin
    if (!rst_n) begin
        read_bank <= 1'b1;
        rd_burst <= 0;
        rd_beat <= 0;
        cache_valid0 <= 1'b0;
        cache_valid1 <= 1'b0;
        cache_we <= 1'b0;
        cache_waddr <= 0;
        cache_wdata <= 0;
        dbg_rd_busy_r <= 1'b0;
        dbg_bank_diff_r <= 1'b0;
        dbg_rd_burst <= 1'b0;
        dbg_rd_done <= 1'b0;
        rd_state <= RD_IDLE;
        s_axi_arvalid <= 1'b0;
        s_axi_rready <= 1'b0;
        s_axi_arid <= 0;
        s_axi_araddr <= 0;
        s_axi_arlen <= 8'd15;
        s_axi_arsize <= 3'd4;
        s_axi_arburst <= 2'b01;
        s_axi_arlock <= 0;
        s_axi_arcache <= 0;
        s_axi_arprot <= 0;
        s_axi_arqos <= 0;
    end else begin
        cache_we <= 1'b0;
        dbg_rd_burst <= 1'b0;
        dbg_rd_done <= 1'b0;
        case (rd_state)
            RD_IDLE: begin
                s_axi_arvalid <= 1'b0;
                s_axi_rready <= 1'b0;
                // start only after the writer reports a fully written frame
                if (ddr_ready && wr_frame_done) begin
                    read_bank <= wr_done_bank;
                    rd_burst <= 0;
                    dbg_bank_diff_r <= 1'b1;
                    dbg_rd_busy_r   <= 1'b1;
                    if (wr_done_bank)
                        cache_valid1 <= 1'b0;
                    else
                        cache_valid0 <= 1'b0;
                    rd_state <= RD_AR;
                end
            end
            RD_AR: begin
                s_axi_araddr <= (read_bank ? BANK_BYTES : 0) + (rd_burst * RD_BYTES);
                s_axi_arlen  <= RD_BEATS - 1;
                s_axi_arvalid <= 1'b1;
                if (s_axi_arready) begin
                    s_axi_arvalid <= 1'b0;
                    s_axi_rready <= 1'b1;
                    rd_beat <= 0;
                    rd_state <= RD_R;
                end
            end
            RD_R: begin
                if (s_axi_rvalid) begin
                    cache_we <= 1'b1;
                    cache_waddr <= (read_bank ? (BANK_BYTES / 16) : 0)
                                   + (rd_burst * RD_BEATS) + rd_beat;
                    cache_wdata <= s_axi_rdata;
                    if (rd_beat == RD_BEATS-1) begin
                        s_axi_rready <= 1'b0;
                        dbg_rd_burst <= 1'b1;
                        if (rd_burst == RD_BURSTS-1) begin
                            dbg_rd_done <= 1'b1;
                            if (read_bank)
                                cache_valid1 <= 1'b1;
                            else
                                cache_valid0 <= 1'b1;
                            rd_state <= RD_IDLE;
                        end else begin
                            rd_burst <= rd_burst + 1'b1;
                            rd_state <= RD_AR;
                        end
                    end else begin
                        rd_beat <= rd_beat + 1'b1;
                    end
                end
            end
            default: rd_state <= RD_IDLE;
        endcase
    end
end

endmodule
