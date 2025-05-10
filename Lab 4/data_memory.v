`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2025 03:21:47 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input wire clk,
    input wire memread,
    input wire memwrite,
    input wire [31:0] address,
    input wire [31:0] write_data,
    output reg [31:0] read_data
    );
    
    reg [31:0] mem [0:255];
    
    initial 
    begin
        $readmemb("mem_instructions.txt", mem);
        for (integer i = 0; i < 6; i = i + 1)
            $display(mem[i]);
    end
    
    always @(*) 
    begin
        if (memread)
            read_data = mem[address[9:2]];
        else
            read_data = 32'b0;
    end
    
    always @(posedge clk) 
    begin
        if (memwrite)
            mem[address[9:2]] = write_data;
    end
    
endmodule
