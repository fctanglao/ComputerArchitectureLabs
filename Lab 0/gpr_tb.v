`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2025 04:56:54 PM
// Design Name: 
// Module Name: gpr_tb
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


module gpr_tb(
    
    );
    
    reg [3:0] d;
    reg [1:0] sel;
    reg l_in, r_in, clk = 0, clr;
    wire [3:0] q;

    gpr uut(q, s, d, clr, clk, l_in, r_in);
    
    initial forever #5 clk = ~clk;

    initial begin
        sel = 0;
        d = 4'b1100;
        clr = 0;
        l_in = 0;
        r_in = 0;

        #10 sel = 3;  clr = 1;
        #10 sel = 1;
        #10 sel = 2;
        #10 sel = 1;  l_in = 1;
        #10 sel = 2;  r_in = 1;
    end

endmodule
