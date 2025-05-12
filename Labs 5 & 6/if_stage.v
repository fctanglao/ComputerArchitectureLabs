`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 05:09:36 PM
// Design Name: 
// Module Name: if_stage
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


module if_stage(
    input wire clk,
    input wire reset,
    input wire pcsrc,
    input wire [31:0] if_a,     
    output reg [31:0] id_npc,
    output reg [31:0] instrout
    );
    
    // program counter output
    reg [31:0]addr_pcin;
    
	// mux output 
    wire [31:0]if_npc;
	
	// adder output
    wire [31:0]if_b_npc;
	
    // instruction memory output
    wire [31:0]if_instr;
    
    // initialize pc
    initial 
    begin
        addr_pcin = 32'b0;
    end

    // pc logic
    always @(posedge clk or posedge reset) 
    begin
        if (reset) 
        begin
            addr_pcin <= 32'b0;
        end
        else 
        begin
            addr_pcin <= if_npc;
        end
    end
    
    if_adder ifaddr0(
    .pcin(addr_pcin),
    .pcout(if_npc)
    );
    
    mux_2x1_32bit ifmux0(
    .a(if_a),
    .b(if_b_npc),
    .sel(pcsrc),
    .y(if_npc)
    );
    
    instruction_memory im0(
    .addr(addr_pcin),
    .data(if_instr)
    );
    
    // if/id latch
    initial 
    begin
        instrout = 32'b0;
        id_npc = 32'b0;
    end
    
    always @(posedge clk or posedge reset) 
    begin
        if (reset) 
        begin
            instrout <= 32'b0;
            id_npc <= 32'b0;
        end
        else 
        begin
            instrout <= if_instr;
            id_npc <= if_b_npc;
        end
    end
endmodule
