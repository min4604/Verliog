`timescale 10ps / 1ps
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
    pc _pc(clk,res,pc_en,pc_dt,pc_old); 
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
    
    
    



/*
   reg [31:0] a, b;        // = input
    reg [3:0] mode; 
    wire [31:0] out;        // = output
    reg clk;
    
    alu _alu (a, b, mode, out);
    
    initial begin
        clk = 0;
        a=0;
        b=0;
        mode=0;
        forever #1 clk = ~clk;
    end
    always @( posedge clk)
    begin
        a<=a+2'b11;
        if( a>=32'h00ff)
        begin
            b<=b+2'b10;
            a<=32'h0000;
            if(b>=32'h00ff)
            begin
                b<=32'h0000;
                mode<=mode+1'b1;
            end
        end
     end   
 
                
        
    /*
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
    */
endmodule

