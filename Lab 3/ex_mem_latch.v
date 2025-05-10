`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2025 01:38:55 PM
// Design Name: 
// Module Name: ex_mem_latch
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


module ex_mem_latch(
    input wire clk,
    input wire [1:0] ctlwb_out,
    input wire [2:0] ctlm_out,
    input wire [31:0] adder_out,
    input wire aluzero,
    input wire [31:0] aluout,
    input wire [31:0] readdat2,
    input wire [4:0] muxout,
    output reg [1:0] wb_ctlout,
    
    // breaking down m_ctlout for future use
    // output reg [2:0] m_ctlout,
    output reg memread,
    output reg memwrite,
    output reg branch,
    
    output reg [31:0] add_result,
    output reg zero,
    output reg [31:0] alu_result,
    output reg [31:0] rdata2out,
    output reg [4:0] five_bit_muxout
    );
    
    always @(posedge clk) 
    begin
        wb_ctlout <= ctlwb_out;
        memread <= ctlm_out[2];
        memwrite <= ctlm_out[1];
        branch <= ctlm_out[0];
        add_result <= adder_out;
        zero <= aluzero;
        alu_result <= aluout;
        rdata2out <= readdat2;
        five_bit_muxout <= muxout;
    end
    
endmodule
