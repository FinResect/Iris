//=====================================================================
// fps_counter: count frame-complete pulses over a 1 s gate.
//   Runs in the AXI/core clock domain (default 100 MHz).
//   Output fps is stable for a full second between updates; upd_toggle
//   flips on each latch so a destination domain can safely capture fps
//   with a 2-FF toggle synchronizer (data + toggle CDC).
//=====================================================================

module fps_counter #(
    parameter CLK_FREQ_HZ = 100_000_000
) (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       frame_pulse, // 1 pulse per completed frame (e.g. wr_sw)
    output reg  [7:0] fps,         // latched frames in last full second, sat 255
    output reg        upd_toggle   // flips when fps is latched
);

localparam integer GATE_CYCLES = CLK_FREQ_HZ - 1;

reg [31:0] gate_cnt;
reg [7:0]  frame_cnt;
reg        pulse_d;

wire pulse_rise = frame_pulse & ~pulse_d;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pulse_d    <= 1'b0;
        gate_cnt   <= 32'd0;
        frame_cnt  <= 8'd0;
        fps        <= 8'd0;
        upd_toggle <= 1'b0;
    end else begin
        pulse_d <= frame_pulse;

        if (gate_cnt == GATE_CYCLES[31:0]) begin
            gate_cnt   <= 32'd0;
            fps        <= frame_cnt;
            upd_toggle <= ~upd_toggle;
            // latch includes the pulse that lands on the gate tick itself
            frame_cnt  <= pulse_rise ? 8'd1 : 8'd0;
        end else begin
            gate_cnt <= gate_cnt + 1'b1;
            if (pulse_rise && !(&frame_cnt))
                frame_cnt <= frame_cnt + 1'b1;
        end
    end
end

endmodule
