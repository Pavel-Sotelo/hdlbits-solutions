// PS/2 mouse protocol FSM. 
// We have to identify every package of 3 bytes, by analizing if the 3rd bit of the first byte is a 1. If yes, we do a package of that byte and the another 2 upcoming bytes.

module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done);

    parameter BYTE_1 = 0, BYTE_2 = 1, BYTE_3 = 2, DONE = 3;
    reg [1:0] state, next_state;
    
    // State flip-flops (sequential)
    
    always @(posedge clk) begin
        
        if(reset)
        	state  <= BYTE_1;    
        else
            state <= next_state;
    end
    
    // State transition logic (combinational)

    always @(*) begin
       
        case(state)
            
            BYTE_1: next_state = in[3] ? BYTE_2 : BYTE_1;
        	BYTE_2: next_state = BYTE_3;
            BYTE_3: next_state = DONE;
            DONE  : next_state = in[3] ? BYTE_2 : BYTE_1;
        endcase
    end
    
    // Output logic
            
    assign done = (state == DONE);         
            

endmodule