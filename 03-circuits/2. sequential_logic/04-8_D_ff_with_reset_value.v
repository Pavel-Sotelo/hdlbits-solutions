// Create 8 D flip-flops that are triggered with the negative edge of clock that have a high synchronous reset to 0x34
// 0x34 is the ASCII representation of 52 in decimal

module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
    
    always @(negedge clk) begin
        
        if (reset) q <= 8'd52;
        else q <= d;
    
    end

endmodule