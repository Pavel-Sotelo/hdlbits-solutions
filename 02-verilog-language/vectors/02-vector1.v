//Build a combinational circuit that splits an input half-word (16 bits, [15:0] ) into lower [7:0] and upper [15:8] bytes

`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module (
                    input wire [15:0] in,
                    output wire [7:0] out_hi,
    				output wire [7:0] out_lo
                    );

    assign out_hi = in[15:8];  //but for assigning, we put the name of the variable first and then the range
    assign out_lo = in[7:0];

//wire [7:0] data;      // declaration — range before name
//assign out = data[3:0]; // usage — range after name

endmodule