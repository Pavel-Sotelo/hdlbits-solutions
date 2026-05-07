//The replication operator allow to repeat and contatenate a vector n times:
// {num{vector}}

//Build a circuit that sign extends an 8 bit number to 32 bits

//This is done by replicating the sign bit (the most significant bit), and then concatenating the rest of the number

module top_module (
    input wire [7:0] in,
    output wire [31:0] out );

    assign out = {{24{in[7]}}, in};


endmodule