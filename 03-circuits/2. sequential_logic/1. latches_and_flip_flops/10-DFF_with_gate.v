// Implement a DFF that has as an input a XOR gate of the inputs "in" and the output of that same DFF

module top_module (
    input clk,
    input in, 
    output out);
    
    always @(posedge clk) begin

        out <= out ^ in; 
        
    end

endmodule