`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2025 12:16:13 AM
// Design Name: 
// Module Name: ex_adder
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


module ex_adder(
    input wire [31:0] add_in1,
    input wire [31:0] add_in2,
    output wire [31:0] add_out
    );
    
    assign add_out = add_in1 + add_in2;
    
endmodule
