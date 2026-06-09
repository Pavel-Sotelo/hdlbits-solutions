// Lemmings 2 : FSM that walks left or right and switches directions based on obstacles (bump left or right)
// And has the state of falling based on the "ground" input

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah );
    
    parameter LEFT=0, RIGHT=1, FALL_LEFT = 2, FALL_RIGHT= 3;
    reg [1:0] state, next_state;

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state <= LEFT;
        else
            state <= next_state;
    end    
    
    always @(*) begin
        // State transition logic
        case(state)
            
            LEFT : next_state = bump_left & ground ? RIGHT :
                				            ground ? LEFT : FALL_LEFT ; 
            RIGHT: next_state = bump_right & ground ? LEFT :
                				            ground ? RIGHT : FALL_RIGHT ; 
            FALL_LEFT: next_state = ground ? LEFT  : FALL_LEFT;
            FALL_RIGHT: next_state = ground ? RIGHT  : FALL_RIGHT;
            
        endcase
    end


    // Output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == FALL_LEFT | state == FALL_RIGHT);

endmodule
