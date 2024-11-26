`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 05:07:25 PM
// Design Name: 
// Module Name: tb_shift_reg_nbit
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


module tb_shift_reg_nbit;
    logic clk;
    logic reset;
    logic shift_en;
    logic data_in;
    logic [4:0] q;
    
    shift_reg_nbit #(.n(5)) dut(
        .clk(clk),
        .reset_n(reset),
        .shift_en(shift_en),
        .data_in(data_in),
        .q(q)
    );
    
    initial begin
        clk =0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        // Initialize signals
        reset = 0;
        shift_en = 0;
        data_in = 0;

        // Apply reset
        #10 reset = 1; // Release reset after 10 time units
        
        // Test Case 1: Shift in a series of bits
        shift_en = 1;
        data_in = 1; #10; // Shift in '1'
        data_in = 0; #10; // Shift in '0'
        data_in = 1; #10; // Shift in '1'
        data_in = 1; #10; // Shift in '1'
        data_in = 0; #10; // Shift in '0'
        
//        // Test Case 2: Disable shifting
//        shift_en = 0; 
//        data_in = 1; #20; // Data shouldn't shift while `shift_en` is 0
        
//        // Test Case 3: Apply reset during operation
//        reset = 0; #10; // Reset signal active, q should be cleared
//        reset = 1; #10; // Release reset
        
//        // Test Case 4: Resume shifting
//        shift_en = 1;
//        data_in = 1; #10; // Shift in '1'
//        data_in = 0; #10; // Shift in '0'
        
        // End simulation
        #50 $stop;
    end
    initial begin
        $monitor("Time: %0t | Reset: %b | Shift En: %b | Data In: %b | Q: %b", 
                 $time, reset, shift_en, data_in, q);
    end
endmodule
