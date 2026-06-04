// Build a 64-bit ahritmetic shift register, with sycnhronous load
/*
amount: Chooses which direction and how much to shift.
2'b00: shift left by 1 bit.
2'b01: shift left by 8 bits.
2'b10: shift right by 1 bit.
2'b11: shift right by 8 bits.
*/

module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q);
    
    always @(posedge clk) begin
        
        if (load)
            q <= data;
        else if (ena) begin
            
            if (amount == 2'b00)
                q <= {q[62:0], 1'b0};
            else if (amount == 2'b01)
                q <= {q[55:0], 8'b0};
            else if (amount == 2'b10)
                q <= {q[63], q[63:1]};            
            else if (amount == 2'b11)
                q <= {{8{q[63]}}, q[63:8]};            
        end
        
    end

endmodule
