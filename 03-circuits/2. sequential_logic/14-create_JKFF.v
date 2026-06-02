// Create a JK flip-flop froms its truth table.
// A JK flip-flop can be created from a DFF.

module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    
    always @(posedge clk) begin
        
        if (j & k)
            Q <= ~Q;        
        else if(j)
            Q <= 1;
        else if (k)
            Q <= 0;
        else
            Q <= Q;       
    end


endmodule