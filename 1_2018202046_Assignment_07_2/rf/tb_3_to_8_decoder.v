`timescale 1ns/100ps

module tb_3_to_8_decoder;		//testbench of _3_to_8_decoder
	reg [2:0] tb_d;
	wire [7:0] tb_q;
	
	_3_to_8_decoder U0_3_to_8_decoder(tb_q, tb_d);
	
	initial begin
		#10;							//if(d == x) -> q = xxxx_xxxx
		tb_d = 3'b000;	#10;		//if(d == 0) => q = 0000_0001
		tb_d = 3'b001;	#10;		//if(d == 1) => q = 0000_0010
		tb_d = 3'b010;	#10;		//if(d == 2) => q = 0000_0100
		tb_d = 3'b011;	#10;		//if(d == 3) => q = 0000_1000
		tb_d = 3'b100;	#10;		//if(d == 4) => q = 0001_0000
		tb_d = 3'b101;	#10;		//if(d == 5) => q = 0010_0000
		tb_d = 3'b110;	#10;		//if(d == 6) => q = 0100_0000
		tb_d = 3'b111;	#10;		//if(d == 7) => q = 1000_0000
	end
endmodule
	