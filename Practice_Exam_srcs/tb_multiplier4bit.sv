`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 02:38:12 PM
// Design Name: 
// Module Name: tb_multiplier4bit
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


module tb_multiplier4bit;
    logic [3:0] A;
    logic [3:0] B;
    logic [7:0] P;
    
    multiplier4bit dut(
        .A(A),
        .B(B),
        .P(P)
    );    
    
    initial begin
        A = 4'b1000; B = 4'b0010; #10
        A = 4'b0011; B = 4'b0011; #10
        A = 4'b1111; B = 4'b0001; #10
        A = 4'b0000; B = 4'b1010; #10
        A = 4'b1001; B = 4'b0110; #10
        A = 4'b1100; B = 4'b1000; #10

        $finish;        
    end
endmodule
