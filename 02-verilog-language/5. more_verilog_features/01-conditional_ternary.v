// Design a circuit that finds the minimum of four 8-bit numbers a, b, c, and d. Using the conditional operator (also known as the ternary operator) is a common way to implement such logic in Verilog. The conditional operator has the form: condition ? true_value : false_value.

module top_module (
    input [7:0] a, b, c, d,
    output reg [7:0] min);

    wire [7:0] w1, w2;
    
    always @(*) begin
       
        w1 = a > b ? b : a;
        w2 = w1 > c ? c : w1;
        min = w2 > d ? d : w2;
        
    end

endmodule