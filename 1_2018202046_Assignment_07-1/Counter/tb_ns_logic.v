`timescale 1ns/100ps

module tb_ns_logic;		//testbench of ns_logic
	reg [2:0] tb_state;
	reg tb_inc, tb_load;
	wire [2:0] tb_next_state;
	
	ns_logic U0_ns_logic(tb_next_state, tb_load, tb_inc, tb_state);
	
	initial begin
		tb_state = 3'b000;		//state = IDLE
		tb_load = 1; tb_inc = 1; #10;		//next state = LOAD;
		tb_load = 1; tb_inc = 0; #10;		//next state = LOAD;
		tb_load = 0; tb_inc = 1; #10;		//next state = INC;
		tb_load = 0; tb_inc = 0; #10;		//next state = DEC;
		
		tb_state = 3'b001;		//state = LOAD
		tb_load = 1; tb_inc = 1; #10;		//next state = LOAD;
		tb_load = 1; tb_inc = 0; #10;		//next state = LOAD;
		tb_load = 0; tb_inc = 1; #10;		//next state = INC;
		tb_load = 0; tb_inc = 0; #10;		//next state = DEC;
		
		tb_state = 3'b010;		//state = INC
		tb_load = 1; tb_inc = 1; #10;		//next state = LOAD;
		tb_load = 1; tb_inc = 0; #10;		//next state = LOAD;
		tb_load = 0; tb_inc = 1; #10;		//next state = INC2;
		tb_load = 0; tb_inc = 0; #10;		//next state = DEC;
		
		tb_state = 3'b011;		//state = INC2
		tb_load = 1; tb_inc = 1; #10;		//next state = LOAD;
		tb_load = 1; tb_inc = 0; #10;		//next state = LOAD;
		tb_load = 0; tb_inc = 1; #10;		//next state = INC;
		tb_load = 0; tb_inc = 0; #10;		//next state = DEC;
		
		tb_state = 3'b100;		//state = DEC
		tb_load = 1; tb_inc = 1; #10;		//next state = LOAD;
		tb_load = 1; tb_inc = 0; #10;		//next state = LOAD;
		tb_load = 0; tb_inc = 1; #10;		//next state = INC;
		tb_load = 0; tb_inc = 0; #10;		//next state = DEC2;
		
		tb_state = 3'b101;		//state = DEC2
		tb_load = 1; tb_inc = 1; #10;		//next state = LOAD;
		tb_load = 1; tb_inc = 0; #10;		//next state = LOAD;
		tb_load = 0; tb_inc = 1; #10;		//next state = INC;
		tb_load = 0; tb_inc = 0; #10;		//next state = DEC;
	end
endmodule
