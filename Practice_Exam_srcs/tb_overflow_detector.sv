`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 01:23:18 PM
// Design Name: 
// Module Name: tb_overflow_detector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_overflow_detector;
    logic CLK;
    logic CLR_N;
    logic [7:0] count;
    logic overflow;
    
    overflow_detector dut(
        .CLK(CLK),
        .CLR_N(CLR_N),
        .count(count),
        .overflow(overflow)
    );
    
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end
    
    initial begin
        CLR_N = 0; count = 8'b11111110; #5
        
        CLR_N = 1; #5
        
        count = 8'b11111111; #15
        
        count = 8'b00000000; #15
        
        CLR_N = 0; #10
        
        $finish;
        
    end

endmodule
