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
            3'h0: //beq 
                if ($signed(data1) == $signed(data2)) begin
                    out = _enable;
                end else begin
                    out = _disable;
                end
            3'h1: //bne
                if ($signed(data1) != $signed(data2)) begin
                    out = _enable;
                end else begin
                    out = _disable;
                end
            3'h4: //blt
                if ($signed(data1) < $signed(data2)) begin
                    out = _enable;
                end else begin
                    out = _disable;
                end
            3'h5: //bge
                if ($signed(data1) >= $signed(data2)) begin
                    out = _enable;
                end else begin
                    out = _disable;
                end
            3'h6: //bltu
                if (data1 < data2) begin
                    out = _enable;
                end else begin
                    out = _disable;
                end
            3'h7: //bgeu
                if (data1 >= data2) begin
                    out = _enable;
                end else begin
                    out = _disable;
                end
            default: 
                out = _disable;
            endcase
        end
    end


endmodule
