//given five 1 bit inputs, pairwise all of them in a 25 bit output, the output should be 1 if two bits are equal

module top_module (
    input wire a,b,c,d,e,
    output wire [24:0] out);

    wire [24:0] vec1,vec2;

    assign vec1 = {{5{a}},{5{b}},{5{c}},{5{d}},{5{e}}};
    assign vec2 = {{5{a,b,c,d,e}}}; 

    assign out = ~vec1 ^ vec2;

endmodule