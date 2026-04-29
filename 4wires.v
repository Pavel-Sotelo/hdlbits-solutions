module top_module( 
    input a,b,c,
    output w,x,y,z );

//assign is a permanent connection, not a one-time copy
//order of assign statements doesn't matter, all run simultaneously

		assign w = a;
    	assign x = b;
    	assign y = b;
    	assign z = c;

endmodule
