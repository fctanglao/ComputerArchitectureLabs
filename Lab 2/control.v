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
    input wire reset,
    input wire [5:0] opcode,
    output reg [1:0] wb,
    output reg [2:0] m,
    output reg [3:0] ex
    );
    
    // MIPS opcode definitions
    parameter RTYPE = 6'b000000;
    parameter LW = 6'b100011;
    parameter SW = 6'b101011;
    parameter BEQ = 6'b000100;
    parameter NOP = 6'b100000;
    
    initial 
    begin
        wb = 2'd0;
        m = 3'd0;
        ex = 4'd0;
    end
    
    always @(posedge clk) 
    begin
        if (reset) 
        begin
            wb = 2'd0;
            m = 3'd0;
            ex = 4'd0;
        end
        else 
        begin
            case (opcode)
                RTYPE: 
                begin
                    wb  <= 2'b10;
                    m <= 3'b000;
                    ex  <= 4'b1100;
                end
    
                LW: 
                begin
                    wb <= 2'b11;
                    m <= 3'b100;
                    ex <= 4'b0001;
                end
    
                SW: 
                begin
                    wb <= 2'b00;
                    m <= 3'b010;
                    ex <= 4'b0001;
                end
    
                BEQ: 
                begin
                    wb <= 2'b00;
                    m <= 3'b001;
                    ex <= 4'b0010;
                end
    
                default: 
                begin
                    $display("Opcode not recognized.");
                    wb <= 2'd0;
                    m <= 3'd0;
                    ex <= 4'd0;
                end
            endcase
        end
    end
    
endmodule
