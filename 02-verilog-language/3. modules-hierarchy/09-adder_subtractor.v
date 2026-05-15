//Create a 32-bit adder-substractor, using a XOR gate evaluating the 32 bit vector b, with the input sub (replicate it 32 times to evaluate it with each bit of the b)

module top_module(
    input wire[31:0]a,b,
    input wire sub,
    output wire [31:0] sum);

    wire cout_0;
    wire [31:0] xor_gate;

    //we have to replicate sub 32 times for each bit of the b vector
    assign xor_gate = b ^ {32{sub}};

    add16 add_0(a[15:0], xor_gate[15:0], sub, sum[15:0], cout_0);
    add16 add_1(a[31:16], xor_gate[31:16], cout_0, sum[31:16], 0);
    

endmodule