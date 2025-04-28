`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2025 04:08:16 PM
// Design Name: 
// Module Name: decode_tb
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


module decode_tb(

    );
    
    reg         clk_tb,
                rst_tb,
                wb_reg_write_tb;
    reg [4:0]   wb_write_reg_location_tb;
    reg [31:0]  mem_wb_write_data_tb,
                if_id_instr_tb,
                if_id_npc_tb;
    wire [1:0]  id_ex_wb_tb;
    wire [2:0]  id_ex_mem_tb;
    wire [3:0]  id_ex_execute_tb;
    wire [31:0] id_ex_npc_tb,
                id_ex_readdat1_tb,
                id_ex_readdat2_tb,
                id_ex_sign_ext_tb;
    wire [4:0]  id_ex_instr_bits_20_16_tb,
                id_ex_instr_bits_15_11_tb;

    decode DUT (
        .clk(clk_tb),
        .rst(rst_tb),
        .wb_reg_write(wb_reg_write_tb),
        .wb_write_reg_location(wb_write_reg_location_tb),
        .mem_wb_write_data(mem_wb_write_data_tb),
        .if_id_instr(if_id_instr_tb),
        .if_id_npc(if_id_npc_tb),
        .id_ex_wb(id_ex_wb_tb),
        .id_ex_mem(id_ex_mem_tb),
        .id_ex_execute(id_ex_execute_tb),
        .id_ex_npc(id_ex_npc_tb),
        .id_ex_readdat1(id_ex_readdat1_tb),
        .id_ex_readdat2(id_ex_readdat2_tb),
        .id_ex_sign_ext(id_ex_sign_ext_tb),
        .id_ex_instr_bits_20_16(id_ex_instr_bits_20_16_tb),
        .id_ex_instr_bits_15_11(id_ex_instr_bits_15_11_tb)
    );


    initial begin
        clk_tb = 0;
        forever #1 clk_tb = ~clk_tb;
    end 
    
    initial begin
        rst_tb = 1; 
        wb_reg_write_tb = 0;
        wb_write_reg_location_tb = 5'd2;
        mem_wb_write_data_tb = 32'h64;
        if_id_npc_tb = 32'h0000001;
        
        if_id_instr_tb = 32'h00a41020;

        #2

        rst_tb = 0;
        #2
        
        if_id_npc_tb = 32'h0000002;
        
        if_id_instr_tb = 32'h10000008;
        #2

        if_id_npc_tb = 32'h0000003;
        
        if_id_instr_tb = 32'h8c820002;

        #2

        if_id_npc_tb = 32'h0000004;
        
        if_id_instr_tb = 32'hac820002;
        #2

        if_id_npc_tb = 32'h0000005;
        wb_reg_write_tb = 1;
        #2
        
        if_id_instr_tb = 32'h00421020;
       
        if_id_npc_tb = 32'h0000006;
        wb_reg_write_tb = 0;
        #2 
        #2
        $display("Decode Complete");
        $finish;

    end
    
endmodule
