// Create a circuit that behaves like a dual-edge triggered flip-flop

module top_module (
    input clk,
    input d,
    output q
);
    reg o1, o2;
    
    always @(posedge clk) o1 <= d ^ o2;
    
    always @(negedge clk) o2 <= d ^ o1;
    
    assign q = o1 ^ o2;
    

endmodule