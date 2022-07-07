`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/07 22:50:51
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] op,
    output [31:0] out
    );
    reg [31:0] buff;
    
    always @(*)
    begin
        case(op)
        4'h0 : buff =a+b;   //add
        4'h1 : buff =a-b;   //sub
        4'h2 : buff =a&b;   //and 
        4'h3 : buff =a|b;   //or 
        4'h4 : buff =a^b;   //xor 
        
        default :buff=32'h0000;
        endcase
    end 
    assign out=buff;
endmodule
