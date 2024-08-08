`timescale 1ns/100ps

module tb_Register_file;			//testbench of Register_file
	reg tb_clk, tb_reset_n, tb_we;
	reg [2:0] tb_wAddr, tb_rAddr;
	reg [31:0] tb_wData;
	wire [31:0] tb_rData;
	
	Register_file U0_Register_file(tb_rData, tb_clk, tb_reset_n, tb_wAddr, tb_wData, tb_we, tb_rAddr);
	
	always begin	tb_clk = 0; #5; tb_clk = 1; #5; end				//clk = 10
	
	initial begin
		tb_reset_n = 0; tb_we = 0; tb_wAddr = 3'b000; tb_rAddr = 3'b000; tb_wData = 32'h0000_0000; #10;							//reset
		tb_reset_n = 1;
		
		/* write verification */
		tb_we = 0; tb_wAddr = 3'b000; tb_rAddr = 3'b000; tb_wData = 32'h0123_4567; #10;			//input at 1st Reg32
		tb_we = 1; # 10;
		tb_we = 0; tb_wAddr = 3'b001; tb_rAddr = 3'b001; tb_wData = 32'h1234_5678; #10;			//input at 2nd Reg32
		tb_we = 1; # 10;
		tb_we = 0; tb_wAddr = 3'b010; tb_rAddr = 3'b010; tb_wData = 32'h2345_6789; #10;			//input at 3rd Reg32
		tb_we = 1; # 10;
		tb_we = 0; tb_wAddr = 3'b011; tb_rAddr = 3'b011; tb_wData = 32'h3456_789a; #10;			//input at 4th Reg32
		tb_we = 1; # 10;
		tb_we = 0; tb_wAddr = 3'b100; tb_rAddr = 3'b100; tb_wData = 32'h4567_89ab; #10;			//input at 5th Reg32
		tb_we = 1; # 10;
		tb_we = 0; tb_wAddr = 3'b101; tb_rAddr = 3'b101; tb_wData = 32'h5678_9abc; #10;			//input at 6th Reg32
		tb_we = 1; # 10;
		tb_we = 0; tb_wAddr = 3'b110; tb_rAddr = 3'b110; tb_wData = 32'h6789_abcd; #10;			//input at 7th Reg32
		tb_we = 1; # 10;
		tb_we = 0; tb_wAddr = 3'b111; tb_rAddr = 3'b111; tb_wData = 32'h789a_bcde; #10;			//input at 8th Reg32
		tb_we = 1; # 10;
		
		/* read verification */
		tb_we = 0; 
		tb_rAddr = 3'b000; #10;			//read 1st Reg32
		tb_rAddr = 3'b001; #10;			//read 2nd Reg32
		tb_rAddr = 3'b010; #10;			//read 3rd Reg32
		tb_rAddr = 3'b011; #10;			//read 4th Reg32
		tb_rAddr = 3'b100; #10;			//read 5th Reg32
		tb_rAddr = 3'b101; #10;			//read 6th Reg32
		tb_rAddr = 3'b110; #10;			//read 7th Reg32
		tb_rAddr = 3'b111; #10;			//read 8th Reg32
		
		
		$stop;
	end
endmodule
	