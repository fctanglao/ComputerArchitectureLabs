`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2025 12:22:57 AM
// Design Name: 
// Module Name: mips_datapath
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


module mips_datapath(
    input  wire clk,
    input  wire reset
    );

    // if/id outputs
    wire [31:0] id_npc;
    wire [31:0] instrout;

    // id/ex outputs
    wire [1:0] ex_ctlwb_out;
    wire [2:0] ex_ctlm_out;
    wire [3:0] ex_ctlout;
    wire [31:0] add_in1;
    wire [31:0] A;
    wire [31:0] ex_readdat2;
    wire [31:0] s_extendout;
    wire [5:0] funct;
    wire [4:0] ex_b;
    wire [4:0] ex_a;

    // ex/mem outputs
    wire [1:0] control_wb_in;
    wire [2:0] m_ctlout;
    wire [31:0] if_a;
    wire zero;
    wire [31:0] address;
    wire [31:0] write_data;
    wire [4:0] write_reg_in;

    // mem/wb outputs
    wire [1:0] mem_control_wb;
    wire regwrite;
    wire [31:0] read_data;
    wire [31:0] mem_alu_result;
    wire [4:0] rd;

    // wb output
    wire [31:0] writedata;

    // branch decision
    wire pcsrc;
    
    // if stage
    if_stage if0(
    .clk(clk),
    .reset(reset),
    .pcsrc(pcsrc),
    .if_a(if_a),
    .id_npc(id_npc),
    .instrout(instrout)
    );
    
    // id stage
    id_stage id0(
    .clk(clk),
    .reset(reset),
    .regwrite(regwrite),
    .id_npc(id_npc),
    .instrout(instrout),
    .rd(rd),
    .writedata(writedata),
    .ex_ctlwb_out(ex_ctlwb_out),
    .ex_ctlm_out(ex_ctlm_out),
    .ex_ctlout(ex_ctlout),
    .add_in1(add_in1),
    .A(A),
    .ex_readdat2(ex_readdat2),
    .s_extendout(s_extendout),
    .funct(funct),
    .ex_b(ex_b),
    .ex_a(ex_a)
    );
    
    // ex stage
    ex_stage ex0(
    .clk(clk),
    .reset(reset),
    .ex_ctlwb_out(ex_ctlwb_out),
    .ex_ctlm_out(ex_ctlm_out),
    .ex_ctlout(ex_ctlout),
    .add_in1(add_in1),
    .A(A),
    .ex_readdat2(ex_readdat2),
    .s_extendout(s_extendout),
    .funct(funct),
    .ex_b(ex_b),
    .ex_a(ex_a),
    .control_wb_in(control_wb_in),
    .m_ctlout(m_ctlout),
    .if_a(if_a),
    .zero(zero),
    .address(address),
    .write_data(write_data),
    .write_reg_in(write_reg_in)
    );
    
    // mem stage
    mem_stage mem0(
    .clk(clk),
    .reset(reset),
    .control_wb_in(control_wb_in),
    .m_ctlout(m_ctlout),
    .if_a(if_a),
    .zero(zero),
    .address(address),
    .write_data(write_data),
    .write_reg_in(write_reg_in),
    .pcsrc(pcsrc),
    .mem_control_wb(mem_control_wb),
    .read_data(read_data),
    .mem_alu_result(mem_alu_result),
    .rd(rd)
    );
    
    // wb stage
    wb_stage wb0(
    .mem_control_wb(mem_control_wb),
    .read_data(read_data),
    .mem_alu_result(mem_alu_result),
    .regwrite(regwrite),
    .writedata(writedata)
    );

endmodule
