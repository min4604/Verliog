`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2022 08:13:39 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb();
    
    reg clk;
    reg res;
   
    Top _top(clk,res);
    
    initial begin
        clk = 0;
        res = 0;
        #1 res =1;
        forever #1 clk = ~clk;
    end
    
     initial begin
         #50 $stop;
        #1 $finish;
      end

    
endmodule
