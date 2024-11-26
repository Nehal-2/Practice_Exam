`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 04:34:14 PM
// Design Name: 
// Module Name: pattern_detector
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


module pattern_detector#(
    parameter n = 5
)(
        input logic clk,
        input logic reset_n,
        input logic load,
        input logic [n-1:0] pattern,
        input logic serial_in,
        output logic pattern_match

    );
    
    logic [n-1:0] reg_out;
    logic [n-1:0] shift_reg_out;
    
    register_nbit#(.n(n)) reg_inst(
        .clk(clk),
        .areset(reset_n),
        .en(1'b1),
        .d(pattern),
        .q(reg_out)
    );
    
    shift_reg_nbit #(.n(n)) shift_reg_inst(
        .clk(clk),
        .reset_n(reset_n),
        .shift_en(1'b1),
        .data_in(serial_in),
        .q(shift_reg_out)
    );
    
    assign pattern_match = (reg_out == shift_reg_out);
    
endmodule
