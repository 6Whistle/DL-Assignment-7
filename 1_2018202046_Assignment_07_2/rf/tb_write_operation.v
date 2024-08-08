`timescale 1ns/100ps

module tb_write_operation;			//testbench of write_operation
	reg tb_we;
	reg [2:0] tb_Addr;
	wire [7:0] tb_to_reg;
	
	write_operation U0_write_operation(tb_to_reg, tb_Addr, tb_we);
	
	initial begin
		#10;							//if(d == x) -> q = xxxx_xxxx
		
/* When tb_we is 0, output is always 0 */
		tb_we = 0; tb_Addr = 3'b000;	#10;
		tb_Addr = 3'b001;	#10;
		tb_Addr = 3'b010;	#10;
		tb_Addr = 3'b011;	#10;
		tb_Addr = 3'b100;	#10;
		tb_Addr = 3'b101;	#10;
		tb_Addr = 3'b110;	#10;
		tb_Addr = 3'b111;	#10;
		
/* When tb_we is 1, output is decoded num(tb_Addr) */
		tb_we = 1; tb_Addr = 3'b000;	#10;		//if(d == 0) => q = 0000_0001
		tb_Addr = 3'b001;	#10;						//if(d == 1) => q = 0000_0010
		tb_Addr = 3'b010;	#10;						//if(d == 2) => q = 0000_0100
		tb_Addr = 3'b011;	#10;						//if(d == 3) => q = 0000_1000
		tb_Addr = 3'b100;	#10;						//if(d == 4) => q = 0001_0000
		tb_Addr = 3'b101;	#10;						//if(d == 5) => q = 0010_0000
		tb_Addr = 3'b110;	#10;						//if(d == 6) => q = 0100_0000
		tb_Addr = 3'b111;	#10;						//if(d == 7) => q = 1000_0000
	end
endmodule
	