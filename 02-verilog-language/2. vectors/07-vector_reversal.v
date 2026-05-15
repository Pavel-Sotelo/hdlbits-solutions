//Given an 8-bit input vector [7:0], reverse its bit ordering

module top_module (
    input wire [7:0] in,
    output wire [7:0] out);

    //assign out[7:0] = in[0:7]; doesnt work because Verilog doesnt allow to flip a declaration of a vector

    assign out = {in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]};

endmodule