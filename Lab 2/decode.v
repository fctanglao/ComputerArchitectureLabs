`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2025 04:07:25 PM
// Design Name: 
// Module Name: decode
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


module decode(
    input wire clk,
    input wire rst,
    input wire wb_reg_write,
    input wire [4:0] wb_write_reg_location,
    input wire [31:0] mem_wb_write_data,
    input wire [31:0] if_id_instr,
    input wire [31:0] if_id_npc,
    output wire [1:0] id_ex_wb,
    output wire [2:0] id_ex_mem,
    output wire [3:0] id_ex_execute,
    output wire [31:0] id_ex_npc,
    output wire [31:0] id_ex_readdat1,
    output wire [31:0] id_ex_readdat2,
    output wire [31:0] id_ex_sign_ext,
    output wire [4:0] id_ex_instr_bits_20_16,
    output wire [4:0] id_ex_instr_bits_15_11
    );
    
    wire [31:0] sign_ext_internal,
        readdat1_internal,
        readdat2_internal;
    wire [1:0] wb_internal;
    wire [2:0] mem_internal;
    wire [3:0] ex_internal;
    
    wire [5:0] opcode = if_id_instr[31:26];
    wire [4:0] rs = if_id_instr[25:21];
    wire [4:0] rt = if_id_instr[20:16];
    wire [4:0] rd = if_id_instr[15:11];
    
    sign_extend se0(
        .immediate(if_id_instr[15:0]),
        .extended(sign_ext_internal)
    );
    
    reg_file rf0(
        .clk(clk),
        .rst(rst),
        .regwrite(wb_reg_write),
        .rs(rs),
        .rt(rt),
        .rd(wb_write_reg_location),
        .writedata(mem_wb_write_data),
        .A_readdat1(readdat1_internal),
        .B_readdat2(readdat2_internal)
    );
    
    control c0(
        .clk(clk),
        .rst(rst),
        .opcode(opcode),
        .wb(wb_internal),
        .mem(mem_internal),
        .ex(ex_internal)
    );
    
    ide_latch idel0(
        .clk(clk),
        .rst(rst),
        .ctl_wb(wb_internal),
        .ctl_mem(mem_internal),
        .ctl_ex(ex_internal),
        .npc(if_id_npc),
        .readdat1(readdat1_internal),
        .readdat2(readdat2_internal),
        .sign_ext(sign_ext_internal),
        .instr_bits_20_16(rt),
        .instr_bits_15_11(rd),
        .wb_out(id_ex_wb),
        .mem_out(id_ex_mem),
        .ctl_out(id_ex_execute),
        .npc_out(id_ex_npc),
        .readdat1_out(id_ex_readdat1),
        .readdat2_out(id_ex_readdat2),
        .sign_ext_out(id_ex_sign_ext),
        .instr_bits_20_16_out(id_ex_instr_bits_20_16),
        .instr_bits_15_11_out(id_ex_instr_bits_15_11)
    );
    
endmodule
