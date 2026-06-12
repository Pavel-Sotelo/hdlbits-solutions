// Create an FSM that recognizes the sequence 1101 eith the data input
// When it finds it, the output should be 1 until reset.

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    parameter A = 0, B = 1, C = 2, D = 3, FOUND = 4, DECIDE = 5;
    reg [2:0] state, next_state;
    
    // sequential logic
    
    always @(posedge clk) begin
        
        if (reset)
        	state <= A;
        else
            state <= next_state;
    end
    
    always @(*) begin
        
        case(state)
        	
            DECIDE: next_state = data? C : D;
            A: next_state = data? B : A;
            B: next_state = data? C : A;
            C: next_state = data? DECIDE : D;
            D: next_state = data? FOUND : A;
            FOUND: next_state = FOUND;
            
        endcase
    end
    
    assign start_shifting = (state == FOUND);
    

endmodule
