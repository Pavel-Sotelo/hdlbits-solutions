//You are given a module add16 that performs a 16-bit addition. Instantiate two of them to create a 32-bit adder

module top_module (
    input wire[31:0] a, b,
    output wire[31:0] sum);

    wire cout1,cin,cout2;
    wire [15:0] sum1,sum2;

    add16 mod1(a[15:0], b[15:0], cin, sum1, cout1);
    add16 mod2(a[31:16], b[31:16], cout1, sum2, cout2);

    assign sum[15:0] = sum1;
    assign sum[31:16] = sum2;

endmodule