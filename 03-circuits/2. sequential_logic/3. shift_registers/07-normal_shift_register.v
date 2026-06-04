// Build a Shift Register with 4 DFF's that receives an input
// This is also called a 4-bit SISO, where it takes data bit by bit and it releases bit by bit

module top_module (
    input clk,
    input resetn,   // synchronous active-low reset
    input in,
    output out);
    
    reg [3:0] q;
    
    always @(posedge clk) begin
        
        if (~resetn) begin
            q <= 4'b0;
        end else begin
            q <= {in, q[3:1]};
        end
        
    end
    
    assign out = q[0];

endmodule
