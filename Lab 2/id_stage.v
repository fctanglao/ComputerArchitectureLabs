`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2025 08:22:16 PM
// Design Name: 
// Module Name: id_stage
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


module id_stage(
    input wire clk,
    input wire reset,
    input wire regwrite,
    input wire [5:0] opcode,
    input wire [31:0] id_npc,
    input wire [4:0] rs, 
    input wire [4:0] rt,
    input wire [4:0] rd,
    input wire [31:0] writedata,
    input wire [15:0] id_instr,
    input wire [4:0] instr_2016,
    input wire [4:0] instr_1511,
    
    output wire [1:0] ex_ctlwb_out,
    output wire [2:0] ex_ctlm_out,
    
    // breaking down ex_ctlout for future use
    // output wire [3:0] ex_ctlm_out
    output wire regdst,
    output wire [1:0] aluop,
    output wire alusrc,
    
    output wire [31:0] add_in1,
    output wire [31:0] A,
    output wire [31:0] ex_readdat2,
    
    // breaking down s_extendout for future use
    // output wire [31:0] s_extendout,
    output wire [31:0] add_in2,
    output wire [5:0] funct,
    
    output wire [4:0] ex_b,
    output wire [4:0] ex_a
    );
    
    // sign extend output
    wire [31:0] signext_out;
    
    // control unit outputs
    wire [1:0] id_ctlwb_out;
    wire [2:0] id_ctlm_out;
    wire [3:0] id_ctlex_out;
    
    // register file outputs
    wire [31:0] id_readdat1;
    wire [31:0] id_readdat2;
    
    sign_extend se0(
    .immediate(id_instr),
    .extended(signext_out)
    );
    
    control c0(
    .clk(clk),
    .reset(reset),
    .opcode(opcode),
    .wb(id_ctlwb_out),
    .m(id_ctlm_out),
    .ex(id_ctlex_out)
    );
    
    reg_file rf0(
    .clk(clk),
    .reset(reset),
    .regwrite(regwrite),
    .rs(rs),
    .rt(rt),
    .rd(rd),
    .writedata(writedata),
    .A(id_readdat1),
    .B(id_readdat2)
    );
    
    id_ex_latch id_ex_pr0(
    .clk(clk),
    .reset(reset),
    .ctlwb_out(id_ctlwb_out),
    .ctlm_out(id_ctlm_out),
    .ctlex_out(id_ctlex_out),
    .npc(id_npc),
    .readdat1(id_readdat1),
    .readdat2(id_readdat1),
    .signext_out(signext_out),
    .instr_2016(instr_2016),
    .instr_1511(instr_1511),
    .wb_ctlout(ex_ctlwb_out),
    .m_ctlout(ex_ctlm_out),
    .regdst(regdst),
    .aluop(aluop),
    .alusrc(alusrc),
    .npcout(add_in1),
    .rdata1out(A),
    .rdata2out(ex_readdat2),
    .add_in2(add_in2),
    .funct(funct),
    .instrout_2016(ex_b),
    .instrout_1511(ex_a)
    );
    
endmodule
