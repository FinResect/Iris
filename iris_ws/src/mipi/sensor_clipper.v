module sensor_clipper(
    input clk,
    input i_hs,
    input i_vs,
    input i_de,
    input [39:0] i_dat,

    output reg o_hs,
    output reg o_vs,
    output reg o_de,
    output reg [39:0] o_dat
);

reg i_hs_r = 'd0;
reg i_vs_r = 'd0;
reg de_en = 1'b0;
wire vs_en ;
reg [9:0] hs_cnt = 'd0;
reg [10:0] vs_cnt = 'd0;
always @( posedge clk )
begin
    i_hs_r <= i_hs;
    i_vs_r <= i_vs;
end
wire pos_hs = {i_hs_r,i_hs} == 2'b01;
wire pos_vs = {i_vs_r,i_vs} == 2'b01;
always @( posedge clk )
begin
    if(pos_hs )
        de_en <= 1'b1;
    else if( hs_cnt == 479 && i_de)
        de_en <= 1'b0;
end

always @( posedge clk )
begin
    if( pos_hs )
        hs_cnt <= 'd0;
    else if( de_en & i_de )
        hs_cnt <= hs_cnt + 1'b1;
end

always @( posedge clk )
begin
    if( pos_vs)
        vs_cnt <= 'd0;
    else if( pos_hs )
        vs_cnt <= vs_cnt + 1'b1;
end


assign vs_en = vs_cnt >= 1 && vs_cnt <= 720;
always @( posedge clk )
begin
    o_dat <= i_dat[39:0];
    o_de <=  i_de & vs_en;//de_en &
    o_vs <= i_vs;
    o_hs <= i_hs;
end

endmodule
