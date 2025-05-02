`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2025 04:48:45 PM
// Design Name: 
// Module Name: memory_tb
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


module memory_tb(

    );
    
    reg clk;
    reg [31:0] alu_result, write_data;
    reg [4:0] write_reg;
    reg [1:0] wb_ctrl;
    reg mem_write, mem_read, branch, zero;
    wire [31:0] read_data, alu_result_out;
    wire [4:0] write_reg_out;
    wire [1:0] wb_ctrl_out;
    wire pc_src;
    
    memory uut (
        .clk(clk),
        .alu_result(alu_result),
        .write_data(write_data),
        .write_reg(write_reg),
        .wb_ctrl(wb_ctrl),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .branch(branch),
        .zero(zero),
        .read_data(read_data),
        .alu_result_out(alu_result_out),
        .write_reg_out(write_reg_out),
        .wb_ctrl_out(wb_ctrl_out),
        .pc_src(pc_src)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    
    initial begin
        alu_result = 32'h00000004;
        write_data = 32'h12345678;
        write_reg = 5'h02;
        wb_ctrl = 2'b01;
        mem_write = 0;
        mem_read = 1;
        branch = 0;
        zero = 0;

        #10; 

        mem_write = 1;
        mem_read = 0;
        #10; 
        mem_write = 0;
        mem_read = 1;
        #10; 

        branch = 1;
        zero = 1;
        #10; 

        $finish;
    end
    
    initial begin
        $monitor("Time=%0t | Memory Read=%b, Memory Write=%b, Branch=%b | Read Data=%h, ALU Result=%h, PC Source=%b",
                $time, mem_read, mem_write, branch, read_data, alu_result_out, pc_src);
    end
endmodule
