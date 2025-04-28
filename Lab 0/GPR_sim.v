`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2025 04:56:54 PM
// Design Name: 
// Module Name: GPR_sim
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


module GPR_sim(
    
    );
    
    reg [3:0] D;
    reg [1:0] S;
    reg L_in, R_in, CLK = 0, CLR;
    wire [3:0] Q;

    GPR dut(Q, S, D, CLR, CLK, L_in, R_in);
    
    initial forever #5 CLK = ~CLK;

    initial begin
        S = 0;
        D = 4'b1100;
        CLR = 0;
        L_in = 0;
        R_in = 0;

        #10 S = 3;  CLR = 1;
        #10 S = 1;
        #10 S = 2;
        #10 S = 1;  L_in = 1;
        #10 S = 2;  R_in = 1;
    end

endmodule
