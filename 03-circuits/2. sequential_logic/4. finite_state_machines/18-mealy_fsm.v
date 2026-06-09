// Design a Mealy FSM with only 3 states that outputs "z" when the FSM detects a 101 in "x", with overlapping sequences as well

module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z );
    
    parameter S1 = 0, S2 = 1, S3 = 2;
    reg [1:0] state, next_state;
    
    //sequential logic
    
	always @(posedge clk, negedge aresetn) begin
       
        if (~aresetn) 
            state <= S1;
        else   
            state <= next_state; 
    end
    
    // state transition logic
    
    always @(*) begin
       
        case (state)
            
            S1: next_state = x? S2 : S1;
            S2: next_state = x? S2 : S3;
            S3: next_state = x? S2 : S1;
            
            default: next_state = S1;
        endcase        
    end
    
    // output logic
    
    assign z = ((state == S3) & x);

endmodule
