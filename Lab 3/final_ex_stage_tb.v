`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2025 04:14:36 PM
// Design Name: 
// Module Name: final_ex_stage_tb
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


module final_ex_stage_tb(
    
    );
    
    reg clk;
    reg [1:0] ctlwb_in, ctlm_in;
    reg [31:0] npc, rdata1, rdata2, s_extend;
    reg [4:0] instr_2016, instr_1511;
    reg [1:0] alu_op;
    reg [5:0] funct;
    reg alusrc, regdst;

    wire [1:0] ctlwb_out, ctlm_out;
    wire [31:0] adder_out, alu_result_out, rdata2_out;
    wire [4:0] muxout_out;
    
    final_ex_stage uut (
        .clk(clk),
        .ctlwb_in(ctlwb_in),
        .ctlm_in(ctlm_in),
        .npc(npc),
        .rdata1(rdata1),
        .rdata2(rdata2),
        .s_extend(s_extend),
        .instr_2016(instr_2016),
        .instr_1511(instr_1511),
        .alu_op(alu_op),
        .funct(funct),
        .alusrc(alusrc),
        .regdst(regdst),
        .ctlwb_out(ctlwb_out),
        .ctlm_out(ctlm_out),
        .adder_out(adder_out),
        .alu_result_out(alu_result_out),
        .rdata2_out(rdata2_out),
        .muxout_out(muxout_out)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        ctlwb_in = 2'b10; ctlm_in = 2'b01;
        npc = 32'd100; rdata1 = 32'd10; rdata2 = 32'd20; s_extend = 32'd4;
        instr_2016 = 5'd5; instr_1511 = 5'd10;
        alu_op = 2'b10; funct = 6'b100000;
        alusrc = 0; regdst = 1;
        
        $display("Time\tOP\tResult\tAdder\tReg");
        $monitor("%0t\t%b\t%0d\t%0d\t%0d", $time, alu_op, alu_result_out, adder_out, muxout_out);

        #20;
        
        alu_op = 2'b10; funct = 6'b100010;
        rdata1 = 32'd30; rdata2 = 32'd15;
        
        #10;
        
        alu_op = 2'b10; funct = 6'b100101;
        rdata1 = 32'd12; rdata2 = 32'd5;
        
        #10;
        
        alu_op = 2'b10; funct = 6'b100100;
        rdata1 = 32'd14; rdata2 = 32'd7;
        
        #10;
        
        alu_op = 2'b10; funct = 6'b101010;
        rdata1 = 32'd8; rdata2 = 32'd12;
        
        #10;
        
        alusrc = 1;
        alu_op = 2'b00;
        rdata1 = 32'd100; s_extend = 32'd20;
        
        #10;
        
        regdst = 0;
        instr_2016 = 5'd15; instr_1511 = 5'd25;
        
        #10;
        
        $finish;
    end
    
endmodule
