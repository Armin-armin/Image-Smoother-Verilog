`timescale 1ns / 1ps

module MAC_Normalize(
    input signed [19:0] data,
    output reg signed [7:0] result
    );
    
    always @(*)
    begin
        if (data < 0)
            result = 0;
        else if (data > 255)
            result = 255;
        else
            result = data[7:0];
    end    
endmodule
