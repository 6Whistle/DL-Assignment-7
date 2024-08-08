module ns_logic(next_state, load, inc, state);
	parameter IDLE_STATE = 3'b000;		//reset
	parameter LOAD_STATE = 3'b001;		//load
	parameter INC_STATE = 3'b010;			//increase
	parameter INC2_STATE = 3'b011;		//increase
	parameter DEC_STATE = 3'b100;			//decrease
	parameter DEC2_STATE = 3'b101;		//decrease
 
	input load, inc;
	input [2:0] state;
	output reg [2:0] next_state;
 
	always @ (load, inc, state)
	begin
		case(state)
			IDLE_STATE : begin		//state = IDLE
				if(load == 1) next_state = LOAD_STATE;		//IDLE -> LOAD
				else if(inc == 1) next_state = INC_STATE;	//IDLE -> INC
				else next_state = DEC_STATE;					//IDLE -> DEC
				end
			LOAD_STATE : begin		//state = LOAD
				if(load == 1) next_state = LOAD_STATE;		//LOAD
				else if(inc == 1) next_state = INC_STATE;	//LOAD -> INC
				else next_state = DEC_STATE;					//LOAD -> DEC
				end
			INC_STATE : begin			//state = INC
				if(load == 1) next_state = LOAD_STATE;		//INC -> LOAD
				else if(inc == 1) next_state = INC2_STATE;//INC -> INC2
				else next_state = DEC_STATE;					//INC -> DEC
				end
			INC2_STATE : begin		//state = INC2
				if(load == 1) next_state = LOAD_STATE;		//INC2 -> LOAD
				else if(inc == 1) next_state = INC_STATE;	//INC2 -> INC
				else next_state = DEC_STATE;					//INC2 -> DEC
				end
			DEC_STATE : begin			//state = DEC
				if(load == 1) next_state = LOAD_STATE;		//DEC -> LOAD
				else if(inc == 1) next_state = INC_STATE;	//DEC -> INC
				else next_state = DEC2_STATE;					//DEC -> DEC2
				end
			DEC2_STATE : begin		//state = DEC2
				if(load == 1) next_state = LOAD_STATE;		//DEC2 -> LOAD
				else if(inc == 1) next_state = INC_STATE;	//DEC2 -> INC
				else next_state = DEC_STATE;					//DEC2 -> DEC
				end
			default : next_state = 3'bx;			//error
		endcase
	end
endmodule
 