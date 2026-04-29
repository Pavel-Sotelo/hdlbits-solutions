module top_module( input a,b,
                   output out);

    // XNOR gate, its just a NOT ^
    // without ^ it is:  ~((a & ~(b)) || (~(a) & b))

    assign out = ~(a ^ b);

endmodule