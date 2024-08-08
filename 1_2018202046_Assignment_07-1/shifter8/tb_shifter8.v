`timescale 1ns/100ps

module tb_shifter8;			//testbench of shifter
	reg [7:0] tb_d_in;
	reg [1:0] tb_shamt;
	reg [2:0] tb_op;
	reg tb_clk, tb_reset_n;
	
	wire [7:0] tb_d_out;
	
	 shifter8 U0_shifter8(tb_d_out, tb_clk, tb_reset_n, tb_op, tb_shamt, tb_d_in);
	
	always begin tb_clk = 0; #5; tb_clk = 1; #5; end
	
	initial begin
		tb_reset_n = 0; tb_op = 3'b000; tb_shamt = 2'b00; #10							//clear
		
		tb_reset_n = 1; tb_op = 3'b001; tb_d_in = 8'b1001_1001; tb_shamt = 2'b01; #10;		//load

		tb_reset_n = 1; tb_op = 3'b000; tb_d_in = 8'b1001_1001; tb_shamt = 2'b01; #10;		//hold
		
		tb_reset_n = 1; tb_op = 3'b011; tb_d_in = 8'b1001_1001; tb_shamt = 2'b01; #10;		//lsr 1 bit from d_out twice
		#10;
		
		tb_reset_n = 1; tb_op = 3'b010; tb_d_in = 8'b1001_1001; tb_shamt = 2'b01; #10;		//lsl 1 bit from d_out twice
		#10;
		
		tb_reset_n = 1; tb_op = 3'b100; tb_d_in = 8'b1001_1001; tb_shamt = 2'b01; #10;		//asr 1 bit from d_out twice
		#10;																											//asr 1bit from d_out twice
		
		tb_op = 3'b001; #10;																						//load
		
		tb_reset_n = 0; #10;																						//clear
		
		$stop;
		
	end
endmodule
