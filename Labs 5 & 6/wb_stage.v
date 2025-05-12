`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2025 12:13:12 AM
// Design Name: 
// Module Name: wb_stage
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


module wb_stage(
    input wire [1:0] mem_control_wb,
    input wire [31:0] read_data,
    input wire [31:0] mem_alu_result,
    output wire regwrite,
    output wire [31:0] writedata
    );
    
    wire memtoreg;
    assign regwrite = mem_control_wb[1];
    assign memtoreg = mem_control_wb[0];
    
    mux_2x1_32bit m0(
    .a(read_data),
    .b(mem_alu_result),
    .sel(memtoreg),
    .y(writedata)
    ); 
    
endmodule
