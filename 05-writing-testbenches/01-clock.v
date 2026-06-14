// Write a testbench with the provided module "module dut ( input clk )" tht instantiates the module and creates a clock signal of a period of 10 ps.
// The clock should start in 0.

module top_module ();
    
    reg clk;
    
    dut testbench_clock (clk);
    
    initial	clk = 0;
    
    always begin
        #5 clk = 1;
        #5 clk = 0;
    end

endmodule