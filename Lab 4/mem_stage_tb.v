`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2025 04:36:12 PM
// Design Name: 
// Module Name: mem_stage_tb
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


module mem_stage_tb(

    );
    
    reg clk;
    reg [1:0] control_wb_in;
    reg memread;
    reg memwrite;
    reg branch;
    reg zero;
    reg [31:0] address;
    reg [31:0] write_data;
    reg [4:0] write_reg_in;
    
    wire regwrite;
    wire memtoreg;
    wire [31:0] read_data;
    wire [31:0] mem_alu_result;
    wire [4:0] rd;
    
    mem_stage uut (
    .clk(clk),
    .control_wb_in(control_wb_in),
    .memread(memread),
    .memwrite(memwrite),
    .branch(branch),
    .zero(zero),
    .address(address),
    .write_data(write_data),
    .write_reg_in(write_reg_in),
    .regwrite(regwrite),
    .memtoreg(memtoreg),
    .read_data(read_data),
    .mem_alu_result(mem_alu_result),
    .rd(rd)
    );
    
    initial 
    begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    
    initial 
    begin
        control_wb_in = 2'b01;
        memread = 1;
        memwrite = 0;
        branch = 0;
        zero = 0;
        address = 32'h00000004;
        write_data = 32'h12345678;
        write_reg_in = 5'h02;

        #10; 

        memread = 0;
        memwrite = 1;
        
        #10; 
        
        memread = 1;
        memwrite = 0;
        
        #10; 

        branch = 1;
        zero = 1;
        
        #10; 

        $finish;
    end
    
    initial 
    begin
        $monitor("Time=%0t | Memory Read=%b, Memory Write=%b, Branch=%b | Read Data=%h, Address=%h",
                $time, memread, memwrite, branch, read_data, address);
    end
    
endmodule
