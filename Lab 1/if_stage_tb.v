`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 05:08:44 PM
// Design Name: 
// Module Name: if_stage_tb
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


module if_stage_tb(

    );
    
    reg clk;
    reg reset;
    reg pcsrc;         
    reg [31:0] if_a;
    
    wire [31:0] id_npc;
    wire [5:0] opcode;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [15:0] id_instr;
    wire [4:0] instr_2016;
    wire [4:0] instr_1511;     

    if_stage dut(
        .clk(clk),
        .reset(reset),
        .pcsrc(pcsrc),
        .if_a(if_a),
        .id_npc(id_npc),
        .opcode(opcode),
        .rs(rs),
        .rt(rt),
        .id_instr(id_instr),
        .instr_2016(instr_2016),
        .instr_1511(instr_1511)
    );

    initial clk = 0;
    always #1 clk = ~clk;

    initial 
    begin
        reset = 1;
        pcsrc = 0;
        if_a = 32'hFFFFFFFF;

        #5;
        
        reset = 0; 
 
        #10;
        
        #20;
        
        pcsrc = 1;
        if_a = 32'h00000000;

        #50;
        
        pcsrc = 0;

        #200;
        
        $finish;
    end
    
endmodule
