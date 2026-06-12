// Build a shift register that shifts the MSB first if count_ena is 1.
// Then if count_ena is 1, decrement the number that is currently is the shift register.

module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
    
    always @(posedge clk) begin
        
        if(shift_ena)
            q <= {q[2:0], data};
        else if (count_ena)
        	q <= q - 1;
    end
    

endmodule
