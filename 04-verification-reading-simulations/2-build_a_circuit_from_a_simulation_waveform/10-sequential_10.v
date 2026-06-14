module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    
    always @(*) begin
        
        if (state) begin
            
            if (a ^ b == 0)
                q = 1;
            else
                q = 0;
            
        end else begin      	
        	q = a ^ b;
        end
    end
    
    
    always @(posedge clk) begin
    
        if(a==b)
        	state <= a;
		else
    		state <= state;
    end
    

endmodule