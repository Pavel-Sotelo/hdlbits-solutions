// Build a half adder

module top_module( 
    input a, b,
    output cout, sum );
    
    assign sum = a ^ b;
    assign cout = a & b;

    // Or just using the + operator:
    // assign {cout, sum} = a + b;

endmodule
