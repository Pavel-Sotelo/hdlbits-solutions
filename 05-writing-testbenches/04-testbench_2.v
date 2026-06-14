module top_module();

    reg clk, in;
    reg [2:0] s;
    wire out;
    
    q7 testbench (clk, in, s, out);
   
    // clk testbench logic
    
    initial clk = 0;
    
    always begin       
        #5 clk = 1;
        #5 clk = 0;
    end
    
    // input testbench logic
    
    initial begin
        
       s = 3'd2; in= 0;  #10; 
       s = 3'd6;         #10;
       s = 3'd2; in = 1; #10;
       s = 3'd7; in = 0; #10; 
       s = 3'd0; in = 1; #30;
                 in = 0; 
    end
    
endmodule