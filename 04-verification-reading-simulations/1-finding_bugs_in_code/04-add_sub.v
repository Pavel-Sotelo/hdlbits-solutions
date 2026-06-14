/* 
The following adder-subtractor with zero flag doesn't work. Fix the bug(s):

module top_module ( 
    input do_sub,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] out,
    output reg result_is_zero
);//

    always @(*) begin
        case (do_sub)
          0: out = a+b;
          1: out = a-b;
        endcase

        if (~out)
            result_is_zero = 1;
    end

endmodule
*/

module top_module ( 
    input do_sub,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] out,
    output reg result_is_zero
);//

    always @(*) begin
        case (do_sub)
          0: out = a+b;
          1: out = a-b;
        endcase

        if (out == 8'd0) // an ~out is incorrect because it fails flipping a zero results in all 1s. you could use a logical !, but i put 8'd0 because its more readable.
            result_is_zero = 1;
        else                      //fixed latch for combinatinal always block
            result_is_zero = 0; 
    end

endmodule
