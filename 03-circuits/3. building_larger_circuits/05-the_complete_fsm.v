// Longer instructions on "FSM: The complete FSM" on HDLBits

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    
    parameter A = 0, B = 1, C = 2, D = 3, FOUND = 4, DECIDE = 5, DONE_4 = 6, DONE_COUNTING = 7;
    reg [2:0] state, next_state;
    
    reg [2:0] count_4;
    
    // sequential logic
    
    always @(posedge clk) begin
        
        if (reset) begin
        	state <= A;
        	count_4 <= '0;
        end else begin
            state <= next_state;
            
            if(state == FOUND) begin
                
                if (count_4 < 4'd3) begin
            		count_4 <= count_4 + 4'b1;
            	end
                
            end else begin
                count_4 <= '0;               
            end
        end
    end
    
    always @(*) begin
        
        case(state)
        	
            DECIDE: next_state = data? C : D;
            A: next_state = data? B : A;
            B: next_state = data? C : A;
            C: next_state = data? DECIDE : D;
            D: next_state = data? FOUND : A;
            FOUND: next_state = (count_4 < 4'd3)? FOUND : DONE_4;  
            DONE_4: next_state = done_counting? DONE_COUNTING : DONE_4;
            DONE_COUNTING: next_state = ack? A : DONE_COUNTING;
        endcase
    end
    
    assign shift_ena = (state == FOUND);
    assign counting = (state == DONE_4);
    assign done = (state == DONE_COUNTING);

endmodule
