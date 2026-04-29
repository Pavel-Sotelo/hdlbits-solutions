`default_nettype none
module top_module(input a,b,c,d, 
                output out,out_n);
    // when we need to make internal connections on the module, like connecting 2 gates, we need to declare a wire, example: 
    // wire wire_1;
 
    wire wire_1;
    wire wire_2;
    wire wire_3;

    assign wire_1 = a & b;
    assign wire_2 = c & d;

    assign wire_3 = wire_1 | wire_2;

    assign out = wire_3;
    assign out_n = ~wire_3;

endmodule