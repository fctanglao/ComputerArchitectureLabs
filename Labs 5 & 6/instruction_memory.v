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
    output reg [31:0] data
    );
    
    reg [31:0] mem[0:127];

    initial 
    begin
        $readmemb("risc.txt", mem);
        for (integer i = 0; i < 24; i = i + 1)
             $display("IMEM[%0d] = %h", i, mem[i]);
    end
    
    always @(*) 
    begin
        data = mem[ addr >> 2 ];
    end
    
endmodule
