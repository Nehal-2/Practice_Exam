`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 02:17:46 PM
// Design Name: 
// Module Name: multiplier4bit
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


module multiplier4bit(
        input logic [3:0] A,
        input logic [3:0] B,
        output logic [7:0] P

    );
    
    logic C0, C1, C2;
    
    logic [3:0] a_A1, b_A1, s_A1;
    assign P[0] = A[0] & B[0];
    
    assign b_A1 = {1'b0, A[3] & B[0], A[2] & B[0], A[1] & B[0]}; // B inputs for Adder 1
    assign a_A1 = {A[3] & B[1], A[2] & B[1], A[1] & B[1], A[0] & B[1]}; // A inputs for Adder 1
    
    bit4adder bit4adder_inst1 (
        .A(a_A1),
        .B(b_A1),
        .S(s_A1),
        .Cin(1'b0),
        .Cout(C0)
        
    );
    
    assign P[1] = s_A1[0]; 
    
    logic [3:0] a_A2, b_A2, s_A2;
    
    assign b_A2[0] = s_A1[1];    
    assign b_A2[1] = s_A1[2];
    assign b_A2[2] = s_A1[3];
    assign b_A2[3] = C0;
    
    assign a_A2 = {A[3] & B[2], A[2] & B[2], A[1] & B[2], A[0] & B[2]}; // A & B[2]
    
    bit4adder bit4adder_inst2 (
        .A(a_A2),
        .B(b_A2),
        .S(s_A2),
        .Cin(1'b0),
        .Cout(C1)
        
    );
    
    assign P[2] = s_A2[0];
    
    logic [3:0] a_A3, b_A3, s_A3;
    
    assign b_A3 = {C1, s_A2[3], s_A2[2], s_A2[1]};
    assign a_A3 =  {A[3] & B[3], A[2] & B[3], A[1] & B[3], A[0] & B[3]}; // A & B[3];
    
    bit4adder bit4adder_inst3 (
        .A(a_A3),
        .B(b_A3),
        .S(s_A3),
        .Cin(1'b0),
        .Cout(C2)
        
    );
    
    assign P[6:3] = s_A3;
    assign P[7] = C2;
    
endmodule
