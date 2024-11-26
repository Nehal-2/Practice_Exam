`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 04:58:30 PM
// Design Name: 
// Module Name: shift_reg_nbit
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


module shift_reg_nbit#(
    parameter n = 5
)(
    input logic clk,
    input logic reset_n,
    input logic shift_en,
    input logic data_in,
    output logic [n-1:0] q = {n{1'b0}}
);
    
    always@(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            q <= {n{1'b0}};
        end else if (shift_en) begin
            for (int i = 0; i < n-1; i++) begin
                q[i+1] <= q[i]; // Shift bits left
            end
            q[0] <= data_in;
        end
    end
endmodule
