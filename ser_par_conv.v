// serial parallel converter
module ser_par_conv 
(
	input            clk, 
	input            enable, 
	input            dIn,
	output reg [7:0] dOut
);
	//
	always @ (posedge clk)
		if (enable == 1)
			dOut = {dIn, dOut[7:1]};
endmodule
