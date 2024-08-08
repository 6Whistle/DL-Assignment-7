module os_logic(d_out, state, d_in);			//output logic
 	parameter IDLE_STATE = 3'b000;		//reset
	parameter LOAD_STATE = 3'b001;		//load
	parameter INC_STATE = 3'b010;			//increase
	parameter INC2_STATE = 3'b011;		//increase
	parameter DEC_STATE = 3'b100;			//decrease
	parameter DEC2_STATE = 3'b101;		//decrease
	
	input [2:0] state;
	input [7:0] d_in;
	output reg [7:0] d_out;
	
	wire [7:0] d_inc;
	wire [7:0] d_dec;
	
	always@(state)
	begin
		case(state)
			IDLE_STATE : d_out = 8'b0000_0000;		//d_put = 0
			LOAD_STATE : d_out = d_in;					//d_put = d_in
			INC_STATE : d_out = d_inc;					//increase
			INC2_STATE : d_out = d_inc;				//increase
			DEC_STATE : d_out = d_dec;					//decrease
			DEC2_STATE : d_out = d_dec;				//decrease
			default : d_out = 8'bxxxx_xxxx;			//error
		endcase
	end
	
	cla8 U0_cla8(d_inc, w0, d_out, 8'b0000_0001, 1'b0);				//increase
	cla8 U1_cla8(d_dec, w1, d_out, 8'b1111_1111, 1'b0);				//decrease

endmodule
