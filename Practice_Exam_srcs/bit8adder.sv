`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 02:00:11 PM
// Design Name: 
// Module Name: bit8adder
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


module bit8adder(
        input logic Cin,
        input logic [7:0] A,
        input logic [7:0] B,
        output logic [7:0] Y,
        output logic Cout

    );
    logic Cout_temp;
    
    bit4adder bit4adder_inst1 (
        .A(A[3:0]),
        .B(B[3:0]),
        .S(Y[3:0]),
        .Cin(Cin),
        .Cout(Cout_temp)
        
    );
    
    bit4adder bit4adder_inst2 (
        .A(A[7:4]),
        .B(B[7:4]),
        .S(Y[7:4]),
        .Cin(Cout_temp),
        .Cout(Cout)
        
    );
     
endmodule
