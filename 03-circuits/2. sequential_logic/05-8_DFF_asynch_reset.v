// Create 8 DFF with asynchronous reset
// Asynchronous reset means that the reset takes effect immediately, regardless of waiting for the clock

module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    always @(posedge clk or posedge areset) begin // This is the key difference, the FF also reacts to the reset if it goes high immediately
    
        if (areset)
        	q <= 0;
        else
            q <= d;
        
    end

endmodule
