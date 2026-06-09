module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    parameter S1 = 0, S2 = 1, S3 = 2, S4 = 3, S5 = 4, S6 = 5, S7 = 6;
    reg [2:0] state, next_state;
    
    // sequential logic
    
    always @(posedge clk) begin    
        if (reset)
        	state <= S1;
        else	
    		state <= next_state;
    end
    
    // state transition logic
    
    always @(*) begin
        
        case (state)
        	S1: next_state = in? S2: S1;    
            S2: next_state = in? S3: S1; 
            S3: next_state = in? S4: S1; 
            S4: next_state = in? S5: S1; 
            S5: next_state = in? S6: S1; 
            S6: next_state = in? S7: S1; 
            S7: next_state = in? S7: S1; 
        endcase
    end
    
    // output logic
    
    assign disc = ((state == S6) && ~in);
    assign flag = ((state == S7) && ~in);
    assign err  = (next_state == S7);

endmodule