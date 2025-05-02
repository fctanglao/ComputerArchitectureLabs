`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2025 04:13:50 PM
// Design Name: 
// Module Name: mem_wb_latch
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


module mem_wb_latch(
    input wire clk,
    input wire [1:0] control_wb_in,
    input wire [31:0] read_data_in,
    input wire [31:0] alu_result_in,
    input wire [4:0] write_reg_in,
    output reg [1:0] mem_control_wb,
    output reg [31:0] mem_read_data,
    output reg [31:0] mem_alu_result,
    output reg [4:0] mem_write_reg
    );
    
    initial begin
        mem_control_wb = 2'b00;
        mem_read_data = 32'h00000000;
        mem_alu_result = 32'h00000000;
        mem_write_reg = 5'h00;
    end

    always @(posedge clk) begin
        mem_control_wb <= control_wb_in;
        mem_read_data <= read_data_in;
        mem_alu_result <= alu_result_in;
        mem_write_reg <= write_reg_in;
    end
    
endmodule
