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
    
    wire [31:0] pc;
    wire [31:0] INST;

    instr_memory    _instr_memory(pc,INST);
    Top _top(clk,res,pc,INST);
    
    initial begin
        clk = 0;
        res = 0;
        forever #1 clk = ~clk;
    end
    
     initial begin
        #3 res =1;
        #900 $stop;
        #1 $finish;
      end

    
endmodule
