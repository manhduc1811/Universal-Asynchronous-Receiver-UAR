// generating the run signals
module control 
(
	input      clk, 
	input      reset, 
	input      gl_reset, 
	input      set,
	output reg running
);
	//
	always @ (posedge clk)
		if ((reset == 1) | (gl_reset == 1))
			running  =  0;
		else if (set == 1)
			running = 1;
endmodule
