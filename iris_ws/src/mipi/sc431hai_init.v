//=====================================================================
// SC431HAI sensor bring-up (device specific)
//   - power-on sequencing: XSHUTDN (active low) released, then wait
//     >= 4ms before programming registers
//   - runs the SC431HAI I2C register table once, through the generic
//     i2c_subsystem (src/i2c)
//   - leaves a bus-agnostic register port for a future RISC-V (APB /
//     AXI4-Lite adapter), selected with cpu_mode
//=====================================================================

module sc431hai_init #(
    parameter CLK_HZ             = 27_000_000,
    parameter CAM_RST_ACTIVE_HIGH = 1'b1   // 1: reset = 1 (07/10 demo behaviour)
)(
    input  wire         clk,
    input  wire         rst_n,

    // sensor reset (XSHUTDN): low = reset, high = release
    output wire         cam_rst,

    // I2C pads
    input  wire         scl_pad_i,
    output wire         scl_pad_o,
    output wire         scl_padoen_o,
    input  wire         sda_pad_i,
    output wire         sda_pad_o,
    output wire         sda_padoen_o,

    output wire         init_done,
    output wire         sensor_id_ok,   // sensor replied 0xCD6B on 0x3107/08

    // ---- reserved CPU / RISC-V control port (bus agnostic) ----
    input  wire         cpu_mode,       // 0 = auto init, 1 = CPU control
    input  wire [2:0]   cpu_addr,
    input  wire [7:0]   cpu_wdata,
    input  wire         cpu_we,
    input  wire         cpu_stb,
    output wire [7:0]   cpu_rdata,
    output wire         cpu_ack
);

// ------------------------------------------------------------------ timing
// hold XSHUTDN low for ~9.7ms (2^18 / 27MHz), then release and wait
// another ~4.8ms (2^17 / 27MHz) before starting I2C.
reg [17:0] pwr_cnt;
wire       pwr_done = pwr_cnt[17];

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        pwr_cnt <= 18'd0;
    else if (!pwr_done)
        pwr_cnt <= pwr_cnt + 1'b1;
end

// Official 07/10 demos drive GPIOR_16 low while running (o_cam_rst_p = ~w_arstn),
// i.e. reset is asserted high and released low.
assign cam_rst = CAM_RST_ACTIVE_HIGH ? ~pwr_done : pwr_done;

reg [16:0] dly_cnt;
wire       dly_done = dly_cnt[16];

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        dly_cnt <= 17'd0;
    else if (pwr_done && !dly_done)
        dly_cnt <= dly_cnt + 1'b1;
end

wire i2c_start = pwr_done && dly_done;

// --------------------------------------------------------------- I2C + ROM
wire [7:0]  rom_addr;
wire [24:0] rom_data;

sc431hai_i2c_rom u_rom (
    .clock      (clk),
    .addr_ptr   (rom_addr),
    .rdata_out  (rom_data)
);

i2c_subsystem #(
    .DATA_LENGTH        (165),
    .I2C_REG_ADDR_WIDTH (16),
    .I2C_DATA_WIDTH     (8),
    .I2C_DEVICE_ADDR    (8'h60),
    .CLK_DIV            (16'h00A9)          // ~40 kHz @27MHz (match 07/10 demo)
) u_i2c (
    .clk            (clk),
    .rst_n          (rst_n),

    .scl_pad_i      (scl_pad_i),
    .scl_pad_o      (scl_pad_o),
    .scl_padoen_o   (scl_padoen_o),
    .sda_pad_i      (sda_pad_i),
    .sda_pad_o      (sda_pad_o),
    .sda_padoen_o   (sda_padoen_o),

    .start          (i2c_start),
    .mode           (cpu_mode),
    .busy           (),
    .done           (init_done),
    .sensor_id_ok   (sensor_id_ok),
    .sensor_dout    (),

    .rom_addr       (rom_addr),
    .rom_data       (rom_data),

    .cpu_addr       (cpu_addr),
    .cpu_wdata      (cpu_wdata),
    .cpu_we         (cpu_we),
    .cpu_stb        (cpu_stb),
    .cpu_rdata      (cpu_rdata),
    .cpu_ack        (cpu_ack)
);

endmodule
