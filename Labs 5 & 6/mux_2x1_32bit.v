`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2025 11:55:27 PM
// Design Name: 
// Module Name: mux_2x1_32bit
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


module mux_2x1_32bit(
    input wire [31:0] a, 
    input wire [31:0] b,
    input wire sel,
    output wire [31:0] y
    );
    
    assign y = sel ? a : b;
    
endmodule
