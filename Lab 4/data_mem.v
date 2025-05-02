`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2025 04:13:50 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem(
    input wire clk,
    input wire [31:0] address,
    input wire [31:0] write_data,
    input wire mem_read,
    input wire mem_write,
    output reg [31:0] read_data
    );
    
    reg [31:0] MEM [0:255];
    
    initial 
    begin
        $readmemb("data.mem", MEM);
        for (integer i = 0; i < 6; i = i + 1)
            $display("Memory[%0d] = %h", i, MEM[i]);
    end
    
    always @(*) 
    begin
        if (mem_read)
            read_data = MEM[address[9:2]];
        else
            read_data = 32'b0;
    end
    
    always @(posedge clk) 
    begin
        if (mem_write)
            MEM[address[9:2]] = write_data;
    end
    
endmodule
