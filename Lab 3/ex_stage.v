`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2025 01:42:11 PM
// Design Name: 
// Module Name: ex_stage
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


module ex_stage(
    input wire clk,
    input wire [1:0] ex_ctlwb_out,
    input wire [2:0] ex_ctlm_out,
    input wire regdst,
    input wire [1:0] aluop,
    input wire alusrc,
    input wire [31:0] add_in1,
    input wire [31:0] A,
    input wire [31:0] ex_readdat2,
    input wire [31:0] add_in2,
    input wire [5:0] funct,
    input wire [4:0] ex_b,
    input wire [4:0] ex_a,
    
    output wire [1:0] control_wb_in,
    
    // breaking down m_ctlout for future use
    // output wire [2:0] m_ctlout,
    output wire memread,
    output wire memwrite,
    output wire branch,
    
    output wire [31:0] if_a,
    output wire zero,
    output wire [31:0] address,
    output wire [31:0] write_data,
    output wire [4:0] write_reg_in
    );
    
    // 2x1 5-bit mux output
    wire [4:0] muxout;
    
    // 2x1 32-bit mux output
    wire [31:0] B;
    
    // alu outputs
    wire aluzero;
    wire [31:0] result;
    
    // alu control unit output
    wire [2:0] control;
    
    // adder output
    wire [31:0] adder_out;
    
    mux_2x1_5bit bm0(
    .a(ex_a),
    .b(ex_b),
    .sel(regdst),
    .y(muxout)
    );
    
    mux_2x1_32bit am0(
    .a(add_in2),
    .b(ex_readdat2),
    .sel(alusrc),
    .y(B)
    );
    
    alu_control ac0(
    .funct(funct),
    .alu_op(aluop),
    .select(control)
    );
    
    alu alu0(
    .A(A),
    .B(B),
    .control(control),
    .zero(aluzero),
    .result(result)
    );
    
    adder a0(
    .add_in1(add_in1),
    .add_in2(add_in2),
    .add_out(adder_out)
    );
    
    ex_mem_latch ex_mem_pr0(
    .clk(clk),
    .ctlwb_out(ex_ctlwb_out),
    .ctlm_out(ex_ctlm_out),
    .adder_out(adder_out),
    .aluzero(aluzero),
    .aluout(result),
    .readdat2(ex_readdat2),
    .muxout(muxout),
    .wb_ctlout(control_wb_in),
    .memread(memread),
    .memwrite(memwrite),
    .branch(branch),
    .add_result(if_a),
    .zero(zero),
    .alu_result(address),
    .rdata2out(write_data),
    .five_bit_muxout(write_reg_in)
    );
    
endmodule
