`timescale 1ns / 1ps

module CONV128(
    input clk,
    input reset,
    input [1039:0] data,
    input [23:0] weight,
    output [1023:0] result
    );
    
    genvar i;
    generate
        for (i = 128; i >= 1; i = i - 1)
        begin
            CONV conv(
                .clk(clk),
                .reset(reset),
                .data(data[(i + 2) * 8 - 1 : (i + 2) * 8 - 24]),
                .weight(weight),
                .result(result[i * 8 - 1 : i * 8 - 8])
                );
        end
    endgenerate            
endmodule
