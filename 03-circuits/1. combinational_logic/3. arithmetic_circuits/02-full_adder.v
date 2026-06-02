// Create a full adder

module top_module( 
    input a, b, cin,
    output cout, sum );
    
    assign sum =  a ^ b ^ cin;
    assign cout = a&b | b&cin | cin&a;
    
    // That was the mathematic way. A simple way is using the + operator:
    // assign {cout, sum} = a + b + cin;

endmodule