`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 05:08:44 PM
// Design Name: 
// Module Name: if_stage_tb
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


module if_stage_tb(

    );
    
    reg clk_tb;
    reg reset_tb;
    reg ex_mem_pcrsrc_tb;         
    reg [31:0] ex_mem_npc_tb;

    wire [31:0] IF_ID_instr_tb;   
    wire [31:0] IF_ID_npc_tb;   

    if_stage DUT (
        .clk(clk_tb),
        .reset(reset_tb),
        .ex_mem_pcrsrc(ex_mem_pcrsrc_tb),
        .ex_mem_npc(ex_mem_npc_tb),
        .IF_ID_instr(IF_ID_instr_tb),
        .IF_ID_npc(IF_ID_npc_tb)
    );

    initial clk_tb = 0;
    always #1 clk_tb = ~clk_tb;

    initial begin
        reset_tb = 1;
        ex_mem_pcrsrc_tb = 0;
        ex_mem_npc_tb = 32'hFFFFFFFF;
        #5;
        
        reset_tb = 0;  
        #10;
        
        #20;
        
        ex_mem_pcrsrc_tb = 1;
        ex_mem_npc_tb = 32'h00000000;
        #50;
        
        ex_mem_pcrsrc_tb = 0;
        #100;
        
        $finish;
    end
    
endmodule
