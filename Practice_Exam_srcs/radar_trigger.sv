`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 03:15:10 PM
// Design Name: 
// Module Name: radar_trigger
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


module radar_trigger(
        input logic clk_i,
        input logic resetn_i,
        output logic trigger_o

    );
    
    logic [13:0] count;
    logic comp1, comp2;
    
    assign comp1 = (count == 14'd499);
    assign comp2 = (count == 14'd9999);
    
    d_flipflop d_flipflop_inst(
            .clk(clk_i),
            .areset(resetn_i),
            .en(comp1 | comp2),
            .d(~trigger_o),
            .qs(trigger_o)
    );
        
    nbit_counter #(.n(14)) counter_inst(
            .clk(clk_i),
            .areset(resetn_i | comp2),
            .en(1'b1),
            .q(count)
    ); 
endmodule
