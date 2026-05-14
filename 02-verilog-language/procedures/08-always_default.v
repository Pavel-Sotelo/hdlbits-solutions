//To avoid creating latches inside an always block, you have to assign to all regs a default value, such as 0, before the case statement
//Not assigning a value to a wire results in a default 0, but in regs its not. In an always block its better to assign before anything, default values


module top_module(
    input wire [15:0] scancode,
    output reg up,down,left,right
);

    always @(*) begin
        up = 0; down = 0; left = 0; right = 0;
        case(scancode)

        16'he06b: left = 1;
        16'he072: down = 1;
        16'he074: right = 1;
        16'he075: up = 1;

        endcase

    end

endmodule