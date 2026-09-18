//=====================================================================
// I2C register-sequence engine (generic, device-agnostic)
//   Steps through an external ROM of {reg_addr, data, rw} entries and
//   issues wr_en/rd_en requests to the byte-level I2C controller.
//   The ROM itself is supplied by the device layer (e.g. sc431hai_i2c_rom).
//=====================================================================

module i2c_master_reg_set #(
    parameter DATA_LENGTH = 161,
    parameter I2C_REG_ADDR_WIDTH = 16,
    parameter I2C_DATA_WIDTH = 8,
    parameter I2C_DEVICE_ADDR = 8'h60,
    parameter ROM_ADDR_WIDTH = $clog2(DATA_LENGTH)
)(
    input       wire                        clk,
    input       wire                        rst_n,

    input       wire                        init_done,  // I2C core initialised
    input       wire                        rd_done,    // one clock pulse
    input       wire                        wr_done,    // one clock pulse
    input       wire                        run,        // start/keep running the table

    output reg                              wr_en,      // one clock pulse
    output reg                              rd_en,      // one clock pulse
    output wire [I2C_REG_ADDR_WIDTH-1:0]    addr,       // i2c register address
    output wire [I2C_DATA_WIDTH-1:0]        dout,       // data to write
    output reg  [7:0]                       dev_addr,

    // external ROM interface
    output wire [ROM_ADDR_WIDTH-1:0]                    rom_addr,
    input  wire [I2C_REG_ADDR_WIDTH+I2C_DATA_WIDTH:0]   rom_data,

    output reg                              done
);

wire [I2C_REG_ADDR_WIDTH+I2C_DATA_WIDTH:0] rom_dout = rom_data;
reg  [ROM_ADDR_WIDTH-1:0] cnt;
reg  [2:0] state;

parameter S0 = 3'd0;
parameter S1 = 3'd1;
parameter S2 = 3'd2;
parameter S3 = 3'd3;
parameter S4 = 3'd4;

assign rom_addr = cnt;
assign addr = rom_dout[I2C_DATA_WIDTH+I2C_REG_ADDR_WIDTH : I2C_DATA_WIDTH+1];
assign dout = rom_dout[I2C_DATA_WIDTH:1];
wire rw_flag = rom_dout[0];

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n) begin
        cnt    <= 0;
        state  <= S0;
        rd_en  <= 1'b0;
        wr_en  <= 1'b0;
        done   <= 1'b0;
    end else if (!run) begin
        cnt    <= 0;
        state  <= S0;
        rd_en  <= 1'b0;
        wr_en  <= 1'b0;
        done   <= 1'b0;
    end else if (init_done) begin
        case (state)
            S0: begin
                if (cnt < DATA_LENGTH)
                    state <= S1;
                else
                    done <= 1'b1;
            end
            S1: state <= S2;
            S2: begin
                state <= S3;
                if (rw_flag) rd_en <= 1'b1;
                else         wr_en <= 1'b1;
            end
            S3: begin
                rd_en <= 1'b0;
                wr_en <= 1'b0;
                state <= S4;
            end
            S4: begin
                if (rd_done | wr_done) begin
                    state <= S0;
                    cnt   <= cnt + 1'b1;
                end
            end
            default:;
        endcase
    end
end

always @(posedge clk)
    dev_addr <= I2C_DEVICE_ADDR;

endmodule
