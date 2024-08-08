module cc_logic(d_next, op, shamt, d_in, d_out);	//combinational curcuit
	input [2:0] op;
	input [1:0] shamt;
	input [7:0] d_in;
	input [7:0] d_out;
	output reg [7:0] d_next;
	
	wire [7:0] d_lsl;
	wire [7:0] d_lsr;
	wire [7:0] d_asr;
	
	parameter NOP = 3'b000;					//state
	parameter LOAD = 3'b001;
	parameter LSL = 3'b010;
	parameter LSR = 3'b011;
	parameter ASR = 3'b100;
	
	always@ (op, shamt, d_in, d_out, d_lsl, d_lsr, d_asr)		//active when input is changed
	begin
		case(op)
			NOP : d_next = d_out;			//hold d_out
			LOAD : d_next = d_in;			//save d_in
			LSL : d_next = d_lsl;			//LSL
			LSR : d_next = d_lsr;			//LSR
			ASR : d_next = d_asr;			//ASR
			default : d_next = 3'bxxx;		//error
		endcase
	end
	
	LSL8 U0_LSL8(d_lsl, d_out, shamt);	//LSL module
	LSR8 U1_LSR8(d_lsr, d_out, shamt);	//LSR module
	ASR8 U2_aSR8(d_asr, d_out, shamt);	//ASR module

endmodule

	