//Build a 4-bit priority encoder using a case statement

module top_module(
    input wire [3:0] in,
    output reg [1:0] pos  //2-bit vector representing the position of the first 1 in all cases
);
    always @(*)begin
        case(in)

        4'b1111: pos = 2'd0; 
        4'b1110: pos = 2'd1;
        4'b1101: pos = 2'd0;
        4'b1100: pos = 2'd2;
        4'b1011: pos = 2'd0; 
        4'b1010: pos = 2'd1; 
        4'b1001: pos = 2'd0; 
        4'b1000: pos = 2'd3; 
        4'b0111: pos = 2'd0; 
        4'b0110: pos = 2'd1; 
        4'b0101: pos = 2'd0; 
        4'b0100: pos = 2'd2; 
        4'b0011: pos = 2'd0; 
        4'b0010: pos = 2'd1; 
        4'b0001: pos = 2'd0; 
        4'b0000: pos = 0; 
        
        default: pos = 0;   //default is not neccesary (but good for practice) because all cases are already covered
        endcase
    end

    //This was for practicing cases. but there is a better way to do this(in the next code, called casez)


endmodule