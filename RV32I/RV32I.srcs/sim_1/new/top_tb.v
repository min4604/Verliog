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
    wire [31:0] INST;
    wire [31:0] a, b,rd_dt;        // = input
    
    wire [15:0] opcode;
    wire [4:0] rd_a ,rs1_a,rs2_a;
    wire [31:0] imm;
    reg clk;
    reg res;
    wire [31:0] pc_dt;
    wire [31:0]pc_old;
    wire pe_en;
    
    pc              _pc(clk,res,pc_en,pc_dt,pc_old);
    instr_memory    _instr_memory(pc_dt,pc_en,INST);
    decode          _decode(INST,opcode,rd_a,rs1_a,rs2_a,imm);
    regfile         _regfile(.rest(res),.we(1'b1),.rs1_a(rs1_a),.rs2_a(rs2_a),.rd_a(rd_a),.rd_dt(rd_dt),.rs1_dt(a),.rs2_dt(b));
    alu             _alu (a, b,opcode , imm,rd_dt);
    
    initial begin
        clk = 0;
        res = 0;
        #1 res =1;
        forever #1 clk = ~clk;
    end
    
    
    
endmodule
