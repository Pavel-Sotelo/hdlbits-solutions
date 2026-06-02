// Create an 8-bit edge detector that stores in the pedge output, the 0 to 1 or 1 to 0 edge of the last cycle


module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    
    reg [7:0] last_cycle;
    
    always @(posedge clk) begin
        
        last_cycle <= in;
        
        anyedge <= (~last_cycle & in) | (last_cycle & ~in); 
        
    end
    

endmodule