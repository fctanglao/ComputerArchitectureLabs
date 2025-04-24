`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2025 04:14:02 PM
// Design Name: 
// Module Name: latch
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


module latch(
    input clk,
    input [1:0] ctlwb_in,
    input [1:0] ctlm_in,
    input [31:0] adder_in,
    input [31:0] alu_result_in,
    input [31:0] rdata2_in,
    input [4:0] muxout_in,
    input alu_zero_in,
    output reg [1:0] ctlwb_out,
    output reg [1:0] ctlm_out,
    output reg [31:0] adder_out,
    output reg [31:0] alu_result_out,
    output reg [31:0] rdata2_out,
    output reg [4:0] muxout_out,
    output reg alu_zero_out
    );
    
    always @(posedge clk) begin
        ctlwb_out <= ctlwb_in;
        ctlm_out <= ctlm_in;
        adder_out <= adder_in;
        alu_result_out <= alu_result_in;
        rdata2_out <= rdata2_in;
        muxout_out <= muxout_in;
        alu_zero_out <= alu_zero_in;
    end
    
endmodule
