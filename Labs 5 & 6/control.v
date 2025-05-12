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
    input wire [5:0] opcode,
    // [8:7] wb, [6:4] m, [3:0] ex: regwrite, memtoreg, branch, memread, memwrite, regdst, [1:0] aluop, alusrc
    output reg [8:0] ctl_out
    );
    
    // MIPS opcode definitions
    parameter RTYPE = 6'b000000; // r-type instruction
    parameter LW = 6'b100011; // load word
    parameter SW = 6'b101011; // store word
    parameter BEQ = 6'b000100; // branch on equal
    parameter NOP = 6'b100000; // no operation
    
    always @(*) 
    begin
        case (opcode)
            RTYPE: 
            begin
                ctl_out = 9'b100001100;
            end

            LW: 
            begin
                ctl_out = 9'b110100001;
            end

            SW: 
            begin
                ctl_out = 9'b001010001;
            end

            BEQ: 
            begin
                ctl_out = 9'b001000010;
            end
            
            NOP:
            begin
                ctl_out = 9'b000000000;
            end

            default: 
            begin
                ctl_out = 9'b000000000;
            end
        endcase
    end
    
endmodule
