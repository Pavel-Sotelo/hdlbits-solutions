// Moore FSM with two states, one input, one output. 
// Synchronous reset. reset state is B.
// The state's diagram is shown on "Fsm1s" on HDLBits

module top_module (
    input wire clk, reset, in,
	output wire out
);
    parameter A = 0, B = 1;
    reg state, next_state;
    
    // state register
    
    always @(posedge clk) begin
        
        if (reset)
            state <= B;
        else
            state <= next_state;       
    end
    
    // state transitions logic
    
    always @(*) begin       
        
        case(state) 
        	A: next_state = in ? A : B;
       		B: next_state = in ? B : A;
        endcase
    end
    
    //output logic
    
    assign out = (state == B);
    
endmodule