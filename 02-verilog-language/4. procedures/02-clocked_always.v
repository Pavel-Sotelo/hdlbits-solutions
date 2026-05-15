// 3 XOR gates: assign (instant), always_comb (instant), always_ff (delayed by one clock cycle due to flip-flop)
// signals driven by always blocks must be declared as reg, not wire

module top_module(
    input wire a,b,clk, //you have to declare clk as an input
    output reg out_assign, out_always_comb, out_always_ff   //each signal we send to an always block, it has to be a reg instead of a wire
);

    assign out_assign = a ^ b;

    always @(*) out_always_comb = a ^ b;

    always @(posedge clk) out_always_ff <= a ^ b;

endmodule