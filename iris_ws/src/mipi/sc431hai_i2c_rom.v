//=====================================================================
// SC431HAI MIPI camera initialisation table (device specific)
//   163 entries of {reg_addr[15:0], data[7:0], rw} @ 0x00..0xA2
//   1920x1080 RAW10, 4-lane, stream on (0x0100=0x01)
//   VTS=1150 (~39 fps target), exposure 512 half-lines.
//   Array window / output crop kept at the vendor defaults (0x3200-0x3207
//   semantics undocumented; changing them broke the output width).
//   Consumed by i2c_subsystem (src/i2c).
//   Implemented as a registered case-ROM (no BRAM init dependency).
//=====================================================================

module sc431hai_i2c_rom #(
    parameter ROM_SIZE        = 25,
    parameter TOTAL_ROM_DEPTH = 256,
    parameter ADDR_WIDTH      = 8
) (
    input  wire                  clock,
    input  wire [ADDR_WIDTH-1:0] addr_ptr,
    output reg  [ROM_SIZE-1:0]   rdata_out
);

always @(posedge clock)
begin
    case (addr_ptr)
        8'h00: rdata_out <= {16'h0100,8'h00,1'b0};
        8'h01: rdata_out <= {16'h36e9,8'h80,1'b0};
        8'h02: rdata_out <= {16'h37f9,8'h80,1'b0};
        8'h03: rdata_out <= {16'h301f,8'h10,1'b0};
        8'h04: rdata_out <= {16'h3058,8'h21,1'b0};
        8'h05: rdata_out <= {16'h3059,8'h53,1'b0};
        8'h06: rdata_out <= {16'h305a,8'h40,1'b0};
        8'h07: rdata_out <= {16'h3250,8'h00,1'b0};
        8'h08: rdata_out <= {16'h3301,8'h0c,1'b0};
        8'h09: rdata_out <= {16'h3304,8'h50,1'b0};
        8'h0a: rdata_out <= {16'h3305,8'h00,1'b0};
        8'h0b: rdata_out <= {16'h3306,8'h50,1'b0};
        8'h0c: rdata_out <= {16'h3307,8'h04,1'b0};
        8'h0d: rdata_out <= {16'h3308,8'h0a,1'b0};
        8'h0e: rdata_out <= {16'h3309,8'h60,1'b0};
        8'h0f: rdata_out <= {16'h330b,8'hc8,1'b0};
        8'h10: rdata_out <= {16'h330d,8'h08,1'b0};
        8'h11: rdata_out <= {16'h330e,8'h38,1'b0};
        8'h12: rdata_out <= {16'h331e,8'h41,1'b0};
        8'h13: rdata_out <= {16'h331f,8'h51,1'b0};
        8'h14: rdata_out <= {16'h3333,8'h10,1'b0};
        8'h15: rdata_out <= {16'h3334,8'h40,1'b0};
        8'h16: rdata_out <= {16'h3364,8'h5e,1'b0};
        8'h17: rdata_out <= {16'h338e,8'he2,1'b0};
        8'h18: rdata_out <= {16'h338f,8'h80,1'b0};
        8'h19: rdata_out <= {16'h3390,8'h08,1'b0};
        8'h1a: rdata_out <= {16'h3391,8'h18,1'b0};
        8'h1b: rdata_out <= {16'h3392,8'hb8,1'b0};
        8'h1c: rdata_out <= {16'h3393,8'h12,1'b0};
        8'h1d: rdata_out <= {16'h3394,8'h14,1'b0};
        8'h1e: rdata_out <= {16'h3395,8'h10,1'b0};
        8'h1f: rdata_out <= {16'h3396,8'h88,1'b0};
        8'h20: rdata_out <= {16'h3397,8'h98,1'b0};
        8'h21: rdata_out <= {16'h3398,8'hb8,1'b0};
        8'h22: rdata_out <= {16'h3399,8'h10,1'b0};
        8'h23: rdata_out <= {16'h339a,8'h16,1'b0};
        8'h24: rdata_out <= {16'h339b,8'h1c,1'b0};
        8'h25: rdata_out <= {16'h339c,8'h40,1'b0};
        8'h26: rdata_out <= {16'h33ac,8'h0a,1'b0};
        8'h27: rdata_out <= {16'h33ad,8'h10,1'b0};
        8'h28: rdata_out <= {16'h33ae,8'h4f,1'b0};
        8'h29: rdata_out <= {16'h33af,8'h5e,1'b0};
        8'h2a: rdata_out <= {16'h33b2,8'h50,1'b0};
        8'h2b: rdata_out <= {16'h33b3,8'h10,1'b0};
        8'h2c: rdata_out <= {16'h33f8,8'h00,1'b0};
        8'h2d: rdata_out <= {16'h33f9,8'h50,1'b0};
        8'h2e: rdata_out <= {16'h33fa,8'h00,1'b0};
        8'h2f: rdata_out <= {16'h33fb,8'h50,1'b0};
        8'h30: rdata_out <= {16'h33fc,8'h48,1'b0};
        8'h31: rdata_out <= {16'h33fd,8'h78,1'b0};
        8'h32: rdata_out <= {16'h349f,8'h03,1'b0};
        8'h33: rdata_out <= {16'h34a6,8'h40,1'b0};
        8'h34: rdata_out <= {16'h34a7,8'h58,1'b0};
        8'h35: rdata_out <= {16'h34a8,8'h10,1'b0};
        8'h36: rdata_out <= {16'h34a9,8'h10,1'b0};
        8'h37: rdata_out <= {16'h34f8,8'h78,1'b0};
        8'h38: rdata_out <= {16'h34f9,8'h10,1'b0};
        8'h39: rdata_out <= {16'h3633,8'h44,1'b0};
        8'h3a: rdata_out <= {16'h363b,8'h8f,1'b0};
        8'h3b: rdata_out <= {16'h363c,8'h02,1'b0};
        8'h3c: rdata_out <= {16'h3641,8'h08,1'b0};
        8'h3d: rdata_out <= {16'h3654,8'h20,1'b0};
        8'h3e: rdata_out <= {16'h3674,8'hc2,1'b0};
        8'h3f: rdata_out <= {16'h3675,8'hb4,1'b0};
        8'h40: rdata_out <= {16'h3676,8'h88,1'b0};
        8'h41: rdata_out <= {16'h367c,8'h88,1'b0};
        8'h42: rdata_out <= {16'h367d,8'hb8,1'b0};
        8'h43: rdata_out <= {16'h3690,8'h34,1'b0};
        8'h44: rdata_out <= {16'h3691,8'h44,1'b0};
        8'h45: rdata_out <= {16'h3692,8'h54,1'b0};
        8'h46: rdata_out <= {16'h3693,8'h88,1'b0};
        8'h47: rdata_out <= {16'h3694,8'h98,1'b0};
        8'h48: rdata_out <= {16'h3696,8'h80,1'b0};
        8'h49: rdata_out <= {16'h3697,8'h83,1'b0};
        8'h4a: rdata_out <= {16'h3698,8'h81,1'b0};
        8'h4b: rdata_out <= {16'h3699,8'h81,1'b0};
        8'h4c: rdata_out <= {16'h369a,8'h84,1'b0};
        8'h4d: rdata_out <= {16'h369b,8'h82,1'b0};
        8'h4e: rdata_out <= {16'h36a2,8'h80,1'b0};
        8'h4f: rdata_out <= {16'h36a3,8'h88,1'b0};
        8'h50: rdata_out <= {16'h36a4,8'hf8,1'b0};
        8'h51: rdata_out <= {16'h36a5,8'hb8,1'b0};
        8'h52: rdata_out <= {16'h36a6,8'h98,1'b0};
        8'h53: rdata_out <= {16'h36d0,8'h15,1'b0};
        8'h54: rdata_out <= {16'h36ea,8'h23,1'b0};
        8'h55: rdata_out <= {16'h36eb,8'h0d,1'b0};
        8'h56: rdata_out <= {16'h36ec,8'h65,1'b0};
        8'h57: rdata_out <= {16'h36ed,8'h18,1'b0};
        8'h58: rdata_out <= {16'h370f,8'h01,1'b0};
        8'h59: rdata_out <= {16'h3722,8'h03,1'b0};
        8'h5a: rdata_out <= {16'h3724,8'h92,1'b0};
        8'h5b: rdata_out <= {16'h3727,8'h14,1'b0};
        8'h5c: rdata_out <= {16'h37b0,8'h17,1'b0};
        8'h5d: rdata_out <= {16'h37b1,8'h9b,1'b0};
        8'h5e: rdata_out <= {16'h37b2,8'h9b,1'b0};
        8'h5f: rdata_out <= {16'h37b3,8'h88,1'b0};
        8'h60: rdata_out <= {16'h37b4,8'hb8,1'b0};
        8'h61: rdata_out <= {16'h37fa,8'h23,1'b0};
        8'h62: rdata_out <= {16'h37fb,8'h54,1'b0};
        8'h63: rdata_out <= {16'h37fc,8'h21,1'b0};
        8'h64: rdata_out <= {16'h37fd,8'h1c,1'b0};
        8'h65: rdata_out <= {16'h391f,8'h41,1'b0};
        8'h66: rdata_out <= {16'h3926,8'he0,1'b0};
        8'h67: rdata_out <= {16'h3933,8'h80,1'b0};
        8'h68: rdata_out <= {16'h3934,8'hf8,1'b0};
        8'h69: rdata_out <= {16'h3935,8'h00,1'b0};
        8'h6a: rdata_out <= {16'h3936,8'h45,1'b0};
        8'h6b: rdata_out <= {16'h3937,8'h66,1'b0};
        8'h6c: rdata_out <= {16'h3938,8'h66,1'b0};
        8'h6d: rdata_out <= {16'h3939,8'h00,1'b0};
        8'h6e: rdata_out <= {16'h393a,8'h03,1'b0};
        8'h6f: rdata_out <= {16'h393b,8'h00,1'b0};
        8'h70: rdata_out <= {16'h393c,8'h00,1'b0};
        8'h71: rdata_out <= {16'h393d,8'h02,1'b0};
        8'h72: rdata_out <= {16'h393e,8'h80,1'b0};
        8'h73: rdata_out <= {16'h3e00,8'h00,1'b0};
        8'h74: rdata_out <= {16'h3e01,8'h20,1'b0};
        8'h75: rdata_out <= {16'h3e02,8'h00,1'b0};
        8'h76: rdata_out <= {16'h3e16,8'h00,1'b0};
        8'h77: rdata_out <= {16'h3e17,8'hc5,1'b0};
        8'h78: rdata_out <= {16'h3e18,8'h00,1'b0};
        8'h79: rdata_out <= {16'h3e19,8'hc5,1'b0};
        8'h7a: rdata_out <= {16'h4509,8'h20,1'b0};
        8'h7b: rdata_out <= {16'h450d,8'h0b,1'b0};
        8'h7c: rdata_out <= {16'h5780,8'h76,1'b0};
        8'h7d: rdata_out <= {16'h5784,8'h0a,1'b0};
        8'h7e: rdata_out <= {16'h5785,8'h04,1'b0};
        8'h7f: rdata_out <= {16'h5787,8'h0a,1'b0};
        8'h80: rdata_out <= {16'h5788,8'h0a,1'b0};
        8'h81: rdata_out <= {16'h5789,8'h08,1'b0};
        8'h82: rdata_out <= {16'h578a,8'h0a,1'b0};
        8'h83: rdata_out <= {16'h578b,8'h0a,1'b0};
        8'h84: rdata_out <= {16'h578c,8'h08,1'b0};
        8'h85: rdata_out <= {16'h578d,8'h40,1'b0};
        8'h86: rdata_out <= {16'h5790,8'h08,1'b0};
        8'h87: rdata_out <= {16'h5791,8'h04,1'b0};
        8'h88: rdata_out <= {16'h5792,8'h04,1'b0};
        8'h89: rdata_out <= {16'h5793,8'h08,1'b0};
        8'h8a: rdata_out <= {16'h5794,8'h04,1'b0};
        8'h8b: rdata_out <= {16'h5795,8'h04,1'b0};
        8'h8c: rdata_out <= {16'h57ac,8'h00,1'b0};
        8'h8d: rdata_out <= {16'h57ad,8'h00,1'b0};
        8'h8e: rdata_out <= {16'h36e9,8'h53,1'b0};
        8'h8f: rdata_out <= {16'h37f9,8'h53,1'b0};
        8'h90: rdata_out <= {16'h0100,8'h01,1'b0};
        8'h91: rdata_out <= {16'h3200,8'h00,1'b0};
        8'h92: rdata_out <= {16'h3201,8'h00,1'b0};
        8'h93: rdata_out <= {16'h3202,8'h00,1'b0};
        8'h94: rdata_out <= {16'h3203,8'hb3,1'b0};
        8'h95: rdata_out <= {16'h3204,8'h0a,1'b0};
        8'h96: rdata_out <= {16'h3205,8'h07,1'b0};
        8'h97: rdata_out <= {16'h3206,8'h04,1'b0};
        8'h98: rdata_out <= {16'h3207,8'hf4,1'b0};
        8'h99: rdata_out <= {16'h3208,8'h07,1'b0};
        8'h9a: rdata_out <= {16'h3209,8'h80,1'b0};
        8'h9b: rdata_out <= {16'h320a,8'h04,1'b0};
        8'h9c: rdata_out <= {16'h320b,8'h38,1'b0};
        8'h9d: rdata_out <= {16'h3210,8'h01,1'b0};
        8'h9e: rdata_out <= {16'h3211,8'h44,1'b0};
        8'h9f: rdata_out <= {16'h3212,8'h00,1'b0};
        8'ha0: rdata_out <= {16'h3213,8'h05,1'b0};
        8'ha1: rdata_out <= {16'h320e,8'h04,1'b0};
        8'ha2: rdata_out <= {16'h320f,8'h7e,1'b0};
        default: rdata_out <= {ROM_SIZE{1'b0}};
    endcase
end

endmodule
