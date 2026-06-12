// Build a counter with a 1000 period. the synchronous reset should put the counter back to 0.

module top_module (
    input clk,
    input reset,
    output [9:0] q);
    
    always @(posedge clk) begin
        
        if (reset) 
        	q <= '0;
        else if (q < 10'd1000) begin
            q <= q + 4'd1;
            
            if (q == 10'd999)
            	q <= '0;            
        end
    end
    
endmodule