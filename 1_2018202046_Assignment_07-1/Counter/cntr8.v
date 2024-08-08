module cntr8(d_out, o_state, clk, reset_n, load, inc, d_in);		//8-bit Counter
	input clk, reset_n, inc, load;
	input [7:0] d_in;
	output [7:0] d_out;
	output [2:0] o_state;
	
	wire [2:0] next_state;
	wire [2:0] state;
	
	assign o_state = next_state;
	
	ns_logic U0_ns_logic(state, load, inc, next_state);			//Next state logic
	_register3_r U1_register3_r(next_state, clk, reset_n, state);		//register 3-bits
	os_logic U2_os_logic(d_out, next_state, d_in);				//Output logic
	
endmodule 
