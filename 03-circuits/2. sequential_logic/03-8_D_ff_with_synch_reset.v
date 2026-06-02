// Create 8 D flip-flops that have a high synchronous reset

module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
    always @(posedge clk)
        if (reset) q <= 0;  // We can use an if statement in always blocks
        else q <= d;        // We use an else to avoid a latch
		
endmodule