`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/07 23:04:53
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
   reg [31:0] a, b;        // = input
    reg [3:0] mode; 
    wire [31:0] out;        // = output
    
    alu _alu (a, b, mode, out);
    
    initial begin
        a = 32'd0; b = 32'd0; mode = 4'h0;              // initial
        
        #1 a = 32'd2; b = 32'd3; mode = 4'h0;           // 2 + 3
        #1 a = 32'd5; b = 32'd8; mode = 4'h0;           // 5 + 8
        #1 a = 32'd32767; b = 32'd32767; mode =4'h0;   // 32767 + 32767
        
        #1 a = 32'd20; b = 32'd16; mode = 4'h1;         // 20 - 16
        #1 a = 32'd8; b = 32'd4; mode = 4'h1;           // 8 - 5
        #1 a = 32'd32767; b = 32'd32767; mode = 4'h1;   // 32767 - 32767
        
           #1 a = 32'd20; b = 32'd16; mode = 4'h2;         // 20  and 16
        #1 a = 32'd8; b = 32'd4; mode = 4'h2;           // 8 and 5
        #1 a = 32'd32767; b = 32'd32767; mode = 4'h2;   // 32767  and  32767
        
        #1 $stop;
        #1 $finish;
    end
    
endmodule

