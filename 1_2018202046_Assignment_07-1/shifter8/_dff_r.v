module _dff_r(q, clk, reset_n, d);		//Asyncronous D Flip-Flop
	input clk, reset_n, d;
	output q;
	reg q;
	
	always @ (posedge clk or negedge reset_n)	//active Async
	begin
		if(reset_n == 0)		q <= 1'b0;		//reset active low
		else						q <= d;			//D Flip-Flop
	end
endmodule
