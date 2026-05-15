//Instantiate 3 modules called my_dff that each one represents a D flip flop, the module provided is: 
//module my_dff ( input clk, input d, output q );

module top_module(
    input clk, d,
    output q);

    wire vec1,vec2,vec3;

    my_dff dff1(clk , d, vec1);
    my_dff dff2(clk , vec1, vec2);
    my_dff dff3(clk , vec2, vec3);

    assign q = vec3;

endmodule