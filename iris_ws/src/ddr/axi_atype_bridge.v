//=====================================================================
// AXI4 -> efx_ddr3_axi "single address channel" bridge
//
// The frame buffer is a standard AXI4 master with separate AW and AR
// channels.  The Efinix DDR3 soft controller instead has ONE address
// channel (axi_a*) with axi_atype selecting write (1) or read (0).
// This bridge time-multiplexes AW and AR onto that shared channel.
// The W, B and R channels are wired straight through in top.v.
//
// The controller's internals contain independent AW/AR FSMs and address
// queues plus outstanding-transaction counters (outflow/iris_ws.map.v:
//   r_aw_state / r_ar_state, u_wr_addr_fifo / u_rd_addr_fifo,
//   r_wr_b_count[8:0] / r_rlast_cnt[15:0], top_mc/fifo_aw / fifo_ar),
// so overlapping read and write bursts are fully supported.  The only
// hardware limit is one address transfer per clk on the shared axi_a*
// bus (plus at most a one-cycle direction turnaround).
//
// This module therefore does nothing but time-multiplex the two address
// channels.  Read is granted first whenever it asks, because the display
// read path is real-time (data_tx holds only a half-line FIFO) while the
// write path has an 8.5-line WR FIFO fed by a slow sensor.  Read-side
// address-bus occupancy is <0.1% (one address per 14.8us against a
// 100MHz bus), so the writer can never starve.
//
// An earlier version of this module serialized WHOLE transactions (wait
// for B before accepting AR, wait for RLAST before accepting AW, and
// hard-prioritised writes).  That pattern was copied from a reference
// host's habit, not from any controller requirement, and it blocked the
// display read for the duration of every write burst.
//
// The bvalid/bready/rvalid/rlast/rready ports are kept so the top-level
// wiring is unchanged, but they are no longer observed here: response
// tracking lives in the controller's outstanding counters, and this
// bridge does not need a completion event to pick the next address.
// bready/rready are driven by the frame buffer on the top-level side.
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
    output wire            s_awready,

    // master read address (standard AXI4)
    input  wire [IDW-1:0]  s_arid,
    input  wire [AW-1:0]   s_araddr,
    input  wire [7:0]      s_arlen,
    input  wire [2:0]      s_arsize,
    input  wire [1:0]      s_arburst,
    input  wire [0:0]      s_arlock,
    input  wire            s_arvalid,
    output wire            s_arready,

    // shared address channel to the DDR3 controller
    output wire [7:0]      m_aid,
    output wire [AW-1:0]   m_aaddr,
    output wire [7:0]      m_alen,
    output wire [2:0]      m_asize,
    output wire [1:0]      m_aburst,
    output wire [1:0]      m_alock,
    output wire            m_atype,     // 1 = write, 0 = read
    output wire            m_avalid,
    input  wire            m_aready,

    // transaction completion observation (W/B/R wired through in top.v)
    // unused -- see header
    input  wire            bvalid,
    input  wire            bready,
    input  wire            rvalid,
    input  wire            rlast,
    input  wire            rready
);

    // Read wins whenever both channels ask.
    wire sel_ar = s_arvalid;
    wire sel_aw = s_awvalid & ~s_arvalid;

    assign s_awready = sel_aw & m_aready;
    assign s_arready = sel_ar & m_aready;

    assign m_avalid = sel_aw | sel_ar;
    assign m_atype  = sel_aw;

    assign m_aid    = sel_aw ? {{(8-IDW){1'b0}}, s_awid}  : {{(8-IDW){1'b0}}, s_arid};
    assign m_aaddr  = sel_aw ? s_awaddr                   : s_araddr;
    assign m_alen   = sel_aw ? s_awlen                    : s_arlen;
    assign m_asize  = sel_aw ? s_awsize                   : s_arsize;
    assign m_aburst = sel_aw ? s_awburst                  : s_arburst;
    assign m_alock  = sel_aw ? {1'b0, s_awlock}           : {1'b0, s_arlock};

endmodule
