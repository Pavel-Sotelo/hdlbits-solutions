//instance the module mod_a by position. mod_a that has 2 outputs and 4 inputs, in that order.

module top_module (
    input wire a,b,c,d,
    output wire out1,out2);

    mod_a instanceByPosition(out1, out2, a, b, c, d);

endmodule