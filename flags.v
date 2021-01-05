// flags for ready and data error
module flags 
(
	input      clk, 
	input      set,  
	input      reset, 
	input      dIn,
	output reg dReady, 
	output reg dError
);
	//
	always @(posedge clk)
		if (reset == 1) begin
          dReady = 0;
          dError = 0;
          end
		else if (set == 1) begin
          dReady <= dIn;
          dError <= ~dIn;
        end
	//
	initial $monitor("dReady %b %b", dReady, dError, $time);
endmodule
