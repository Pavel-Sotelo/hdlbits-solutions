//Concatenate six 5-bit inputs + two 1-bits (32 total), split into four 8-bit outputs

module top_module (
                    input [4:0] a, b, c, d, e, f,
                    output [7:0] w, x, y, z 
                    );

    assign {w, x, y, z} = {a, b, c, d, e, f, 2'b11};

endmodule