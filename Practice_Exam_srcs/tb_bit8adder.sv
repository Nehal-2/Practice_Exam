`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 02:08:54 PM
// Design Name: 
// Module Name: tb_bit8adder
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


module tb_bit8adder;
    logic Cin;
    logic [7:0] A;
    logic [7:0] B;
    logic [7:0] Y;
    logic Cout;

    bit8adder dut(
        .Cin(Cin),
        .A(A),
        .B(B),
        .Y(Y),
        .Cout(Cout)

    );
    
    initial begin
        A = 8'b11111111; B = 8'b11111111; Cin = 1; #10
        Cin = 0;
        A = 8'b00000001; B = 8'b00000011; #10
        A = 8'b00000011; B = 8'b00000100; #10
        A = 8'b00001001; B = 8'b00000001; #10
        A = 8'b00000010; B = 8'b00000111; #10
        A = 8'b10010001; B = 8'b01010011; #10
        
        $finish;
    end        
endmodule
