`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2025 04:14:02 PM
// Design Name: 
// Module Name: final_ex_stage
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


module final_ex_stage(
    input clk,
    input [1:0] ctlwb_in, ctlm_in,
    input [31:0] npc, rdata1, rdata2, s_extend,
    input [4:0] instr_2016, instr_1511,
    input [1:0] alu_op,
    input [5:0] funct,
    input alusrc, regdst,
    output [1:0] ctlwb_out, ctlm_out,
    output [31:0] adder_out, alu_result_out, rdata2_out,
    output [4:0] muxout_out
    );
    
    wire [31:0] adder_result;
    wire [31:0] alu_in2;
    wire [2:0] alu_control_out;
    wire [31:0] alu_result;
    wire alu_zero;
    wire [4:0] regdst_muxout;

    adder adder_inst(
    .a(npc),
    .b(s_extend),
    .result(adder_result)
    );
    
    mux_2x1_32bit alusrc_mux(
    .a(s_extend),
    .b(rdata2),
    .sel(alusrc),
    .y(alu_in2)
    );
    
    alu_control alu_ctrl_inst(
    .alu_op(alu_op),
    .funct(funct),
    .select(alu_control_out)
    );
    
    alu alu_inst(
    .a(rdata1),
    .b(alu_in2),
    .control(alu_control_out),
    .result(alu_result),
    .zero(alu_zero)
    );
    
    mux_2x1_5bit regdst_mux(
    .a(instr_1511),
    .b(instr_2016),
    .sel(regdst),
    .y(regdst_muxout)
    );
    
    latch ex_mem_reg(
    .clk(clk),
    .ctlwb_in(ctlwb_in),
    .ctlm_in(ctlm_in),
    .adder_in(adder_result),
    .alu_result_in(alu_result),
    .rdata2_in(rdata2),
    .muxout_in(regdst_muxout),
    .alu_zero_in(alu_zero),
    .ctlwb_out(ctlwb_out),
    .ctlm_out(ctlm_out),
    .adder_out(adder_out),
    .alu_result_out(alu_result_out),
    .rdata2_out(rdata2_out),
    .muxout_out(muxout_out),
    .alu_zero_out()
    );
    
endmodule
