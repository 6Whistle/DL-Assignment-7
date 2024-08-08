module cla8(s, co, a, b, ci);		//8-bits CLA
	input [7:0] a, b;
	input ci;
	output [7:0] s;
	output co;
	wire c1;
	
	cla4 U0_cla4(s[3:0], c1, a[3:0], b[3:0], ci);		//1~4 bits CLA
	cla4 U1_cla4(s[7:4], co, a[7:4], b[7:4], c1);		//5_8 bits CLA
	
endmodule 
