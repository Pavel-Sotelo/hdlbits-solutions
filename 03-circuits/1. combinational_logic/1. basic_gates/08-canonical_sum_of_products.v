//Canonical sum of products

module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);

    wire w1,w2,w3,w4;
    
    assign w1 = ~x3 & x2 & ~x1; // Row 2 (010)
    assign w2 = ~x3 & x2 & x1;  // Row 3 (011)
    assign w3 = x3 & ~x2 & x1;  // Row 5 (101)
    assign w4 = x3 & x2 & x1;   // Row 7 (111)    
        
    assign f = w1|w2|w3|w4;     // ORing the minterms
    
endmodule