//Mealy FSM of a two complementer input

module top_module (
    input clk,
    input areset,
    input x,
    output z
);
    // One-hot encoding
    
    reg [1:0] state, next_state;
    parameter A = 2'b01, B = 2'b10;
   
    always @(posedge clk, posedge areset) begin
        
        if (areset)
        	state <= A;
        else
            state <= next_state;
    end
    
    always @(*) begin
        
        case(state)
        	
            A: next_state = x? B : A;
            B: next_state = B;
                
        endcase       
    end
    
    assign z = (state == A && x) | (state == B && (~x));
    

endmodule
