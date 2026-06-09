// Create the FSM as shown on the states transition table of "Fsm3" on HDLBits.

module top_module(
    input clk,
    input in,
    input areset,
    output out); 

    parameter A=0, B=1, C=2, D=3;
    reg [1:0] state, next_state;   // We have to use vector to represent all 2-bit states
    
    //Flip flop register of states
    
    always @(posedge clk, posedge areset) begin
        
        if(areset)
            state <= A;
        else
            state <= next_state;
    end
   
    // state transitions logic
    
    always @(*) begin
    
        case(state)        
            A: next_state = in ? B : A;
            B: next_state = in ? B : C;
            C: next_state = in ? D : A;
            D: next_state = in ? B : C;               
        endcase
    end
    
    //output logic
    
    assign out = (state == D);
    

endmodule