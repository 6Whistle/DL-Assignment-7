module mx4(y, d0, d1, d2, d3, s);		//4-to-1 MUX
	input d0, d1, d2, d3;
	input [1:0]s;
	output y;
	
	mx2 U0_mx2(w0, d0, d1, s[0]);			//seperated by s[0]
	mx2 U1_mx2(w1, d2, d3, s[0]);
	
	mx2 U2_mx2(y, w0, w1, s[1]);			//seperated by s[1]
endmodule
