// Given a 100-bit input vector, reverse the bit ordering, using a for-loop

module top_module( 
    input [99:0] in,
    output reg[99:0] out
);
    integer i;                       //out[0] = in[99]
    								//out[1] = in[98]
    always @(*) begin
       
        for(i = 0; i <= 99; i = i+1) begin

            out[i] = in[99 - i];
            
        end
    end
    
endmodule