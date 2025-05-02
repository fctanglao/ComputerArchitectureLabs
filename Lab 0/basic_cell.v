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
    output reg q,
    input clr, clk,
    input [1:0] sel,
    input [3:0] I
    );
    
    wire data;
    
    always @ (posedge clk or negedge clr)
    begin
        if (!clr)
            q <= 0;
        else
            q <= data;
    end
    
    assign data = I[sel];

endmodule
