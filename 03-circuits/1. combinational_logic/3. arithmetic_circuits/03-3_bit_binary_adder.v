// Create a 3 bit binary ripple-carry adder. with 3 instances of a full adder
// In this case, you are asked to output all of the carry-outs, so you have to calculate them 

module fadd(
    input wire a,b,cin,
    output wire cout, sum
);
    assign {cout, sum} = a + b + cin;
   
endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    fadd bit1(a[0], b[0], cin, cout[0],sum[0]);
    fadd bit2(a[1], b[1], cout[0], cout[1],sum[1]);
    fadd bit3(a[2], b[2], cout[1], cout[2],sum[2]);

endmodule
