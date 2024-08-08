`timescale 1ns/100ps

module tb_register8_r;		//testbench of _register8_r
	
	reg tb_clk, tb_reset_n;
	reg [7:0] tb_d;
	wire [7:0] tb_q;
	
	_register8_r U0_register8_r(tb_q, tb_clk, tb_reset_n, tb_d);
	
	
	always begin tb_clk = 0; #5; tb_clk = 1; #5;				//clk = 10
	end
	
	initial begin
		tb_reset_n = 0; tb_d = 8'b0000_0000;	#10;		//reset
		tb_reset_n = 0; tb_d = 8'b1001_1001;	#10;		//if reset == 0, d affect q
		
		tb_reset_n = 1; tb_d = 8'b1001_1001;	#10;		//store 1001_1001
		tb_reset_n = 1; tb_d = 8'b1111_0000;	#10;		//store 1111_0000
		
		tb_reset_n = 0; tb_d = 8'b1111_0000;	#10;		//clear
		$stop;
		
	end
endmodule
	