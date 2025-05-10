`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 05:07:26 PM
// Design Name: 
// Module Name: if_id_latch
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


module if_id_latch(
    input wire clk,
    input wire reset,
    input wire [31:0] npc,
    input wire [31:0] instr,
    output reg [31:0] npcout,
    
    // breaking down instrout for future use
    // output reg [31:0] instrout,
    output reg [5:0] opcode,
    output reg [4:0] rs,
    output reg [4:0] rt,
    output reg [15:0] id_instr,
    output reg [4:0] instr_2016,
    output reg [4:0] instr_1511
    );

    always @(posedge clk or posedge reset) 
    begin
        if (reset) 
        begin
            npcout <= 32'h0;
            opcode <= 6'h0;
            rs <= 5'h0;
            rt <= 5'h0;
            id_instr <= 16'h0;
            instr_2016 <= 5'h0;
            instr_1511 <= 5'h0;
        end 
        else 
        begin
            npcout <= npc;
            opcode <= instr[31:26];
            rs <= instr[25:21];
            rt <= instr[20:16];
            id_instr <= instr[15:0];
            instr_2016 <= instr[20:16];
            instr_1511 <= instr[15:11];
        end
    end

endmodule
