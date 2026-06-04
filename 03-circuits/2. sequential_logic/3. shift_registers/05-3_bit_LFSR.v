// Build the circuit of a 3-bit LFSR from the diagram  of "Mt2015 lfsr" of HDLBits.
// The instantiation was a previous exercise, which in conjunt makes an LFSR. 

module mux_dff(
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
    always @(posedge clk) begin
        
        if(L)
            Q <= r_in;
        else
            Q <= q_in;
        
    end

endmodule


module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    mux_dff ff1 (KEY[0], KEY[1], SW[0], LEDR[2], LEDR[0]);
    mux_dff ff2 (KEY[0], KEY[1], SW[1], LEDR[0], LEDR[1]);
    mux_dff ff3 (KEY[0], KEY[1], SW[2], LEDR[1] ^ LEDR[2], LEDR[2]);

endmodule
