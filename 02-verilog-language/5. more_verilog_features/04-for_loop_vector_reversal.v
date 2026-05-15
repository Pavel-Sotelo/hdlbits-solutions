// Given a 100-bit input vector, reverse the bit ordering, using a for-loop

module top_module( 
    input [99:0] in,
    output reg[99:0] out
);              
    						
    always @(*) begin
       
        for(int i = 0; i < $bits(out); i = i+1) begin

            out[i] = in[99 - i];
            
        end
    end
    
endmodule