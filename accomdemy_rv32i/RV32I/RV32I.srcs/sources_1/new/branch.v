`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2022 07:53:52 PM
// Design Name: 
// Module Name: branch
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


module branch(
    input brabch_en,
    input [2:0] branch_op,
    input [31:0] rs1,
    input [31:0] rs2,
    output reg branch_out_en
    );
    always @(*)
    begin
        if(brabch_en)
        begin
            case(opcode[9:7])
            3'h0:                       //beq
            begin
                if(rs1==rs2)
                    branch_out_en<=1;
                else
                    branch_out_en<=0;

            end
            3'h1:                       //ben
            begin
                if(rs1!=rs2)
                    branch_out_en<=1;
                else
                    branch_out_en<=0;

            end
            3'h4:                       //blt
            begin
                if ((rs1[31] == 1) && (rs2[31] == 0))
					branch_out_en <= 1;
				else if ((rs1[31] == 0) && (rs2[31] == 1))
					branch_out_en <= 0;
				else if ((rs2[31] == 1) && (rs1[31] == 1))
					branch_out_en <= (rs1 < rs2) ? 1 : 0;
				else 
					branch_out_en <= (rs1 < rs2) ? 1 : 0;

            end
            3'h5:                       //bge
            begin
                if ((rs1[31] == 1) && (rs2[31] == 0))
					branch_out_en <= 0;
				else if ((rs1[31] == 0) && (rs2[31] == 1))
					branch_out_en <= 1;
				else if ((rs2[31] == 1) && (rs1[31] == 1))
					branch_out_en <= (rs1 >= rs2) ? 1 : 0;
				else 
					branch_out_en <= (rs1 >= rs2) ? 1 : 0;

            end
            3'h6:                       //bltu
            begin
                if(rs1<rs2)
                    branch_out_en<=1;
                else
                    branch_out_en<=0;

            end
            3'h7:                       //bgeu
            begin
                if(rs1>=rs2)
                    branch_out_en<=1;
                else
                    branch_out_en<=0;

            end
            default:branch_out_en<=0;
            endcase
        end


endmodule
