// 3 input look-up-table (LUT)

module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z );
    
    reg [7:0] Q;
    
    always @(posedge clk) begin
        
        if (enable)
            Q <= {Q[6:0], S};    // it sends the values of S every clock edge, starting from the MSB cause its the bit that has to shift more
                     
        end
    
    assign Z = Q[{A,B,C}];  
    
endmodule