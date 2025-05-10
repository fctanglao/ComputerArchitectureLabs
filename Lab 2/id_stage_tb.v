`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2025 08:24:15 PM
// Design Name: 
// Module Name: id_stage_tb
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


module id_stage_tb(

    );
    
    reg clk;
    reg reset;
    reg regwrite;
    reg [5:0] opcode;
    reg [31:0] id_npc;
    reg [4:0] rs;
    reg [4:0] rt;
    reg [4:0] rd;
    reg [31:0] writedata;
    reg [15:0] id_instr;
    reg [4:0] instr_2016;
    reg [4:0] instr_1511;
    
    wire [1:0] ex_ctlwb_out;
    wire [2:0] ex_ctlm_out;
    wire regdst;
    wire [1:0] aluop;
    wire alusrc;
    wire [31:0] add_in1;
    wire [31:0] A;
    wire [31:0] ex_readdat2;
    wire [31:0] add_in2;
    wire [5:0] funct;
    wire [4:0] ex_b;
    wire [4:0] ex_a;

    id_stage dut(
    .clk(clk),
    .reset(reset),
    .regwrite(regwrite),
    .opcode(opcode),
    .id_npc(id_npc),
    .rs(rs),
    .rt(rt),
    .rd(rd),
    .writedata(writedata),
    .id_instr(id_instr),
    .instr_2016(instr_2016),
    .instr_1511(instr_1511),
    .ex_ctlwb_out(ex_ctlwb_out),
    .ex_ctlm_out(ex_ctlm_out),
    .regdst(regdst),
    .aluop(aluop),
    .alusrc(alusrc),
    .add_in1(add_in1),
    .A(A),
    .ex_readdat2(ex_readdat2),
    .add_in2(add_in2),
    .funct(funct),
    .ex_b(ex_b),
    .ex_a(ex_a)
    );

    initial 
    begin
        clk = 0;
        forever #1 clk = ~clk;
    end 
    
    initial 
    begin
        reset = 1; 
        regwrite = 0;
        rd = 5'd2;
        writedata = 32'h64;
        id_npc = 32'h0000001;
        // 32'h00a41020 = 32'b00000000101001000001000000100000
        opcode = 6'b000000;
        rs = 5'b00101;
        rt = 5'b00100;
        id_instr = 16'b0001000000100000;
        instr_2016 = 5'b00100;
        instr_1511 = 5'b00010;

        #2

        reset = 0;
        
        #2
        
        id_npc = 32'h0000002;
        // 32'h10000008 = 32'b00010000000000000000000000001000
        opcode = 6'b000100;
        rs = 5'b00000;
        rt = 5'b00000;
        id_instr = 16'b0000000000001000;
        instr_2016 = 5'b00000;
        instr_1511 = 5'b00000;
        
        #2

        id_npc = 32'h0000003;
        // 32'h8c820002 = 32'b10001100100000100000000000000010
        opcode = 6'b100011;
        rs = 5'b00100;
        rt = 5'b00010;
        id_instr = 16'b0000000000000010;
        instr_2016 = 5'b00010;
        instr_1511 = 5'b00000;

        #2

        id_npc = 32'h0000004;
        // 32'hac820002 = 32'b10101100100000100000000000000010
        opcode = 6'b101011;
        rs = 5'b00100;
        rt = 5'b00010;
        id_instr = 16'b0000000000000010;
        instr_2016 = 5'b00010;
        instr_1511 = 5'b00000;
        
        #2

        regwrite = 1;
        id_npc = 32'h0000005;
        
        #2
        
        regwrite = 0;
        id_npc = 32'h0000006;
        // 32'h00421020 = 32'b00000000010000100001000000100000
        opcode = 6'b000000;
        rs = 5'b00010;
        rt = 5'b00010;
        id_instr = 16'b0001000000100000;
        instr_2016 = 5'b00010;
        instr_1511 = 5'b00010;
        
        #2 
        #2
        
        $display("Decode Complete");
        $finish;
    end
    
endmodule
