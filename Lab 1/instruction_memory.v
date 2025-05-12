`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 04:39:17 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
    input wire [31:0] addr,
    output wire [31:0] data
    );

    reg [31:0] mem[0:127];

    initial 
    begin
        $readmemh("if_instructions.txt", mem);
    end

    assign data = mem[addr[8:2]];
    
endmodule
