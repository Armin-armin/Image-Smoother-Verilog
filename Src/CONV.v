`timescale 1ns / 1ps

module CONV(
    input clk,
    input reset,
    input [23:0] data,
    input [23:0] weight,
    output [7:0] result
    );
    
    wire signed [19:0] result_reg;
    
    MAC mac(.clk(clk), .reset(reset), .data(data), .weight(weight), .result(result_reg));
    MAC_Normalize norm(.data(result_reg), .result(result));
endmodule
