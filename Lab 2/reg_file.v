`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2025 04:07:25 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input wire clk,
    input wire rst,
    input wire regwrite,
    input wire [4:0] rs,
    input wire [4:0] rt,
    input wire [4:0] rd,
    input wire [31:0] writedata,
    output reg [31:0] A_readdat1,
    output reg [31:0] B_readdat2
    );
    
    reg [31:0] REG [0:31];

    initial begin
        REG[0] = 32'h002300AA;
        REG[1] = 32'h10654321;
        REG[2] = 32'h00100022;
        REG[3] = 32'h8C123456;
        REG[4] = 32'h8F123456;
        REG[5] = 32'hAD654321;
        REG[6] = 32'h60000066;
        REG[7] = 32'h13012345;
        REG[8] = 32'hAC654321;
        REG[9] = 32'h12012345;
    end
    
    always @(posedge clk) begin
        if (rst) begin
            A_readdat1 <= 32'h00000000;
            B_readdat2 <= 32'h00000000;
        end
        else begin
            if (regwrite) begin
                if (rd != 5'b00000) begin
                    REG[rd] <= writedata;
                end
            end
            
            A_readdat1 <= REG[rs];
            B_readdat2 <= REG[rt];
        end
    end
endmodule
