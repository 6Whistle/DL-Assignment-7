module shifter8(d_out, clk, reset_n, op, shamt, d_in);		//8-bits shifter
	input clk, reset_n;
	input [2:0] op;
	input [1:0] shamt;
	input [7:0] d_in;
	output [7:0] d_out;
	
	wire [7:0] d_next, d_cur;
	
	cc_logic U0_cc_logic(d_next, op, shamt, d_in, d_cur);		//Combinational logic
	_register8_r U1_register8_r(d_cur, clk, reset_n, d_next);	//sequential logic
	assign d_out = d_cur;
	
endmodule
