`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2025 04:14:02 PM
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
    
    // alu mux
    assign y = sel ? a : b;
    
endmodule
