// As part of a bigger FSM for the previous one, build a circuit that enables the shift register for 4 cycles, then goes to 0.

module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);

    reg [2:0] count_4;
    
    always @(posedge clk) begin
        
        if (reset)        
        	count_4 <= '0;	
        else if (count_4 < 4'd4)
          	count_4 <= count_4 + 4'b1;
    end
    
    assign shift_ena = (count_4 < 4'd4);

endmodule