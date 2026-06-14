module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );

    // I implemented a karnaugh map for this
    
    assign q = c | (~c)&b;

endmodule
