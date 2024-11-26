`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 01:14:28 PM
// Design Name: 
// Module Name: overflow_detector
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


module overflow_detector(
        input logic CLK,
        input logic CLR_N,
        input logic [7:0] count,
        output logic overflow

    );
    logic Q;
    
    d_flipflop DFF(
        .clk(CLK),
        .areset(CLR_N),
        .en(1'b1),
        .d(count[7]),
        .qs(Q)
    );
    
    assign overflow = Q & !count[7];
    
endmodule
