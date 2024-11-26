`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 01:54:40 PM
// Design Name: 
// Module Name: tb_odd_even_ones
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


module tb_odd_even_ones;
    logic [7:0] data;
    logic are_odd;
    
    odd_even_ones dut(
        .d(data),
        .odd_ones(are_odd)
    );
    
    initial begin
        data = 8'b01010101; #10
        data = 8'b11100000; #10
        data = 8'b11111111; #10
        data = 8'b00100110; #10
               
        $finish;
    end
        

endmodule
