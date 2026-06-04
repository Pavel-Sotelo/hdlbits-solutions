// Build a 4-digit BCD counter. 
// Each decimal digit is encoded using 4 bits: q[3:0] is the ones digit, q[7:4] is the tens digit, etc.

module top_module (
    input clk,
    input reset,   
    output [3:1] ena,
    output [15:0] q);
    
    assign ena[1] = q[3:0] == 4'b1001;
    assign ena[2] = q[7:4] == 4'b1001 && ena[1];
    assign ena[3] = q[11:8] == 4'b1001 && ena[2];
    
    always @(posedge clk) begin
       
        // Ones digit
        
        if (reset)
            q[3:0] <= '0;
        else if (q[3:0] == 4'b1001)
            q[3:0] <= '0;
        else
            q[3:0] <= q[3:0] + 4'b1;
        
        // Tens digit
        
        if (reset)
            q[7:4] <= '0;
        else if (ena[1] && q[7:4] == 4'b1001)
            q[7:4] <= '0;
        else if (ena[1])
            q[7:4] <= q[7:4] + 4'b1;
        
   		// Hundreds digit
        
        if (reset)
            q[11:8] <= '0;
        else if (ena[2] && q[11:8] == 4'b1001)
            q[11:8] <= '0;
        else if (ena[2])
            q[11:8] <= q[11:8] + 4'b1;
        
        // Thousands digit
        
        if (reset)
            q[15:12] <= '0;
        else if (ena[3] && q[15:12] == 4'b1001)
            q[15:12] <= '0;
        else if (ena[3])
            q[15:12] <= q[15:12] + 4'b1;  
           
    end
    
endmodule
