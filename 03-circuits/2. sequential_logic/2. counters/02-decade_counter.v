// Build a decade counter, that counts from 0 to 9. with a synchronous reset input

module top_module (
    input clk,
    input reset,        
    output [3:0] q);
    
    always @(posedge clk) begin
        
        if (reset)
        	q <= '0;            //Before the first clock edge, reset time sets the first number to the same as the reset when its high
        else if (q == 4'b1001)
            q <= '0;
        else
            q <= q + 4'b1;
           
    end

endmodule