module uart_rx_tx #(
			parameter CLK_RATE = 27000000,
			parameter BPS_RATE = 115200,
			parameter STOP_BIT_W = 2'b00,		//00: stop_bit = 1; 01: stop_bit = 1.5 ; 10 : stop_bit = 2
			parameter CHECKSUM_MODE = 2'b00, //00:space, 01:odd ,10:even ,11:mask
			parameter CHECKSUM_EN = 1'b0
)(
		input		wire				clk,
		input   	wire 				rst_n,
		input		wire				rxd,
		output	wire				txd,
		
		input		wire				tx_valid,
		input		wire	[7:0]	tx_data,
		output	wire				tx_req,
		output 		wire   		rx_valid,
		output  	wire  [7:0] rx_data
		
);
localparam BPS_CNT_DATA = CLK_RATE/BPS_RATE;

//===========================================================================
//
//===========================================================================
uart_tx #(
		.BPS_CNT(BPS_CNT_DATA),
		.STOP_BIT_W(STOP_BIT_W),//00: stop_bit = 1; 01: stop_bit = 1.5 ; 10 : stop_bit = 2
		.CHECKSUM_MODE(CHECKSUM_MODE),//00:space, 01:odd ,10:even ,11:mask  
		.CHECKSUM_EN(CHECKSUM_EN)
		)uart_tx01(
	.clk					(clk),
	.tx_data			(tx_data),
	.tx_valid			(tx_valid),
	.tx_req				(tx_req),
	.tx_over			(tx_over),
	.tx_busy			(tx_busy),
	.txd            (txd)
	);
	
	
	 uart_rx #(
	 .BPS_CNT(BPS_CNT_DATA),
	 .CHECKSUM_MODE(CHECKSUM_MODE),//00:space, 01:odd ,10:even ,11:mask    
	 .CHECKSUM_EN(CHECKSUM_EN)  
	 )uart01_rx(

	.clk					(clk),     //clk == 27M 
	.rst_n 				(rst_n),
	.clear				(rx_valid ),
	.rxd					(rxd),
	.rx_data			(rx_data),
	.rx_valid			(rx_valid),
	.frame_error	(frame_error) 	,	     
	.checksum_error	(checksum_error) );		
	
	
endmodule