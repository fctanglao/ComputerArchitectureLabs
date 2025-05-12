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
    
    reg [31:0] mem[0:255];
    
    initial 
    begin
        // clear all memory
        for (integer i = 0; i < 256; i = i + 1)
             mem[i] = 32'b0;
        
        // manually load memory (data.txt)    
        mem[0] = 32'h00000000; // Data 0
        mem[1] = 32'h00000001; // Data 1
        mem[2] = 32'h00000002; // Data 2
        mem[3] = 32'h00000003; // Data 3
        mem[4] = 32'h00000004; // Data 4
        mem[5] = 32'h00000005; // Data 5
        
        for (integer i = 0; i < 6; i = i + 1)
             $display("DMEM[%0d] = %h", i, mem[i]);
        
        $readmemb("data.txt", mem);
        for (integer i = 0; i < 6; i = i + 1)
             $display("DMEM[%0d] = %h", i, mem[i]);
    end
    
    always @(*) 
    begin
        if (memread) 
        begin
            read_data = mem[address >> 2];
        end
        else 
        begin
            read_data = 32'b0;
        end
    end
    
    always @(posedge clk) 
    begin
        if (memwrite) 
        begin
            mem[address >> 2] <= write_data;
        end
    end
    
endmodule
