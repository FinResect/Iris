//=====================================================================
// AXI4 -> efx_ddr3_axi "single address channel" bridge
//
// The frame buffer is a standard AXI4 master with separate AW and AR
// channels.  The Efinix DDR3 soft controller instead has ONE address
// channel (axi_a*) with axi_atype selecting write (1) or read (0).
// This bridge time-multiplexes AW and AR onto that shared channel.
// The W, B and R channels are wired straight through in top.v.
//
// Because the efx_ddr3_axi controller is driven strictly sequentially by
// its own reference host (memory_checker_axi: write -> wait bvalid ->
// read -> wait rlast), this bridge additionally serializes WHOLE
// transactions.  A read address is only accepted once the previous write
// burst has completed (B response observed), and a write address is only
// accepted once the previous read burst has completed (R last observed).
// This prevents write data from colliding with a concurrent read command
// on the controller's single command queue.
//=====================================================================
module axi_atype_bridge #(
    parameter IDW = 4,
    parameter AW  = 32
)(
    input  wire            clk,
    input  wire            rst_n,

    // master write address (standard AXI4)
    input  wire [IDW-1:0]  s_awid,
    input  wire [AW-1:0]   s_awaddr,
    input  wire [7:0]      s_awlen,
    input  wire [2:0]      s_awsize,
    input  wire [1:0]      s_awburst,
    input  wire [0:0]      s_awlock,
    input  wire            s_awvalid,
    output reg             s_awready,

    // master read address (standard AXI4)
    input  wire [IDW-1:0]  s_arid,
    input  wire [AW-1:0]   s_araddr,
    input  wire [7:0]      s_arlen,
    input  wire [2:0]      s_arsize,
    input  wire [1:0]      s_arburst,
    input  wire [0:0]      s_arlock,
    input  wire            s_arvalid,
    output reg             s_arready,

    // shared address channel to the DDR3 controller
    output reg  [7:0]      m_aid,
    output reg  [AW-1:0]   m_aaddr,
    output reg  [7:0]      m_alen,
    output reg  [2:0]      m_asize,
    output reg  [1:0]      m_aburst,
    output reg  [1:0]      m_alock,
    output reg             m_atype,     // 1 = write, 0 = read
    output reg             m_avalid,
    input  wire            m_aready,

    // transaction completion observation (W/B/R wired through in top.v)
    input  wire            bvalid,
    input  wire            bready,
    input  wire            rvalid,
    input  wire            rlast,
    input  wire            rready
);

    localparam S_IDLE    = 3'd0,
               S_AW      = 3'd1,   // write address handshake in progress
               S_AW_REL  = 3'd2,   // wait for master to drop awvalid
               S_WAIT_WR = 3'd3,   // wait for the write burst response (B)
               S_AR      = 3'd4,   // read address handshake in progress
               S_AR_REL  = 3'd5,   // wait for master to drop arvalid
               S_WAIT_RD = 3'd6;   // wait for the read burst last (R last)

    reg [2:0] state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state     <= S_IDLE;
            s_awready <= 1'b0;
            s_arready <= 1'b0;
            m_avalid  <= 1'b0;
            m_aid     <= 8'd0;
            m_aaddr   <= {AW{1'b0}};
            m_alen    <= 8'd0;
            m_asize   <= 3'd0;
            m_aburst  <= 2'd0;
            m_alock   <= 2'd0;
            m_atype   <= 1'b0;
        end else begin
            case (state)
                S_IDLE: begin
                    s_awready <= 1'b0;
                    s_arready <= 1'b0;
                    if (s_awvalid) begin
                        m_aid    <= {{(8-IDW){1'b0}}, s_awid};
                        m_aaddr  <= s_awaddr;
                        m_alen   <= s_awlen;
                        m_asize  <= s_awsize;
                        m_aburst <= s_awburst;
                        m_alock  <= {1'b0, s_awlock};
                        m_atype  <= 1'b1;
                        m_avalid <= 1'b1;
                        state    <= S_AW;
                    end else if (s_arvalid) begin
                        m_aid    <= {{(8-IDW){1'b0}}, s_arid};
                        m_aaddr  <= s_araddr;
                        m_alen   <= s_arlen;
                        m_asize  <= s_arsize;
                        m_aburst <= s_arburst;
                        m_alock  <= {1'b0, s_arlock};
                        m_atype  <= 1'b0;
                        m_avalid <= 1'b1;
                        state    <= S_AR;
                    end
                end
                S_AW: begin
                    if (m_aready) begin
                        m_avalid  <= 1'b0;
                        s_awready <= 1'b1;
                        state     <= S_AW_REL;
                    end
                end
                S_AW_REL: begin
                    if (!s_awvalid) begin
                        s_awready <= 1'b0;
                        state     <= S_WAIT_WR;
                    end
                end
                S_WAIT_WR: begin
                    if (bvalid && bready)
                        state <= S_IDLE;
                end
                S_AR: begin
                    if (m_aready) begin
                        m_avalid  <= 1'b0;
                        s_arready <= 1'b1;
                        state     <= S_AR_REL;
                    end
                end
                S_AR_REL: begin
                    if (!s_arvalid) begin
                        s_arready <= 1'b0;
                        state     <= S_WAIT_RD;
                    end
                end
                S_WAIT_RD: begin
                    if (rvalid && rlast && rready)
                        state <= S_IDLE;
                end
                default: state <= S_IDLE;
            endcase
        end
    end

endmodule
