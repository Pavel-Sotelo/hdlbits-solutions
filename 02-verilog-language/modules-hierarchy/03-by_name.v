//Instantiate the module mod_a by name.  mod_a that has 2 outputs and 4 inputs, in some order

module top_module(
    input wire a,b,c,d,
    output wire out1,out2);

    mod_a instanceByName(.in1(a), .in2(b), .in3(c), .in4(d), .out1(out1), .out2(out2));

endmodule