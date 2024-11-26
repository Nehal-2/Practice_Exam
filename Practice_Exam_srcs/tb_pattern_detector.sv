`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 05:21:34 PM
// Design Name: 
// Module Name: tb_pattern_detector
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


module tb_pattern_detector;
    logic clk;
    logic reset_n;
    logic load;
    logic [4:0] pattern;
    logic serial_in;
    logic pattern_match;
    
    pattern_detector(
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .pattern(pattern),
        .serial_in(serial_in),
        .pattern_match(pattern_match)
    );
    
    initial begin
        clk =0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        load = 1; pattern = 6'b101101;
        serial_in = 0; #10
        serial_in = 1; #10
        serial_in = 1; #10
        serial_in = 1; #10
        serial_in = 1; #10
        serial_in = 1; #10
        
        reset_n = 0;
        
        serial_in = 1; #10
        serial_in = 0; #10
        serial_in = 1; #10
        serial_in = 1; #10
        serial_in = 0; #10
        serial_in = 1; #10
        
        $finish;
    end

endmodule
