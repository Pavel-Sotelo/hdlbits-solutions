//Build a population count that counts the number of 1s in a 255-bit vector

module top_module(
    input wire [254:0] in,
    output reg [7:0]out
);

    always @(*) begin
            out = 0;
        for(int i = 0; i < $bits(in); i = i+1)
            out = in[i] == 1 ? out + 1'b1 : out;
    end

endmodule