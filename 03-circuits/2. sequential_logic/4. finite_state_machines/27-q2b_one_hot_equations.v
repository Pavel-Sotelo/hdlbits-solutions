// One-hot FSM next-state logic using bit indices to pass the testbench

module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);
    
    reg [5:0] Y;
      
    
    assign Y[0] = (y[0] | y[3]) & ~w;
    assign Y[1] =  y[0] & w;
    assign Y[2] = (y[1] | Y[5]) & w;
    assign Y[3] = (y[1] | y[2] | y[4] | y[5]) & ~w;
    assign Y[4] = (y[2] | Y[4]) & w;
    assign Y[5] =  y[3] & w;
    
    
    assign Y1 = y[0] & w; 
    assign Y3 = (y[1] | y[2] | y[4] | y[5]) & ~w;
    

endmodule
