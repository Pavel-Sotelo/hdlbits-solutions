// Create a 5-bit LFSR as shown on the diagram of "Lfsr5" on HDLBits.

module top_module(
    input clk,
    input reset,          // Active-high synchronous reset 
    output [4:0] q
);
    always @(posedge clk) begin
        
        if (reset)
            q <= 5'd1;
        else
            q <= { 0 ^ q[0], q[4], q[3] ^ q[0], q[2], q[1]};
        
    end

endmodule