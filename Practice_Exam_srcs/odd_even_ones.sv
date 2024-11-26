`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 01:51:20 PM
// Design Name: 
// Module Name: odd_even_ones
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


module odd_even_ones(
        input logic [7:0] d,
        output logic odd_ones

    );
    
    assign odd_ones  = d[0]^d[1]^d[2]^d[3]^d[4]^d[5]^d[6]^d[7];
    
endmodule
