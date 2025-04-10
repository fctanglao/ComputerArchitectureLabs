`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2025 04:07:25 PM
// Design Name: 
// Module Name: control
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


module control(
    input wire clk,
    input wire rst,
    input wire [5:0] opcode,
    output reg [1:0] wb,
    output reg [2:0] mem,
    output reg [3:0] ex
    );
    
    // based on MIPS opcode definitions
    parameter RTYPE = 6'b000000;
    parameter LW    = 6'b100011;
    parameter SW    = 6'b101011;
    parameter BEQ   = 6'b000100;
    parameter NOP   = 6'b100000;
    
    // default values
    initial begin
        wb  = 2'd0;
        mem = 3'd0;
        ex  = 4'd0;
    end
    
    always @(posedge clk) begin
        if (rst) begin
            wb  = 2'd0;
            mem = 3'd0;
            ex  = 4'd0;
        end
        else begin
            case (opcode)
                RTYPE: begin
                    wb  <= 2'b10;  // RegWrite=1, MemtoReg=0
                    mem <= 3'b000; // MemRead=0, MemWrite=0, Branch=0
                    ex  <= 4'b1100; // RegDst=1, ALUOp=10, ALUSrc=0
                end
    
                LW: begin
                    wb  <= 2'b11;  // RegWrite=1, MemtoReg=1
                    mem <= 3'b100; // MemRead=1, MemWrite=0, Branch=0
                    ex  <= 4'b0001; // RegDst=0, ALUOp=00, ALUSrc=1
                end
    
                SW: begin
                    wb  <= 2'b00;  // RegWrite=0, MemtoReg=0
                    mem <= 3'b010; // MemRead=0, MemWrite=1, Branch=0
                    ex  <= 4'b0001; // RegDst=0, ALUOp=00, ALUSrc=1
                end
    
                BEQ: begin
                    wb  <= 2'b00;  // RegWrite=0, MemtoReg=0
                    mem <= 3'b001; // MemRead=0, MemWrite=0, Branch=1
                    ex  <= 4'b0010; // RegDst=0, ALUOp=01, ALUSrc=0
                end
    
                default: begin // NOP
                    $display("Opcode not recognized.");
                    wb  = 2'd0;
                    mem = 3'd0;
                    ex  = 4'd0;
                end
            endcase
        end
    end
    
endmodule
