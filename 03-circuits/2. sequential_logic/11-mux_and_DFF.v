// Create a module with a DFF that has an input with a multiplexor.
// The input L should decide if r_in or q_in go to the DFF

module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
    always @(posedge clk) begin
        
        if(L)
            Q <= r_in;
        else
            Q <= q_in;

    end

endmodule