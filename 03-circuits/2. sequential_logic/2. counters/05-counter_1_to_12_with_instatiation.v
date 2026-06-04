// Create a 1 to 12 counter that is going to be created from an instance of another module (a 4-bit 0 to 15 counter).
// The variables "c_" are just for the simulation to evaluate the results 

module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output reg [3:0] c_d
); 
    assign c_enable = enable;   // enable stays the same
    assign c_d = 4'd1;  // We assign the number that we want to load when Q is 12 and enable is 1.
    assign c_load = reset || (Q == 12 && enable);  //This is what we want to happen if load wants to put d to the counter
    
	count4 the_counter (clk, c_enable, c_load, c_d, Q);

endmodule