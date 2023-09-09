`timescale 1ns / 1ps

module input_control(
    input clk,
    input reset,
    input conv_run,
    input [71:0] kernel,
    output reg enable_ram,
    output reg [7:0] address_ram,
    output reg [23:0] weight
    );
    
    reg [1:0] count = 0;
    integer last_addr = 8'b0;
    
    always @(posedge clk, posedge reset)
    begin
        if (reset) begin
            enable_ram <= 0;
            address_ram <= 0;
            count <= 0;
        end
        else begin
            count <= count + 1;
            if (conv_run) begin
                enable_ram <= 1;                
                case (count)
                    0: begin
                        weight <= kernel[71:48];
                        address_ram <= last_addr;
                    end
                    1: begin
                        weight <= kernel[47:24];
                        address_ram <= last_addr + 1;
                    end
                    2: begin
                        weight <= kernel[23:0];
                        address_ram <= last_addr + 2;
                    end
                    3: begin
                        last_addr <= last_addr + 1;
                    end
                endcase
            end
            else
                enable_ram <= 0;
        end
    end    
endmodule
