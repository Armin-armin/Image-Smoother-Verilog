`timescale 1ns / 1ps

module output_control(
    input clk,
    input reset,
    input [1023:0] data,
    output reg conv_done,
    output reg [6:0] ram_address,
    output reg [1023:0] data_out
    );
    
    reg [1:0] count = 0;
    integer last_addr = 8'b0;
    
    always @(posedge clk, posedge reset)
    begin
        if (reset) begin
            conv_done <= 0;
            ram_address <= 0;
            data_out <= 0;
            count = 0;
        end
        else begin
            count <= count + 1;
            if (count == 3) begin
                ram_address <= last_addr;
                data_out <= data;
                last_addr <= last_addr + 1;
            end
            if (last_addr == 128) begin
                conv_done <= 1;
            end
        end
    end
endmodule
