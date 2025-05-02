`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2025 04:56:07 PM
// Design Name: 
// Module Name: gpr
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


module gpr(
    output [3:0] q,
    input [1:0] sel,
    input [3:0] d,
    input clr, clk, l_in, r_in
    );
    
    basic_cell cell3 ( q[3], clr, clk, sel, { d[3], q[2], l_in, q[3] } ),
                cell2 ( q[2], clk, clk, sel, { d[2], q[1], q[3], q[2] } ),
                cell1 ( q[1], clk, clk, sel, { d[1], q[0], q[2], q[1] } ),
                cell0 ( q[0], clk, clk, sel, { d[0], r_in, q[1], q[0] } );

endmodule
