// Implement a 4-bit binary adder. In the simplest possible way

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

	assign sum = x + y; // sum is 5 bits to hold the carry-out from the MSB addition
                        // This dont provide intermediate carry-outs as outputs
endmodule