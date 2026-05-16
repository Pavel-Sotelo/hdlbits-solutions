// Vector Relationships Logic, now with a 99-bit in (or any n-bit input)
// out_both: AND between current bit and its left neighbor (indices 0 to 2)
// out_any:  OR between current bit and its right neighbor (indices 1 to 3)
// out_different: XOR between current bit and its left neighbor (with wrap-around)

module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
    
    always @(*) begin
    
        for(int i = 0; i < $bits(out_both); i = i + 1) begin
            out_both[i] = in[i+1] & in[i];
        end
        
        for(int i = 1; i <= $bits(out_any); i = i + 1) begin
            out_any[i] = in[i] | in[i-1];
        end
        
        for(int i = 0; i < $bits(out_different); i = i + 1) begin
            out_different[i] = (i+1 < $bits(in) ? in[i+1] : in[0]) ^ in[i];    //XOR gate evaluates if 2 bits are different
        end
    end
    
    /*
    A simpler way to do this (but only with the known number of bits of the input) is:
    assign out_both = in & in[99:1];
	assign out_any = in[99:1] | in ;
	assign out_different = in ^ {in[0],in[99:1]};
    */
endmodule