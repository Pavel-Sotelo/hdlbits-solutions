//Build and AND gate but usign both assign and a combinational always block

module top_module(
    input wire a,b,
    output wire out_assign, out_alwaysblock
);

    assign out_assign = a&b;

    always @(*) out_alwaysblock = a&b;

endmodule