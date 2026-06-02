// Create a module for the diagram of HDLBits (Mux and DFF). 
// The circuit consists in a DFF connected to 2 multiplexers.

module top_module (
    input clk,
    input w, R, E, L,
    output reg Q
);

    always @(posedge clk) begin

        if (L)
            Q <= R;
        else if (E)
            Q <= w;
        else
            Q <= Q;
            
    end

endmodule