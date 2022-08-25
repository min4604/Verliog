`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2022 10:00:02 PM
// Design Name: 
// Module Name: Top
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


module Top(
    input clk,
    input rst


    );
    wire [31:0] INST;
    wire [31:0] reg_rs2,reg_rs1,a, b,rd_dt;        // = input
    
    wire [15:0] opcode;
    wire [4:0] rd_a ,rs1_a,rs2_a;
    wire [31:0] imm;

    wire [31:0] pc;
    wire [31:0] pc_next;
    wire jmp_enable;
    wire pc_enable;
    wire rd_en;
    wire rs1_en;
    wire rs2_en;
    wire rs2_sw;

    pc              _pc(clk,rst,rd_dt,jmp_enable,pc_next,pc);
    instr_memory    _instr_memory(pc,INST);
    decode          _decode(INST,opcode,rd_a,rs1_a,rs2_a,rd_en,rs1_en,rs2_en,rs2_sw,jmp_enable,pc_enable,imm);
    
    regfile register(
        // self
        .clk(clk),
        .rst(rst),

        // decoder
        .rd_enable(rd_en),
        .r1_enable(rs1_en),
        .r2_enable(rs2_en),

        .rs1_addr(rs1_a),
        .rs2_addr(rs2_a),
        .rd_addr(rd_a),
        
        // alu
        .rd_data(rd_dt),
        .rs1(reg_rs1),
        .rs2(reg_rs2)
    );
    MUX2to1_32bit   _imm_MUX(rs2_sw,imm,reg_rs2,b);
    MUX2to1_32bit   _PC_MUX(pc_enable,reg_rs1,pc,a);
    alu             _alu (a, b,opcode ,rd_dt);

endmodule
