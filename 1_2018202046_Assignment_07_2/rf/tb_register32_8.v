`timescale 1ns/100ps

module tb_register32_8;		//testbench of register32_8
	
	reg tb_clk, tb_reset_n;
	reg [7:0] tb_en;
	reg [31:0] tb_d_in;
	wire [31:0] tb_d_out0, tb_d_out1, tb_d_out2, tb_d_out3, tb_d_out4, tb_d_out5, tb_d_out6, tb_d_out7;
	
	register32_8 U0_register32_8(tb_d_out0, tb_d_out1, tb_d_out2, tb_d_out3, tb_d_out4, tb_d_out5, tb_d_out6, tb_d_out7, tb_clk, tb_reset_n, tb_en, tb_d_in);
	
	
	always begin tb_clk = 0; #5; tb_clk = 1; #5;				//clk = 10
	end
	
	initial begin
		tb_reset_n = 0; tb_en = 8'b0000_0000; tb_d_in = 32'h0000_0000; #10;
		
		tb_reset_n = 1;  tb_d_in = 32'h0123_4567;		//verification all of 32-bits registers can save data 
		tb_en = 8'b0000_0000; #10;
		tb_en = 8'b1111_1111; #10;

		$stop;
		
	end
endmodule
	