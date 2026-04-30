//vectors are used to combine separate wires into a simple name

module top_module(
    input wire [2:0] vec,
    output wire[2:0] outv,    //We have to declare what type of connection outv is, to match the input
    output wire o2,           //Same for individual wires
    output wire o1,
    output wire o0
                );

    assign outv = vec;
    assign o2 = vec[2];
    assign o1 = vec[1];
    assign o0 = vec[0];

endmodule