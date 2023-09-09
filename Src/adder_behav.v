`timescale 1ns / 1ps

module adder_behav(
    input signed [15:0] a,
    input signed [15:0] b,
    output signed [15:0] result
    );
    
    assign result = a + b;
    
endmodule
