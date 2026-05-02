module top_module(
                input wire [3:0] in,
                output wire out_and,out_or,out_xor
                );

    //we just use the bitwise operator , it analyses bit to bit gates

    assign out_and = &in;
    assign out_or = |in;
    assign out_xor = ^in;

endmodule 