// Synchronous active-low reset with independent byte-enable control
// The byte-enable inputs control whether each byte of the 16 registers should be written to on that cycle

module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always @(posedge clk) begin
        
        if (!resetn) begin  //Active low reset, it resets all bits when its 0
            q <= 0; 
        end else begin 
        // We have to use two separate if's because if both are true, they should act together, not only one
        if (byteena[1])   
            q [15:8] <= d [15:8];
        if (byteena[0])
            q [7:0] <= d [7:0];
        end
    end 

endmodule