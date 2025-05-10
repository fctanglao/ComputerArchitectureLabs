`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2025 03:19:31 PM
// Design Name: 
// Module Name: mem_stage
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


module mem_stage(
    input wire clk,
    input wire [1:0] control_wb_in,
    input wire memread,
    input wire memwrite,
    input wire branch,
    input wire zero,
    input wire [31:0] address,
    input wire [31:0] write_data,
    input wire [4:0] write_reg_in,  
    
    // breaking down mem_control_wb for future use
    // output wire mem_control_wb,
    output wire regwrite,
    output wire memtoreg,
    
    output wire [31:0] read_data,
    output wire [31:0] mem_alu_result,
    output wire [4:0] rd
    );
    
    // and gate output
    wire pcsrc;
    
    // data memory output
    wire [31:0] read_data_in;
    
    and_gate ag0(
    .m_ctlout(branch),
    .zero(zero),
    .pcsrc(pcsrc)
    );
    
    data_memory dm0(
    .clk(clk),
    .memread(memread),
    .memwrite(memwrite),
    .address(address),
    .write_data(write_data),
    .read_data(read_data_in)  
    );
    
    mem_wb_latch mem_wb_pr0(
    .clk(clk),
    .control_wb_in(control_wb_in),
    .read_data_in(read_data_in),     
    .alu_result_in(address),
    .write_reg_in(write_reg_in),
    .regwrite(regwrite),
    .memtoreg(memtoreg),
    .read_data(read_data),    
    .mem_alu_result(mem_alu_result),
    .mem_write_reg(rd)
    );
    
endmodule
