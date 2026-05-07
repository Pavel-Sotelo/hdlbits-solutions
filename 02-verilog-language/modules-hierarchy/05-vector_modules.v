// Chain 3 x 8-bit D flip-flops to create a shift register with 0-3 cycle delay
// 4-to-1 mux selects output: sel=00 no delay, sel=01 1 cycle, sel=10 2 cycles, sel=11 3 cycles

module top_module (
    input wire clk,
    input wire [7:0] d,
    input wire [1:0] sel,
    output wire [7:0] q);

    wire [7:0] vec1,vec2,vec3;

    my_dff8 dff1(clk, d, vec1);
    my_dff8 dff2(clk, vec1, vec2);
    my_dff8 dff3(clk, vec2, vec3);

    assign q =  sel == 2'b00 ? d :
                sel == 2'b01 ? vec1 :
                sel == 2'b10 ? vec2 : vec3;

/*
	// This is another way to make a 4-to-1 multiplexer
	always @(*)		// Combinational always block
		case(sel)
			2'h0: q = d;
			2'h1: q = o1;
			2'h2: q = o2;
			2'h3: q = o3;
		endcase
*/

endmodule