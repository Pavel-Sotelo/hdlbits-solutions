// Build the 4-bit shift register as shown on the diagram of "Exams/2014 q4b" on HDLBits
// You can instantiate a previous exercise module for the top module.
/*
Connect the R inputs to the SW switches,
clk to KEY[0],
E to KEY[1],
L to KEY[2], and
w to KEY[3].
Connect the outputs to the red lights LEDR[3:0].
*/

// MUXDFF module for instantiation

module MUXDFF (
    input clk,
    input E, L, w, R,
    output reg Q
);

    always @(posedge clk) begin

        if (L)
            Q <= R;
        else if (E)
            Q <= w;
        else
            Q <= Q;
            
    end

endmodule

// Top module

module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 

    MUXDFF ff3 (KEY[0], KEY[1], KEY[2], KEY[3], SW[3], LEDR[3]);
    MUXDFF ff2 (KEY[0], KEY[1], KEY[2], LEDR[3], SW[2], LEDR[2]);
    MUXDFF ff1 (KEY[0], KEY[1], KEY[2], LEDR[2], SW[1], LEDR[1]);
    MUXDFF ff0 (KEY[0], KEY[1], KEY[2], LEDR[1], SW[0], LEDR[0]);

endmodule
