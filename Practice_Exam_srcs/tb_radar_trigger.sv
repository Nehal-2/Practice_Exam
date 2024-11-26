`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 03:32:55 PM
// Design Name: 
// Module Name: tb_radar_trigger
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


module tb_radar_trigger;
    logic clk_i;
    logic resetn_i;
    logic trigger_o;
    
    radar_trigger dut(
        .clk_i(clk_i),
        .resetn_i(resetn_i),
        .trigger_o(trigger_o)
    );
    
    initial begin
        clk_i = 0;
        forever #5 clk_i = ~clk_i;
    end
    
    initial begin
        resetn_i = 1; #500
        resetn_i = 0; #1000
        
        $finish;
    end

endmodule
