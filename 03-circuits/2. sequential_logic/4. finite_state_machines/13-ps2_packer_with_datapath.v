// PS/2 mouse protocol FSM.
// But with a datapath of unpacking all 24 bits of a identified 3 byte package into the output of "out_bytes" 

module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); 

    parameter BYTE_1 = 0, BYTE_2 = 1, BYTE_3 = 2, DONE = 3;
    reg [1:0] state, next_state;
    
    reg [7:0] d1, d2, d3;
    
    // State flip-flops (sequential)
    
    always @(posedge clk) begin
        
        if(reset)
        	state  <= BYTE_1;    
        else
            state <= next_state;
        	
        if (state == BYTE_1 | state == DONE)
            d1 <= in;
        else if(state == BYTE_2)
            d2 <= in;
        else if(state == BYTE_3)
            d3 <= in;        
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
    assign out_bytes = (state == DONE)? {d1, d2, d3}: '0; 
            

endmodule