//Instanciate module A and B, to create the following diagram (in HDLBits: Combine circuits A and B)

module A (input x, input y, output z);

    assign z = (x^y) & x;
    
endmodule

module B ( input x, input y, output z );

    assign z = ~(x ^ y);   
    
endmodule


module top_module (input x, input y, output z);

    wire w1,w2,w3,w4,f1,f2;
    
    A IA1(x,y,w1);
    B IB1(x,y,w2);
    
    assign f1 = w1 | w2;
    
    A IA2(x,y,w3);
    B IB2(x,y,w4);
    
    assign f2 = w3 & w4;
    
   	assign z = f1 ^ f2;
    
endmodule