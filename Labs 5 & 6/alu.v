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
    
    // alu operations
    parameter ADD = 3'b010;
    parameter SUB = 3'b110;
    parameter AND = 3'b000;
    parameter OR = 3'b001;
    parameter SLT = 3'b111;
    
    always @(*) begin
        case (control)
            ADD: result = A + B;
            SUB: result = A - B;
            AND: result = A & B;
            OR: result = A | B;
            SLT: result = (A < B) ? 32'd1 : 32'd0;
            default: result = 32'bx;
        endcase
    end
    
    assign zero = (result == 32'b0);
    
endmodule
