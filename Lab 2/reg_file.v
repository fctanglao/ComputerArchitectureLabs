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
    input wire reset,
    input wire regwrite,
    input wire [4:0] rs,
    input wire [4:0] rt,
    input wire [4:0] rd,
    input wire [31:0] writedata,
    output reg [31:0] A,
    output reg [31:0] B
    );
    
    reg [31:0] gpr[0:31];

    initial 
    begin
        gpr[0] = 32'h002300AA;
        gpr[1] = 32'h10654321;
        gpr[2] = 32'h00100022;
        gpr[3] = 32'h8C123456;
        gpr[4] = 32'h8F123456;
        gpr[5] = 32'hAD654321;
        gpr[6] = 32'h60000066;
        gpr[7] = 32'h13012345;
        gpr[8] = 32'hAC654321;
        gpr[9] = 32'h12012345;
    end
    
    always @(posedge clk) 
    begin
        if (reset) 
        begin
            A <= 32'h00000000;
            B <= 32'h00000000;
        end
        else 
        begin
            if (regwrite) 
            begin
                if (rd != 5'b00000) 
                begin
                    gpr[rd] <= writedata;
                end
            end
            
            A <= gpr[rs];
            B <= gpr[rt];
        end
    end
    
endmodule
