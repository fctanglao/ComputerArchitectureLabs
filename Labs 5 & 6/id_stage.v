`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2025 08:22:16 PM
// Design Name: 
// Module Name: id_stage
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


module id_stage(
    input wire clk,
    input wire reset,
    input wire regwrite,
    input wire [31:0] id_npc,
    input wire [31:0] instrout,
    input wire [4:0] rd,
    input wire [31:0] writedata,
    output reg [1:0] ex_ctlwb_out,
    output reg [2:0] ex_ctlm_out,
    output reg [3:0] ex_ctlout,
    output reg [31:0] add_in1,
    output reg [31:0] A,
    output reg [31:0] ex_readdat2,
    output reg [31:0] s_extendout,
    output reg [5:0] funct,
    output reg [4:0] ex_b,
    output reg [4:0] ex_a
    );
    
    // control unit output
    wire [8:0] ctl_out;
    
    // sign extend output
    wire [31:0] signext_out;
    
    // register file outputs
    wire [31:0] id_readdat1;
    wire [31:0] id_readdat2;
    
    sign_extend se0(
    .immediate(instrout[15:0]),
    .extended(signext_out)
    );
    
    control c0(
    .opcode(instrout[31:26]),
    .ctl_out(ctl_out)
    );
    
    reg_file rf0(
    .clk(clk),
    .reset(reset),
    .regwrite(regwrite),
    .rs(instrout[25:21]),
    .rt(instrout[20:16]),
    .rd(rd),
    .writedata(writedata),
    .A(id_readdat1),
    .B(id_readdat2)
    );
    
    // id/ex latch
    always @(posedge clk or posedge reset) 
    begin
        if (reset) 
        begin
            add_in1 <= 32'b0;
            A <= 32'b0;
            ex_readdat2 <= 32'b0;
            s_extendout <= 32'b0;
            ex_b <= 5'b0;
            ex_a <= 5'b0;
            ex_ctlwb_out <= 2'b0;
            ex_ctlm_out <= 3'b0;
            ex_ctlout <= 4'b0;
            funct <= 6'b0;
        end
        else 
        begin
            add_in1 <= id_npc;
            A <= id_readdat1;
            ex_readdat2 <= id_readdat2;
            s_extendout <= signext_out;
            ex_b <= instrout[20:16];
            ex_a <= instrout[15:11];
            ex_ctlwb_out <= ctl_out[8:7]; // regwrite, memtoreg
            ex_ctlm_out <= ctl_out[6:4]; // branch, memread, memwrite
            ex_ctlout <= ctl_out[3:0]; // regdst, aluop, alusrc
            funct <= instrout[5:0];
        end
    end
    
endmodule
