// Use of cases in always blocks : Create a 6 to 1 multiplexer , choose the correct output if sel is between 0 to 5.

module top_module ( 
    input [2:0] sel,    // for your case variable, you must create a binary sequence that can save all of the cases ( example: if you need 5 cases, you create a [2:0] vector that can almacenate 7 binary bits)
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );

    always@(*) begin  // This is a combinational circuit
        case(sel)
            3'b101: out = data5;
            3'b100: out = data4;
            3'b011: out = data3;
            3'b010: out = data2;
            3'b001: out = data1;
            3'b000: out = data0;
            default: out = 0;
        endcase
    end

endmodule