module _register3_r(q, clk, reset_n, d);	//3-bits register
	input clk, reset_n;
	input [2:0] d;
	output [2:0] q;
	
	_dff_r U0_dff_r(q[0], clk, reset_n, d[0]);		//first bit D FF
	_dff_r U1_dff_r(q[1], clk, reset_n, d[1]);		//second bit D FF
	_dff_r U2_dff_r(q[2], clk, reset_n, d[2]);		//Third bit D FF
	
endmodule
