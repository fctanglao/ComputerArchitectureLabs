`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2025 04:56:07 PM
// Design Name: 
// Module Name: basic_cell
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


module basic_cell(
    output reg Q,
    input CLR, CLK,
    input [1:0] Sel,
    input [3:0] I
    );

    // Internal nets
    wire data;
    // D Flip Flop
    always @ (posedge CLK or negedge CLR)
    begin
        if (!CLR)
            Q <= 0;
        else
            Q <= data;
    end
    // Mux
    assign data = I[Sel];

endmodule
