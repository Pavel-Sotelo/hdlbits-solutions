// Given a simulation waveform (ilustrated in HDLBits - Simple circuit B) interpretate the behavior

module top_module ( input x, input y, output z );

    assign z = ~(x ^ y);   //The waveform was an XNOR gate
    
endmodule
