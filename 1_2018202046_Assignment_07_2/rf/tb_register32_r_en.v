`timescale 1ns/100ps

module tb_register32_r_en;		//testbench of register32_r_en
	
	reg tb_clk, tb_reset_n, tb_en;
	reg [31:0] tb_d;
	wire [31:0] tb_q;
	
	register32_r_en U0_register32_r_en(tb_q, tb_clk, tb_reset_n, tb_en, tb_d);
	
	
	always begin tb_clk = 0; #5; tb_clk = 1; #5;				//clk = 10
	end
	
	initial begin
		tb_reset_n = 0; tb_en = 0; tb_d = 32'h0000_0000;	#10;		//reset
		tb_reset_n = 0; tb_en = 1; tb_d = 32'h0000_0000;	#10;		//if reset == 1, en can't affect q

		tb_reset_n = 1; tb_en = 0; tb_d = 32'h1234_5678;	#10;		//if en == 0, d couldn't be saved
		tb_reset_n = 1; tb_en = 1; tb_d = 32'h1234_5678;	#10;		//store 1234_5678
		tb_reset_n = 1; tb_en = 0; tb_d = 32'h9abc_def0;	#10;		//output is 1234_5678
		tb_reset_n = 1; tb_en = 1; tb_d = 32'h9abc_def0;	#10;		//store 1234_5678
		$stop;
		
	end
endmodule
	