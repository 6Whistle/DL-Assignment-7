module LSL8(d_out, d_in, shamt);			//LSL 8-bits
	input [1:0] shamt;
	input [7:0] d_in;
	output [7:0] d_out;
	
	mx4 U0_mx4(d_out[7], d_in[7], d_in[6], d_in[5], d_in[4], shamt);		//d[7] result
	mx4 U1_mx4(d_out[6], d_in[6], d_in[5], d_in[4], d_in[3], shamt);		//d[6] result
	mx4 U2_mx4(d_out[5], d_in[5], d_in[4], d_in[3], d_in[2], shamt);		//d[5] result
	mx4 U3_mx4(d_out[4], d_in[4], d_in[3], d_in[2], d_in[1], shamt);		//d[4] result
	
	mx4 U4_mx4(d_out[3], d_in[3], d_in[2], d_in[1], d_in[0], shamt);		//d[3] result
	mx4 U5_mx4(d_out[2], d_in[2], d_in[1], d_in[0], 1'b0, shamt);			//d[2] result
	mx4 U6_mx4(d_out[1], d_in[1], d_in[0], 1'b0, 1'b0, shamt);				//d[1] result
	mx4 U7_mx4(d_out[0], d_in[0], 1'b0, 1'b0, 1'b0, shamt);					//d[0] result
	
endmodule
