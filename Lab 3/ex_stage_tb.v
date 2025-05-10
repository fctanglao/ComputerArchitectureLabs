`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2025 01:43:49 PM
// Design Name: 
// Module Name: ex_stage_tb
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


module ex_stage_tb(

    );
    
    reg clk;
    reg [1:0] ex_ctlwb_out;
    reg [2:0] ex_ctlm_out;
    reg regdst;
    reg [1:0] aluop;
    reg alusrc;
    reg [31:0] add_in1;
    reg [31:0] A;
    reg [31:0] ex_readdat2;
    reg [31:0] add_in2;
    reg [5:0] funct;
    reg [4:0] ex_b;
    reg [4:0] ex_a;

    wire [1:0] control_wb_in;
    wire memread;
    wire memwrite;
    wire branch;
    wire [31:0] if_a;
    wire zero;
    wire [31:0] address;
    wire [31:0] write_data;
    wire [4:0] write_reg_in;
    
    ex_stage uut(
    .clk(clk),
    .ex_ctlwb_out(ex_ctlwb_out),
    .ex_ctlm_out(ex_ctlm_out),
    .regdst(regdst),
    .aluop(aluop),
    .alusrc(alusrc),
    .add_in1(add_in1),
    .A(A),
    .ex_readdat2(ex_readdat2),
    .add_in2(add_in2),
    .funct(funct),
    .ex_b(ex_b),
    .ex_a(ex_a),
    .control_wb_in(control_wb_in),
    .memread(memread),
    .memwrite(memwrite),
    .branch(branch),
    .if_a(if_a),
    .zero(zero),
    .address(address),
    .write_data(write_data),
    .write_reg_in(write_reg_in)
    );
    
    initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial 
    begin
        ex_ctlwb_out = 2'b10; 
        ex_ctlm_out = 3'b01;
        regdst = 1;
        aluop = 2'b10;
        alusrc = 0;
        add_in1 = 32'd100; 
        A = 32'd10; 
        ex_readdat2 = 32'd20; 
        add_in2 = 32'd4;
        funct = 6'b100000;
        ex_b = 5'd5; 
        ex_a = 5'd10;
        
        $display("Time\tOP\tResult\tAdder\tReg");
        $monitor("%0t\t%b\t%0d\t%0d\t%0d", $time, aluop, address, if_a, write_reg_in);

        #20;
        
        aluop = 2'b10; 
        funct = 6'b100010;
        A = 32'd30; 
        ex_readdat2 = 32'd15;
        
        #10;
        
        aluop = 2'b10; 
        funct = 6'b100101;
        A = 32'd12; 
        ex_readdat2 = 32'd5;
        
        #10;
        
        aluop = 2'b10; 
        funct = 6'b100100;
        A = 32'd14; 
        ex_readdat2 = 32'd7;
        
        #10;
        
        aluop = 2'b10; 
        funct = 6'b101010;
        A = 32'd8; 
        ex_readdat2 = 32'd12;
        
        #10;
        
        aluop = 2'b00;
        alusrc = 1;
        A = 32'd100; 
        add_in2 = 32'd20;
        
        #10;
        
        regdst = 0;
        ex_b = 5'd15; 
        ex_a = 5'd25;
        
        #10;
        
        $finish;
    end
    
endmodule
