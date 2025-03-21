`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 04:41:25 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input  wire clk,
    input  wire reset,
    input  wire [31:0] npc,
    output reg  [31:0] pc 
    );
    
    always @(posedge clk or posedge reset) begin
        if (reset) 
        begin
            pc <= 32'h0;
        end 
        else 
        begin
            pc <= npc;
        end
    end
endmodule
