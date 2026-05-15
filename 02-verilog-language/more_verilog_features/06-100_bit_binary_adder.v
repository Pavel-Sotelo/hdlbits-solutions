//Create a 100-bit binary ripple-carry adder

module top_module(
    input wire [99:0] a,b,
    input wire cin,              //cin is just a single wire
    output reg [99:0] sum,cout
);

    wire [99:0] internal_cin;

    always @(*) begin

        internal_cin[0] = cin;   //We respect the value of the cin input in the first wire
        for(int i = 1; i < 100; i = i + 1) begin   //So we begin in 1 the internal cins vector
            internal_cin[i] = cout[i - 1];         //the internal_cin in this moment, is the cout of the previous moment
        end

        for(int i = 0; i < 100; i = i + 1) begin
           
            sum[i] = a[i] ^ b[i] ^ internal_cin[i];
            cout[i] = a[i] & b[i] | a[i] & internal_cin[i] | b[i] & internal_cin[i];
        end
    end

endmodule