`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2025 12:15:41 AM
// Design Name: 
// Module Name: if_adder
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


module if_adder(
    input wire [31:0] pcin,
    output wire [31:0] pcout
    );
    
    assign pcout = pcin + 32'd4;
    
endmodule
