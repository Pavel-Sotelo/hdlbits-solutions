//Reduction operators are used to perform a bitwise operation on all bits of a vector and produce a single output bit. The most common reduction operators are AND (&), OR (|), XOR (^), NAND (~&), NOR (~|), and XNOR (~^)

module  top_module(
    input wire[7:0] in,
    output wire parity_bit
);

    assign parity_bit = ^in; // The reduction operator ^ performs a bitwise XOR operation on all bits of the input vector 'in'. The result is a single bit that represents the parity of the input
    
endmodule