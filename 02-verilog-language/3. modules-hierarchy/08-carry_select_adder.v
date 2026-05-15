//32-bit carry select adder: lower 16 bits computed once, upper 16 bits computed twice (cin=0 and cin=1), mux selects correct result based on lower half carry-out

module top_module(
    input wire[31:0]a,b,
    output wire[31:0] sum);

    wire cin0,cin1,cout;

    assign cin1 = 1;

    wire [15:0] sum1,sum2,sum_s0,sum_s1;

    add16 add_one(a[15:0],b[15:0], cin0, sum1, cout);
    
    add16 select_0(a[31:16], b[31:16], cin0, sum_s0, 0);
    add16 select_1(a[31:16], b[31:16], cin1, sum_s1, 0);

    assign sum[15:0] = sum1;
    assign sum[31:16] = cout == 0 ? sum_s0 : sum_s1;
                        
endmodule