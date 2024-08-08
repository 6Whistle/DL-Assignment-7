`timescale 1ns/100ps

module tb_cntr8;		//testbench of counter
	reg [7:0] tb_d_in;
	reg tb_clk, tb_reset_n, tb_load, tb_inc;
	wire [7:0] tb_d_out;
	wire [2:0] tb_o_state;
	
	cntr8 U0_cntr8(tb_d_out, tb_o_state, tb_clk, tb_reset_n, tb_load, tb_inc, tb_d_in);
	
	always begin tb_clk = 0; #5; tb_clk = 1; #5; end
	
	initial begin
		tb_reset_n = 0; tb_d_in = 8'b0011_1100; tb_load = 0; tb_inc = 0; #10;		//state = 000, out = 0000_0000
		
		tb_reset_n = 1; tb_d_in = 8'b0011_1100; tb_load = 0; tb_inc = 1; #10;		//state = 010, out = 0000_0001
		tb_load = 0; #10;																			//state = 011, out = 0000_0010
		
		tb_reset_n = 1; tb_d_in = 8'b0011_1100; tb_load = 1; tb_inc = 1; #10;		//state = 001, out = 0011_1100
		
		tb_reset_n = 1; tb_d_in = 8'b0011_1100; tb_load = 0; tb_inc = 0; #10;		//state = 100, out = 0011_1011
		#10;																							//state = 101, out = 0011_1010
		
		tb_reset_n = 0;	#10;																		//state = 000; out = 0000_0000 
		$stop;
	end
endmodule
