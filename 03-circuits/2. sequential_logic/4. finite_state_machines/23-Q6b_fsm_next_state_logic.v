// Build the next_state logic for y[2] based on the FSM diagram of "Q6b" on HDLBits.

module top_module (
    input [3:1] y,
    input w,
    output Y2);
        
    assign Y2 = (y[1] & ~y[2]) | ((y[2] & ~y[1]) & w) | ((y[3] & ~y[2]) & w);
    
endmodule
