`timescale 1ns/100ps

module tb_os_logic;		//testbench of os_logic
	reg [2:0] tb_state;
	reg [7:0] tb_d_in;
	wire [7:0] tb_d_out;
	
	os_logic U0_os_logic(tb_d_out, tb_state, tb_d_in);
	
	initial begin
	tb_state = 3'b000; tb_d_in = 8'b0000_0000; #10;			//d_out = 0;
	tb_state = 3'b000; tb_d_in = 8'b0011_1100; #10;			
	
	tb_state = 3'b001; tb_d_in = 8'b0011_1100; #10;			//d_out = 0011_1100;

	/* increase */
	tb_state = 3'b010; #10;
	tb_state = 3'b011; #10;
	
	/* decrease */
	tb_state = 3'b100; #10;
	tb_state = 3'b101; #10;
	
	tb_state = 3'b000; #10;			//clear
	end
endmodule

	