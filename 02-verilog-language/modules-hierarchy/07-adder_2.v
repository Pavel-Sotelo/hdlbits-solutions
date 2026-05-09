//Create a 32-bit adder instantiating 2 16-bit adders which each of them have 16 full adders , where you create the module of the full adder

module add1 (
    input wire a,b,cin,
    output wire sum,cout);

    assign sum = a ^ b ^ cin;
    assign cout = (a&b) | (a&cin) | (b&cin);

endmodule

module top_module (
    input wire[31:0] a,b,
    output wire[31:0] sum);

    wire cin0,cout0,cout1;
    wire [15:0] sum1,sum2; 

    add16 add16_1(a[15:0],b[15:0], cin0, sum1, cout0);
    add16 add16_2(a[31:16],b[31:16], cout0, sum2, cout1);

    assign sum[15:0] = sum1;
    assign sum[31:16] = sum2;

endmodule