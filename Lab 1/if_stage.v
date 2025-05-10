`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 05:09:36 PM
// Design Name: 
// Module Name: if_stage
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


module if_stage(
    input wire clk,
    input wire reset,
    input wire pcsrc,
    input wire [31:0] if_a,     
    output wire [31:0] id_npc, 
    
    // breaking down instrout for future use
    // output wire [31:0] instrout,
    output wire [5:0] opcode,
    output wire [4:0] rs,
    output wire [4:0] rt,
    output wire [15:0] id_instr,
    output wire [4:0] instr_2016,
    output wire [4:0] instr_1511
    );
    
    // program counter output
    wire [31:0]addr_pcin;
	
    // instruction memory output
    wire [31:0]if_instr;

    // mux output 
    wire [31:0]if_npc;  
    
    // adder output
    wire [31:0]if_b_npc;

    program_counter pc0(
    .clk(clk),
    .reset(reset),
    .npc(if_npc),
    .pc(addr_pcin)
    );

    instruction_memory im0(
    .addr(addr_pcin),
    .data(if_instr)
    );
    
    mux_2x1_32bit m0(
    .a(if_a),
    .b(if_b_npc),
    .sel(pcsrc),
    .y(if_npc)
    );    
     
    adder a0(
    .pcin(addr_pcin),
    .pcout(if_b_npc)
    );

    if_id_latch if_id_pr0(
    .clk(clk),
    .reset(reset),
    .npc(if_b_npc),
    .instr(if_instr),
    .npcout(id_npc),
    .opcode(opcode),
    .rs(rs),
    .rt(rt),
    .id_instr(id_instr),
    .instr_2016(instr_2016),
    .instr_1511(instr_1511)
    );

endmodule
