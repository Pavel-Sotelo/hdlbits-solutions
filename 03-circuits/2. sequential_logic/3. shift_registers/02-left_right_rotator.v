// Create a 100-bit left/right rotator with a load input, ena[1] should enable left rotator, ena [0] enables right rotator

module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q);
    
    always @(posedge clk) begin
        
        if (load)
            q <= data;
        else if (ena[1] & ~ena[0])
            q <= {q[98:0], q[99]};
        else if (ena[0] & ~ena[1])
            q <= {q[0], q[99:1]};
        
    end

endmodule
