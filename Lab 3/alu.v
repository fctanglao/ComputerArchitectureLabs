`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2025 04:14:02 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [2:0] control,
    output wire zero,
    output reg [31:0] result
    );
    
    always @(*) 
    begin
        case(control)
            3'b000: result = A & B;
            3'b001: result = A | B;
            3'b010: result = A + B;
            3'b110: result = A - B;
            3'b111: result = (A < B) ? 1 : 0;
            default: result = 32'bx;
        endcase
    end
    
    assign zero = (result == 0);
    
endmodule
