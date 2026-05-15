//Build a circuit that has two 3-bit inputs that computes the bitwise-OR of the two vectors, the logical-OR of the two vectors, and the inverse (NOT) of both vectors. Place the inverse of b in the upper half of out_not (i.e., bits [5:3]), and the inverse of a in the lower half


module top_module(
                input wire [2:0] a,b,
                output wire[2:0] out_or_bitwise,
                output wire out_or_logical,
                output wire [5:0] out_not
                );

    assign out_or_bitwise = a|b;
    assign out_or_logical = a||b;
    assign out_not [5:3] = ~(b);
    assign out_not [2:0] = ~(a);
    
endmodule