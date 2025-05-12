`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2025 04:14:02 PM
// Design Name: 
// Module Name: alu_control
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


module alu_control(
    input wire [5:0] funct,
    input wire [1:0] alu_op,
    output reg [2:0] select
    );
    
    // alu control codes
    parameter ADD = 3'b010;
    parameter SUB = 3'b110;
    parameter AND = 3'b000;
    parameter OR = 3'b001;
    parameter SLT = 3'b111;
    
    // function codes
    parameter FUNCT_ADD = 6'b100000;
    parameter FUNCT_SUB = 6'b100010;
    parameter FUNCT_AND = 6'b100100;
    parameter FUNCT_OR = 6'b100101;
    parameter FUNCT_SLT = 6'b101010;
    
    always @(*) 
    begin
        case (alu_op)
            2'b00: select = ADD; // LW/SW
            2'b01: select = SUB; // BEQ
            2'b10: begin // R-TYPE
                case (funct)
                    FUNCT_ADD: select = ADD;
                    FUNCT_SUB: select = SUB;
                    FUNCT_AND: select = AND;
                    FUNCT_OR: select = OR;
                    FUNCT_SLT: select = SLT;
                    default: select = 3'bxxx;
                endcase
            end
            default: select = 3'bxxx;
        endcase
    end
    
endmodule
