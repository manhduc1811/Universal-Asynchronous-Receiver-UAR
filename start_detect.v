// Start detection
module start_detect 
(
	input        clk, 
	input        reset, 
	input        gl_reset, 
	input        dIn,
	output       valid
);
	//
	reg    [3:0] shift_reg;
	//
	always @ (posedge clk) begin
		if (reset | gl_reset)
          shift_reg = 0;
		else
          shift_reg = { shift_reg[2:0], dIn };
		end
	//	
	assign valid = (shift_reg [0] == 0) &
    	           (shift_reg [2] == 0) & 
				   (shift_reg [3] == 1);
endmodule
