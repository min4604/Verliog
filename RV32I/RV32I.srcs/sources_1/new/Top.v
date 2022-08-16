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
    input res


    );
    wire [31:0] INST;
    wire [31:0] a, b,rd_dt;        // = input
    
    wire [15:0] opcode;
    wire [4:0] rd_a ,rs1_a,rs2_a;
    wire [31:0] imm;

    wire [31:0] pc_dt;
    wire [31:0]pc_old;
    wire pc_en;
    wire W_ENABLE;
    wire RS1_ENABLE;
    wire RS2_ENABLE;

    pc              _pc(clk,res,pc_en,pc_dt,pc_old);
    instr_memory    _instr_memory(pc_dt,pc_en,INST);
    decode          _decode(INST,opcode,rd_a,rs1_a,rs2_a,imm);
    
    regfile register(
        // self
        .clk(clk),
        .rst(res),

        // decoder
        .w_enable(W_ENABLE),
        .r1_enable(RS1_ENABLE),
        .r2_enable(RS2_ENABLE),

        .rs1_addr(rs1_a),
        .rs2_addr(rs2_a),
        .rd_addr(rd_a),
        
        // alu
        .rd_data(rd_dt),
        .rs1(a),
        .rs2(b)
    );

    alu             _alu (a, b,opcode , imm,rd_dt);

endmodule
