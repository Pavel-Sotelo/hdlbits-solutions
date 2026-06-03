// Create the circuit as shown in HDLBits diagram of "DFFs and gates"

module top_module (
    input wire x, clk, 
    output reg z
);

    reg Q1, Q2, Q3,
            Q_2, Q_3;   //We assign the inverted Q's of each DFF

    assign Q_2 = ~Q2;   //We use an assign because they are not independent FF's
    assign Q_3 = ~Q3;

    assign z = ~(Q1 | Q2 | Q3);

    always @(posedge clk) begin
        Q1 <= Q1 ^ x;
        Q2 <= Q_2 & x;
        Q3 <= Q_3 | x;
    end

endmodule