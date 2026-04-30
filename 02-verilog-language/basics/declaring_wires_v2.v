`default_nettype none     // disables implicit wire creations, typos become errors instead of silent bugs
module top_module(input a,b,c,d, 
                output out,out_n);
 
    //we can put all declarations of wires in one single line

    wire w1, w2;

    //wire 3 doesn't need to be declared because it can directly go to the outputs

    assign w1 = a & b;
    assign w2 = c & d;

    assign out = w1 | w2;
    assign out_n = ~out;

endmodule