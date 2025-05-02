`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2025 04:48:26 PM
// Design Name: 
// Module Name: memory
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


module memory(
    input wire clk,
    input wire [31:0] alu_result,     
    input wire [31:0] write_data,     
    input wire [4:0] write_reg,       
    input wire [1:0] wb_ctrl,      
    input wire mem_write,             
    input wire mem_read,              
    input wire branch,               
    input wire zero,                 
    output wire [31:0] read_data,     
    output wire [31:0] alu_result_out, 
    output wire [4:0] write_reg_out,  
    output wire [1:0] wb_ctrl_out, 
    output wire pc_src                
    );
    
    wire [31:0] mem_data;
    
    and_gate and0(
        .m_ctl_out(branch),
        .zero(zero),
        .pc_src(pc_src)
    );
    
    data_mem dm(
        .clk(clk),
        .address(alu_result),
        .write_data(write_data),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .read_data(mem_data)  
    );
    
    mem_wb_latch mwl(
        .clk(clk),
        .control_wb_in(wb_ctrl),
        .read_data_in(mem_data),     
        .alu_result_in(alu_result),
        .write_reg_in(write_reg),
        .mem_control_wb(wb_ctrl_out),
        .mem_read_data(read_data),    
        .mem_alu_result(alu_result_out),
        .mem_write_reg(write_reg_out)
    );
    
endmodule
