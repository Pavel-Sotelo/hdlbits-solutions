// From a 1000 Hz clock, derive a 1 Hz signal
// This means the output "OneHertz" must turn on for exactly 1 cycle every 1000 clock pulses

module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
);

    reg [3:0] Q0, Q1, Q2;
    
    assign c_enable[0] = 1;    
    assign c_enable[1] = Q0 == 4'd9;
    assign c_enable[2] = Q0 == 4'd9 & Q1 == 4'd9;
    assign OneHertz = Q2 == 4'd9 & Q1== 4'd9 & Q0 == 4'd9;

    bcdcount counter0 (clk, reset, c_enable[0], Q0);
    bcdcount counter1 (clk, reset, c_enable[1], Q1);
    bcdcount counter2 (clk, reset, c_enable[2], Q2);
     
endmodule