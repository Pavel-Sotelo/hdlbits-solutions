module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );

    
    parameter A = 0, B = 1, C = 2, D = 3, FOUND = 4, DECIDE = 5, DONE_4 = 6, DONE_COUNTING = 7;
    reg [2:0] state, next_state;
    
    reg [2:0] count_4;
    reg [3:0] delay;
    reg [63:0] count_delay;
    // sequential logic
    
    always @(posedge clk) begin
        
        if (reset) begin
        	state <= A;
        	count_4 <= '0;
            delay <= '0;
            count_delay <= '0;
        end else begin
            state <= next_state;
            
            if(state == FOUND) begin
                
                if (count_4 < 4'd3) begin
            		count_4 <= count_4 + 4'b1;
                    delay <= {delay[2:0], data};
            	end

            end else if (state == DONE_4) begin
            
            	count_delay <= count_delay + 4'd1;
                  
            end else begin
                    
                	count_4 <= '0;
                    count_delay <= '0;
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
            DONE_4: next_state = (count_delay == ((delay + 1) * 4'd1000))? DONE_COUNTING : DONE_4;
            DONE_COUNTING: next_state = ack? A : DONE_COUNTING;
        endcase
    end

    assign count = (state == DONE_4)? delay : '1;    
    assign counting = (state == DONE_4);
    assign done = (state == DONE_COUNTING);

endmodule
