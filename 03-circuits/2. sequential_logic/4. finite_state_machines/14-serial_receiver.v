// Serial Receiver.
// Idle state is when receiving 1, else start the DATA transfer (Start bit is a 0).

module top_module(
    input clk,
    input in,
    input reset,
    output done
);
    parameter IDLE=0, DATA = 1, DONE = 2, ERROR = 3;
    
    reg [3:0] d_counter;
    reg [2:0] state, next_state;

    // sequential register logic
    
    always @(posedge clk) begin
        
        if(reset) begin
            state <= IDLE;        //IDLE state before first clk edge
        end else begin
            state <= next_state;
        end
        
         if (state == DATA) begin            
			d_counter <= d_counter + 4'd1;                        
        end else begin
        	d_counter <= '0;    
        end
        
    end
    
    //state transition logic
    
    always @(*) begin
        
        case(state)
            
            IDLE : next_state = in ? IDLE  : DATA;   //in is 1? stay in IDLE, else START DATA (because Start bit is 0)
            DATA : next_state = (d_counter == 4'd8) ? (in ? DONE : ERROR): DATA;  //We accept input 8 times (0 to 7, stay in DATA) 
            																	  // till we are in the STOP BIT (8) we evaluate it. if its a 1. then we are DONE, else an error ocurred.
            DONE : next_state = in ? IDLE : DATA;
            ERROR: next_state = in ? IDLE : ERROR;
            
            default: next_state = IDLE;
        endcase
    end
    
    assign done = (state == DONE);
    
endmodule