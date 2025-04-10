`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2025 04:07:25 PM
// Design Name: 
// Module Name: sign_extend
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


module sign_extend(
    input wire [15:0] immediate,
    output wire [31:0] extended
    );
    
    // pre-pend 'immediate' with 16 bits of its MSB
    // hint: {} is the concatenate or replicate operator
    // example of concatenate: {111, 100} -> 111100
    // example of replicate: {4{1}} -> 1111
    
    assign extended = {{16{immediate[15]}}, immediate};
    
endmodule
