module top_module(
    input wire in1,in2,in3,
    output wire out
);

    wire xnor_out;

    assign xnor_out = in1 ~^ in2;
    assign out = xnor_out ^ in3; 

endmodule