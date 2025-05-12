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
    output wire [31:0] A,
    output wire [31:0] B
    );
    
    reg [31:0] gpr[0:31];

    initial 
    begin
        for (integer i = 0; i < 32; i = i + 1)
             gpr[i] = 32'b0;
    end
    
    assign A = (rs == 0) ? 32'b0 : gpr[rs];
    assign B = (rt == 0) ? 32'b0 : gpr[rt];
    
    always @(posedge clk) 
    begin
        if (reset) 
        begin
            for (integer i = 0; i < 32; i = i + 1)
                gpr[i] <= 32'b0;
        end
        else if (regwrite && rd != 0) 
        begin
            gpr[rd] <= writedata;
        end
    end
    
endmodule
