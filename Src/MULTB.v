`timescale 1ns / 1ps

module MULTB(
    input signed [8:0] a,
    input signed [7:0] x,
    output signed [15:0] result
    );
    
    assign a[8] = 1'b0;
    assign result = a * x; 
    
endmodule
