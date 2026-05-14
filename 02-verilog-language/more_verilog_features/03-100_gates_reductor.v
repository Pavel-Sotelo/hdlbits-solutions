//Build a combinational circuit that outputs a single bit that is the result of the bitwise of a 100-bit input

module top_module (
    input wire [99:0] in,
    output wire out_and, out_or, out_xor
);
    
    assign out_and = &in;
    assign out_or = |in;
    assign out_xor = ^in;

endmodule