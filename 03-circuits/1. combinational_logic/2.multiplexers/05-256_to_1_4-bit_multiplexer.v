// 4-bit wide , 256-to-1 multiplexer
// Starts at highest bit (sel*4 + 3) and slices 4 bits downward (-:)
// Example: sel=0, starts at bit 3, selects in[3:0]

module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );

	assign out = in[sel*4+3 -: 4];

endmodule