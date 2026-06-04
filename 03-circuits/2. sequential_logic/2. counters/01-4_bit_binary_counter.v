// Create a 4-bit binary counter that counts from 0 to 15, with an active-high synchronous reset

module top_module (
    input clk,
    input reset,     
    output reg [3:0] q);
    
    always @(posedge clk) begin
        
        if (reset)
            q <= '0;
        else
            q <= q + 4'b1;
        
    end
    

endmodule