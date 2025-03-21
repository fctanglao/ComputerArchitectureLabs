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
    input  wire clk,
    input  wire reset,
    input  wire ex_mem_pcrsrc,  
    input  wire [31:0] ex_mem_npc,     
    output wire [31:0] IF_ID_npc,      
    output wire [31:0] IF_ID_instr     
    );

    wire [31:0] pc;         
    wire [31:0] pc_plus_1;  
    wire [31:0] npc;        
    wire [31:0] instr;      

    program_counter PC (
    .clk(clk),
    .reset(reset),
    .npc(npc),
    .pc(pc)
    );

    adder add_pc(
    .pcin(pc),
    .pcout(pc_plus_1)
    );

    mux my_mux(
    .a(ex_mem_npc),
    .b(pc_plus_1),
    .sel(ex_mem_pcrsrc),
    .y(npc)
    );

    instruction_memory IM(
    .addr(pc),
    .data(instr)
    );

    if_id_latch IF_ID (
    .clk(clk),
    .reset(reset),
    .npc(npc),
    .instr(instr),
    .npcout(IF_ID_npc),
    .instrout(IF_ID_instr)
    );

endmodule
