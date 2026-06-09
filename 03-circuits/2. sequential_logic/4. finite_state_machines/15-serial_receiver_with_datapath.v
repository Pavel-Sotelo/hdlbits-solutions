// Serial Receiver.
// Idle state is when receiving 1, else start the DATA transfer (Start bit is a 0).

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); 
    parameter IDLE=0, DATA = 1, DONE = 2, ERROR = 3;
    
    reg [3:0] d_counter;
    reg [2:0] state, next_state;
    reg [7:0] store_in;
    // sequential register logic
    
    always @(posedge clk) begin
        
        if(reset) begin
            state <= IDLE;        //IDLE state before first clk edge
        end else begin
            state <= next_state;
        end
        
        if (state == DATA) begin            
			d_counter <= d_counter + 4'd1;
            store_in[d_counter] <= in;  // Switched from shift register {in, store_in[7:1]} to indexing store_in[d_counter] 
										// because shift based updates were causing timing conflicts with the start bit sampling
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
    assign out_byte = (state == DONE)? store_in : '0;
    
endmodule
