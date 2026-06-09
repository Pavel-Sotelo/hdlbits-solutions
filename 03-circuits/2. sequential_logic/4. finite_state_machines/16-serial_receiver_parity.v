// Serial Receiver with datapath and parity checking.

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); 
    parameter IDLE=0, DATA = 1, STOP = 2, DONE = 3, ERROR = 4;
    
    reg [3:0] d_counter;
    reg [2:0] state, next_state;
    reg [7:0] store_in;
    reg odd;
    
    // sequential register logic
    
    always @(posedge clk) begin
        
        if(reset) begin
            state <= IDLE;
            odd <= 0;
        end else begin
            state <= next_state;
        end
        
        if (state == DATA) begin 
            
		    d_counter <= d_counter + 4'd1;
            store_in[d_counter] <= in;  
			
            if(in) begin
                odd <= ~odd;
            end
            
        end else begin
        	d_counter <= '0;
			odd <= 0;
        end        
    end
    
    //state transition logic
    
    always @(*) begin
        
        case(state)
            
            IDLE : next_state = in ? IDLE  : DATA;   
            DATA : next_state = (d_counter == 4'd8) ? (in ^ odd ? STOP : ERROR): DATA;             																	 
            STOP:  next_state = in ? DONE : ERROR;
            DONE : next_state = in ? IDLE : DATA;
            ERROR: next_state = in ? IDLE : ERROR;
            
            default: next_state = IDLE;
        endcase
    end
    
    assign done = (state == DONE);
    assign out_byte = (state == DONE)? store_in : '0;
    
endmodule
