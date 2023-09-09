`timescale 1ns / 1ps

module img_proc_design_tb();
    reg clk, reset, run, wea;
    wire done;
    wire [1023:0] douta;
    reg [71:0] kernel;
    
    reg signed [7:0] a = -1;
    reg signed [7:0] b = 8;
    
    reg [1023:0] result [0:127];
    integer i, file;
     
    img_proc_design_wrapper wrapper (
        clk,
        done,
        run,
        douta,
        kernel,
        reset,
        wea
        );
        
    always @(*)
        #5 clk <= ~clk;
    initial
    begin
        clk <= 0;
        wea <= 1;        
        reset <= 1;
        #10 reset <= 0;
        run <= 1;
        kernel [71:64] <= a;
        kernel [63:56] <= a;
        kernel [55:48] <= a;
        kernel [47:40] <= a;
        kernel [39:32] <= b;
        kernel [31:24] <= a;
        kernel [23:16] <= a;
        kernel [15:8] <= a;
        kernel [7:0] <= a;
        #100;
        for (i = 0; i < 128; i = i + 1) begin
            result[i] = douta;
            #40;                
        end
        file = $fopen("D:\output_image.txt", "a");
        for (i = 0; i < 128; i = i + 1) begin
                $fwrite(file, "%h\n", result[i]);
        end
        $fclose(file);
    end
endmodule
