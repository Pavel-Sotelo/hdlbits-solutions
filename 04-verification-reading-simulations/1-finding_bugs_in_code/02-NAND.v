/*
This three-input NAND gate doesn't work. Fix the bug(s).

You must use the provided 5-input AND gate:

module andgate ( output out, input a, input b, input c, input d, input e );

The code is: 

module top_module (input a, input b, input c, output out);//

    andgate inst1 ( a, b, c, out );

endmodule
*/

module top_module (input a, input b, input c, output out);

    wire w1;
    
    //fixed the order of instantiation and completed to 5 inputs (two 1's)
    andgate inst1 ( w1, a, b, c, 1, 1);
    
    //Inverted the output of the AND module
    assign out = ~w1;
    
    
endmodule