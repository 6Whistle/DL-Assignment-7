`timescale 1ns/100ps

module tb_cc_logic;			//testbench of cc_logic
	reg [7:0] tb_d_in;
	reg [7:0] tb_d_out;
	reg [1:0] tb_shamt;
	reg [2:0] tb_op;
	
	wire [7:0] tb_d_next;
	
	cc_logic U0_cc_logic(tb_d_next, tb_op, tb_shamt, tb_d_in, tb_d_out);
	
	initial begin
		tb_d_in = 8'b0000_0000; tb_d_out = 8'b1011_1100; tb_shamt = 2'b10; tb_op = 3'b000; #10;		//return 1011_1100(NOP)
		
		tb_op = 3'b001; #10;																									//return 0000_0000(LOAD)
		
		tb_op = 3'b010; #10;																									//return 1111_0000(LSL)
		
		tb_op = 3'b011; #10;																									//return 0010_1111(LSR)
		
		tb_op = 3'b100; #10;																									//return 1110_1111(ASR)
	end
endmodule
