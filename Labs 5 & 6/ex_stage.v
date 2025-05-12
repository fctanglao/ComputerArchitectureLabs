`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2025 01:42:11 PM
// Design Name: 
// Module Name: ex_stage
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


module ex_stage(
    input wire clk,
    input wire reset,
    input wire [1:0] ex_ctlwb_out,
    input wire [2:0] ex_ctlm_out,
    input wire [3:0] ex_ctlout,
    input wire [31:0] add_in1,
    input wire [31:0] A,
    input wire [31:0] ex_readdat2,
    input wire [31:0] s_extendout,
    input wire [5:0] funct,
    input wire [4:0] ex_b,
    input wire [4:0] ex_a,
    output reg [1:0] control_wb_in,
    output reg [2:0] m_ctlout,
    output reg [31:0] if_a,
    output reg zero,
    output reg [31:0] address,
    output reg [31:0] write_data,
    output reg [4:0] write_reg_in
    );
    
    // 2x1 5-bit mux output
    wire [4:0] muxout;
    
    // 2x1 32-bit mux output
    wire [31:0] B;
    
    // alu outputs
    wire aluzero;
    wire [31:0] result;
    
    // alu control unit output
    wire [2:0] control;
    
    // adder output
    wire [31:0] adder_out;
    
    // id/ex sign extend output
    wire [31:0] add_in2 = s_extendout << 2;
    
    mux_2x1_5bit bm0(
    .a(ex_a),
    .b(ex_b),
    .sel(ex_ctlout[3]), // regdst
    .y(muxout)
    );
    
    mux_2x1_32bit am0(
    .a(add_in2),
    .b(ex_readdat2),
    .sel(ex_ctlout[0]),
    .y(B)
    );
    
    alu_control ac0(
    .funct(funct),
    .alu_op(ex_ctlout[2:1]),
    .select(control)
    );
    
    alu alu0(
    .A(A),
    .B(B),
    .control(control),
    .zero(aluzero),
    .result(result)
    );
    
    ex_adder ea0(
    .add_in1(add_in1),
    .add_in2(s_extendout),
    .add_out(adder_out)
    );
    
    // ex/mem latch
    initial 
    begin
        if_a = 32'b0;
        address = 32'b0;
        write_data = 32'b0;
        write_reg_in = 5'b0;
        control_wb_in = 2'b0;
        m_ctlout = 3'b0;
        zero = 1'b0;
    end
    
    always @(posedge clk or posedge reset) 
    begin
        if (reset) 
        begin
            if_a <= 32'b0;
            address <= 32'b0;
            write_data <= 32'b0;
            write_reg_in <= 5'b0;
            control_wb_in <= 2'b0;
            m_ctlout <= 3'b0;
            zero <= 1'b0;
        end
        else 
        begin
            if_a <= adder_out;
            address <= result;
            write_data <= ex_readdat2;
            write_reg_in <= muxout;
            control_wb_in <= ex_ctlwb_out;
            m_ctlout <= ex_ctlm_out;
            zero <= aluzero;
        end
    end
    
endmodule
