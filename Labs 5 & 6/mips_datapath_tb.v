`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2025 12:26:06 AM
// Design Name: 
// Module Name: mips_datapath_tb
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


module mips_datapath_tb(

    );
    
    reg clk;
    reg reset;
    integer cycle;
    
    // debug wires
    wire [5:0] opcode_debug = dut.if0.instrout[31:26];
    wire [31:0] r1 = dut.id0.rf0.gpr[1];
    wire [31:0] r2 = dut.id0.rf0.gpr[2];
    wire [31:0] r3 = dut.id0.rf0.gpr[3];
    
    // instantiate pipeline
    mips_datapath dut (
    .clk(clk),
    .reset(reset)
    );
    
    // seed memory initialization files
    initial 
    begin
        $readmemb("risc.txt", dut.if0.im0.mem);
        $readmemb("data.txt",  dut.mem0.dm0.mem);
    end
    
    // clock
    initial 
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // reset
    initial 
    begin
        reset = 1; 
        #10 
        reset = 0;
    end
    
    // print program
    initial
    begin
        for (cycle = 0; cycle < 24; cycle = cycle + 1) 
        begin 
            @(posedge clk)
            #1
            $display("CYCLE=%0d | OPCODE=%b | R1=%0d R2=%0d R3=%0d",
                     cycle, opcode_debug, r1, r2, r3);
        end
        $finish;
    end
    
endmodule
