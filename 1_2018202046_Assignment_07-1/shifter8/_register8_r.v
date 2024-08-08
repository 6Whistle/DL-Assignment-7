module _register8_r(q, clk, reset_n, d);	//8-bits register
	input clk, reset_n;
	input [7:0] d;
	output [7:0] q;
	
	_dff_r U0_dff_r(q[0], clk, reset_n, d[0]);		//1st bit D FF
	_dff_r U1_dff_r(q[1], clk, reset_n, d[1]);		//2nd bit D FF
	_dff_r U2_dff_r(q[2], clk, reset_n, d[2]);		//3rd bit D FF
	_dff_r U3_dff_r(q[3], clk, reset_n, d[3]);		//4th bit D FF
	_dff_r U4_dff_r(q[4], clk, reset_n, d[4]);		//5th bit D FF
	_dff_r U5_dff_r(q[5], clk, reset_n, d[5]);		//6th bit D FF
	_dff_r U6_dff_r(q[6], clk, reset_n, d[6]);		//7th bit D FF
	_dff_r U7_dff_r(q[7], clk, reset_n, d[7]);		//8th bit D FF
	
	
endmodule
