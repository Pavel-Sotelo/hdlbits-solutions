// Create a way to assign if an overflow of  2 8-bit 2s complement numbers has occured

module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 
    assign s = a + b;
    assign overflow = (~a[7] & ~b[7] & s[7]) | (a[7] & b[7] & ~s[7]); //Comparing if the MSB (which represents the sign) produces:
																	  // positive + positive = negative, or negative + negative = positive
endmodule
