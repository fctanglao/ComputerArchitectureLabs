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
    input [31:0] a,
    input [31:0] b,
    input [2:0] control,
    output reg [31:0] result,
    output zero
    );
    
    always @(*) begin
        case(control)
            3'b000: result = a & b;        // AND
            3'b001: result = a | b;        // OR
            3'b010: result = a + b;        // ADD
            3'b110: result = a - b;        // SUB
            3'b111: result = (a < b) ? 1 : 0; // SLT
            default: result = 32'bx;       // Unknown operation
        endcase
    end
    
    assign zero = (result == 0);
    
endmodule
