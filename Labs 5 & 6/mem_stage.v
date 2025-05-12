`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2025 03:19:31 PM
// Design Name: 
// Module Name: mem_stage
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


module mem_stage(
    input wire clk,
    input wire reset,
    input wire [1:0] control_wb_in,
    input wire [2:0] m_ctlout,
    input wire [31:0] if_a,
    input wire zero,
    input wire [31:0] address,
    input wire [31:0] write_data,
    input wire [4:0] write_reg_in, 
    output wire pcsrc, 
    output reg [1:0] mem_control_wb,
    output reg [31:0] read_data,
    output reg [31:0] mem_alu_result,
    output reg [4:0] rd
    );
    
    // breaking down m_ctlout
    wire memread, memwrite, branch;
    assign memread = m_ctlout[1];
    assign memwrite = m_ctlout[0];
    assign branch = m_ctlout[2];
    
    // data memory output
    wire [31:0] read_data_in;
    
    and_gate ag0(
    .m_ctlout(branch),
    .zero(zero),
    .pcsrc(pcsrc)
    );
    
    data_memory dm0(
    .clk(clk),
    .memread(memread),
    .memwrite(memwrite),
    .address(address),
    .write_data(write_data),
    .read_data(read_data_in)  
    );
    
    // mem/wb latch
    initial 
    begin
        read_data = 32'b0;
        mem_alu_result = 32'b0;
        rd = 5'b0;
        mem_control_wb = 2'b0;
    end
    
    always @(posedge clk or posedge reset) 
    begin
        if (reset) 
        begin
            read_data <= 32'b0;
            mem_alu_result <= 32'b0;
            rd <= 5'b0;
            mem_control_wb <= 2'b0;
        end
        else 
        begin
            read_data <= read_data_in;
            mem_alu_result <= address;
            rd <= write_reg_in;
            mem_control_wb <= control_wb_in;
        end
    end
    
endmodule
