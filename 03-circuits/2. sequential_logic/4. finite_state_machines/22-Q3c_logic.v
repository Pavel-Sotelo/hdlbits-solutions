// Given the state-assigned table shown below, implement the logic functions Y[0] and z.

/*
state y	     Next state Y	    Output z
             x=0	x=1
000	         000	001	       0
001	         001	100	       0
010	         010	001	       0
011	         001	010	       1
100	         011	100	       1
*/


module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

    parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100;
    reg [2:0] Y;
    
    always @(*) begin
        
        case(y) 
        
            A: Y = x? B : A;
            B: Y = x? E : B;   
            C: Y = x? B : C;   
            D: Y = x? C : B;   
            E: Y = x? E : D;   
        
        endcase
    end
    
    assign z  = (y == D) | (y == E);
    assign Y0 = (Y[A]);
    
endmodule
