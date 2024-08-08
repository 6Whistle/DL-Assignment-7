`timescale 1ns/100ps

module tb_LSR8;			//testbench of LSR8
	reg [7:0] tb_d_in;
	reg [1:0] tb_shamt;
	wire [7:0] tb_d_out;
	
	LSR8 U0_LSR8(tb_d_out, tb_d_in, tb_shamt);
	
	initial begin
		
		tb_d_in = 8'b0110_0001;
		
		tb_shamt = 2'b00; #10;					//shift 0 bit
		tb_shamt = 2'b01; #10;					//shift 1 bit
		tb_shamt = 2'b10; #10;					//shift 2 bit
		tb_shamt = 2'b11; #10;					//shift 3 bit
	end
endmodule
