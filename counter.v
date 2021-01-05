// controller
module counter 
(
	input        clk, 
	input        enable,
	output       count72,
	output       count8
);
	//
	wire         each8;
	reg    [8:0] count_reg;
	//
	always @ (posedge clk)
		if (enable == 0)
          count_reg <= 0;
		else begin
          count_reg <= count_reg + 1;
		end
	//
	assign each8   = ((count_reg % 8) == 7);
	assign count72 = (count_reg == 71);
	assign count8  = each8 & ~count72;
endmodule
