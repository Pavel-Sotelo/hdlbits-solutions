//Moore FSM of convertion of an input, to a two complement output

module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
	parameter LOOK = 0, FOUND = 1, ONE = 2, ZERO = 3;
    reg [1:0] state, next_state;
    
    always @(posedge clk, posedge areset) begin
        
        if(areset)
            state <= LOOK;
    	else 
    		state <= next_state;
    end
    
    
    always @(*) begin
    
        case(state)
            
            LOOK: next_state = x? FOUND: LOOK;
           FOUND: next_state = x?  ONE : ZERO;
            ONE : next_state = x?  ONE : ZERO;
           ZERO : next_state = x?  ONE : ZERO;
            
        endcase
    end
    
    assign z = (state == FOUND) || (state == ZERO);
    
    

endmodule