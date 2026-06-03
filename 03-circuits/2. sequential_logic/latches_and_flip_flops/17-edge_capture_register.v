// Create an edge capture register that captures the 1 to 0 change on the input signal and stores it as a 1 on the output, until a reset sets the output again to 0

module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);
    reg [31:0] last_cycle;
    
    always @(posedge clk) begin
        
        last_cycle <= in;

        if (reset)
            out <= '0;
        else
            out <= out | (last_cycle & ~in);
        
    end

endmodule
