// overall receiver definition
module uar (
	input        clk, 
	input        gl_reset, 
	input        dIn,
	output [7:0] dOut,
	output       dReady, 
	output       dError
);
	//
	wire         running, finish, count8, start;
	//
	start_detect s_d(
		.clk(clk), 
		.reset(running), 
		.gl_reset(gl_reset), 
		.dIn(dIn),	
		.valid(start)
	);
	counter      cov (
		.clk(clk), 
		.enable(running),	
		.count72(finish), 
		.count8(count8)
	);
	ser_par_conv s_p (
		.clk(clk), 
		.enable(count8), 
		.dIn(dIn),
		.dOut(dOut)
	);
	flags        fla (
		.clk(clk), 
		.set(finish), 
		.reset(start), 
		.dIn(dIn),	
		.dReady(dReady), 
		.dError(dError)
	);
	control      con (
		.clk(clk), 
		.reset(finish), 
		.gl_reset(gl_reset), 
		.set(start),
		.running(running) 
	);
endmodule
