`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2025 04:56:07 PM
// Design Name: 
// Module Name: GPR
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


module GPR(
    output [3:0] Q,
    input [1:0] S,
    input [3:0] D,
    input CLR, CLK, L_in, R_in
    );
    
    basic_cell cell3 ( Q[3], CLR, CLK, S, { D[3], Q[2], L_in, Q[3] } ),
                cell2 ( Q[2], CLR, CLK, S, { D[2], Q[1], Q[3], Q[2] } ),
                cell1 ( Q[1], CLR, CLK, S, { D[1], Q[0], Q[2], Q[1] } ),
                cell0 ( Q[0], CLR, CLK, S, { D[0], R_in, Q[1], Q[0] } );

endmodule
