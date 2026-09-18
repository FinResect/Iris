//=====================================================================
// Dual-bank grayscale frame buffer (camera write / display read)
//   - write port : camera pixel clock domain
//   - read  port : display (HDMI) pixel clock domain
//   - 2 banks selected by wr_bank / rd_bank for simple double buffering
//   Reusable video building block.
//=====================================================================

module frame_buf #(
    parameter IMG_W      = 240,
    parameter IMG_H      = 135,
    parameter ADDR_WIDTH = 16,
    parameter BANK_SHIFT = 15          // bank1 base = 2^BANK_SHIFT (>= IMG_W*IMG_H)
)(
    // write side
    input  wire                    wr_clk,
    input  wire                    wr_en,
    input  wire [ADDR_WIDTH-1:0]   wr_addr,
    input  wire [7:0]              wr_data,
    input  wire                    wr_bank,
    // read side
    input  wire                    rd_clk,
    input  wire [ADDR_WIDTH-1:0]   rd_addr,
    input  wire                    rd_bank,
    output wire [7:0]              rd_data
);

wire [ADDR_WIDTH-1:0] wr_full = wr_bank ? (wr_addr + (1 << BANK_SHIFT)) : wr_addr;
wire [ADDR_WIDTH-1:0] rd_full = rd_bank ? (rd_addr + (1 << BANK_SHIFT)) : rd_addr;

true_dual_port_ram #(
    .DATA_WIDTH  (8),
    .ADDR_WIDTH  (ADDR_WIDTH),
    .WRITE_MODE_1("READ_FIRST"),
    .WRITE_MODE_2("READ_FIRST"),
    .OUTPUT_REG_1("FALSE"),
    .OUTPUT_REG_2("FALSE"),
    .RAM_INIT_FILE(""),
    .RAM_INIT_RADIX("HEX")
) u_ram (
    .we1   (wr_en),
    .clka  (wr_clk),
    .din1  (wr_data),
    .addr1 (wr_full),
    .dout1 (),

    .we2   (1'b0),
    .clkb  (rd_clk),
    .din2  (8'd0),
    .addr2 (rd_full),
    .dout2 (rd_data)
);

endmodule
