// Create a decade counter that goes from 0 to 9 with a reset input that resets to 0.
// And with a slowena input that increments the counter manually. So it shouldn't increment by each clock cycle.

module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    always @(posedge clk) begin
        
        if (reset)
            q <= '0;
        
        else if (slowena) begin
            
            if (q == 4'd9)
            	q <= '0;
            else
                q <= q + 1;
        end 

    end
    
endmodule
