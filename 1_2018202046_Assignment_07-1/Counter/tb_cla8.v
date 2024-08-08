`timescale 1ns/100ps

module tb_cla8;			//testbench of CLA8
	reg [7:0] tb_a, tb_b;
	reg tb_ci;
	wire [7:0] tb_s;
	wire tb_co;
	
	cla8 U0_cla8(tb_s, tb_co, tb_a, tb_b, tb_ci);
	
	initial begin
		tb_a = 8'b0000_0000; tb_b = 8'b0000_0000; tb_ci = 0; #10;		//start
		tb_a = 8'b0000_0001; tb_b = 8'b0000_0001; tb_ci = 1; #10;		//s = 0000_0011, co = 0
		tb_a = 8'b0001_1000; tb_b = 8'b0001_1000; tb_ci = 0; #10;		//s = 0011_0000, co = 0
		tb_a = 8'b1000_0000; tb_b = 8'b1000_0000; tb_ci = 0; #10;		//s = 0000_0000, co = 1
	
	
	end
endmodule

	