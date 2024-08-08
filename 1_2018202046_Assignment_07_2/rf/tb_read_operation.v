`timescale 1ns/100ps

module tb_read_operation;		//testbench of read operation
	reg[31:0] tb_reg[7:0];
	reg[2:0] tb_sel;
	wire [31:0] tb_d_out;
	
	read_operation U0_read_operation(tb_d_out, tb_sel, tb_reg[0], tb_reg[1], tb_reg[2], tb_reg[3], tb_reg[4], tb_reg[5], tb_reg[6], tb_reg[7]);
	
	initial begin
		
		/* flow is same with _8_to_1_MUX */
		tb_reg[0] = 32'h0000_0000;	tb_reg[1] = 32'h0000_0010; tb_reg[2] = 32'h0000_0200; tb_reg[3] = 32'h0000_3000;
		tb_reg[4] = 32'h0004_0000; tb_reg[5] = 32'h0050_0000; tb_reg[6] = 32'h0600_0000; tb_reg[7] = 32'h7000_0000;
		
		tb_sel = 3'b000;	#10;		//if(sel == 0) => d_out = reg0
		tb_sel = 3'b001;	#10;		//if(sel == 1) => d_out = reg1
		tb_sel = 3'b010;	#10;		//if(sel == 2) => d_out = reg2
		tb_sel = 3'b011;	#10;		//if(sel == 3) => d_out = reg3
		tb_sel = 3'b100;	#10;		//if(sel == 4) => d_out = reg4
		tb_sel = 3'b101;	#10;		//if(sel == 5) => d_out = reg5
		tb_sel = 3'b110;	#10;		//if(sel == 6) => d_out = reg6
		tb_sel = 3'b111;	#10;		//if(sel == 7) => d_out = reg7
	end
endmodule
	