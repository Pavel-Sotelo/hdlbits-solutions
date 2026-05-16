// Vector Relationships Logic
// out_both: AND between current bit and its left neighbor (indices 0 to 2)
// out_any:  OR between current bit and its right neighbor (indices 1 to 3)
// out_different: XOR between current bit and its left neighbor (with wrap-around)

module top_module( 
    input [3:0] in,
    output reg[2:0] out_both,
    output reg[3:1] out_any,
    output reg[3:0] out_different );
    
    always @(*) begin
    
        for(int i = 0; i <= 2; i = i + 1) begin
            out_both[i] = in[i+1] & in[i];
        end
        
        for(int i = 1; i <= 3; i = i + 1) begin
            out_any[i] = in[i] | in[i-1];
        end
        
        for(int i = 0; i <= 3; i = i + 1) begin
            out_different[i] = (i+1 < 4 ? in[i+1] : in[0]) ^ in[i];    //XOR gate evaluates if 2 bits are different
        end
        
    end
    
    

endmodule