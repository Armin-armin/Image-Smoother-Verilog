`timescale 1ns / 1ps

module MAC(
    input clk,
    input reset,
    input signed [23:0] data,
    input signed [23:0] weight,
    output reg signed [19:0] result
    );
    
    wire signed [15:0] product [0:2];
    wire signed [15:0] sum [0:1];
    reg [1:0] count = 0;
    
    MULTB mul1(.a(data[7:0]), .x(weight[7:0]), .result(product[0]));
    MULTB mul2(.a(data[15:8]), .x(weight[15:8]), .result(product[1]));
    MULTB mul3(.a(data[23:16]), .x(weight[23:16]), .result(product[2]));
    
    adder_behav add1(.a(product[0]), .b(product[1]), .result(sum[0]));
    adder_behav add2(.a(sum[0]), .b(product[2]), .result(sum[1]));
    
    always @(posedge clk, posedge reset)
    begin
        if (reset) begin
            count <= 0;
            result <= 0;
        end
        else begin
            count <= count + 1;
            if (count == 3) begin
                result <= 0;
            end
            else begin
                result <= result + sum[1];
            end
        end
    end    
endmodule
