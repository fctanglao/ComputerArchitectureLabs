`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2025 08:27:30 PM
// Design Name: 
// Module Name: id_ex_latch
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


module id_ex_latch(
    input wire clk,
    input wire reset,
    input wire [1:0] ctlwb_out,
    input wire [2:0] ctlm_out,
    input wire [3:0] ctlex_out,
    input wire [31:0] npc,
    input wire [31:0] readdat1,
    input wire [31:0] readdat2,
    input wire [31:0] signext_out,
    input wire [4:0] instr_2016,
    input wire [4:0] instr_1511,
    output reg [1:0] wb_ctlout,
    output reg [2:0] m_ctlout,
    
    // breaking down ex_ctlout for future use
    // output reg [3:0] ex_ctlout,
    output reg regdst,
    output reg [1:0] aluop,
    output reg alusrc,
    
    output reg [31:0] npcout,
    output reg [31:0] rdata1out,
    output reg [31:0] rdata2out,
    
    // breaking down s_extendout for future use
    //output reg [31:0] s_extendout,
    output reg [31:0] add_in2,
    output reg [5:0] funct,
    
    output reg [4:0] instrout_2016,
    output reg [4:0] instrout_1511
    );
    
    always @(posedge clk) 
    begin
        if (reset) 
        begin
            wb_ctlout <= 2'b00;
            m_ctlout <= 3'b000;
            regdst <= 1'b0;
            aluop <= 2'b0;
            alusrc <= 1'b0;
            npcout <= 32'h00000000;
            rdata1out <= 32'h00000000;
            rdata2out <= 32'h00000000;
            add_in2 <= 32'h00000000;
            funct <= 6'h000000;
            instrout_2016 <= 5'b00000;
            instrout_1511 <= 5'b00000;
        end
        else 
        begin
            wb_ctlout <= ctlwb_out;
            m_ctlout <= ctlm_out;
            regdst <= ctlex_out[3];
            aluop <= ctlex_out[2:1];
            alusrc <= ctlex_out[0];
            npcout <= npc;
            rdata1out <= readdat1;
            rdata2out <= readdat2;
            add_in2 <= signext_out;
            funct <= signext_out[5:0];
            instrout_2016 <= instr_2016;
            instrout_1511 <= instr_1511;
        end
    end
    
endmodule
