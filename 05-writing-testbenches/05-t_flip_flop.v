// Build a testbench that instantiates one TFF and will reset it, the toggle it to the "1" state.

module top_module ();
    
    reg clk, reset, t;
    wire q;
    
    tff testbench (clk, reset, t, q);
    
    always #5 clk = ~clk;
    
    
    initial begin
       clk = 0;
        
       reset = 0; t = 0; #5; 
       reset = 1; #10;
       reset = 0;  
       t = 1;
        
    end
    

endmodule