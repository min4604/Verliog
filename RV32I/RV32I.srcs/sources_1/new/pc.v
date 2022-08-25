module pc(
    input           clk,
    input           rst,

    input  [31:0]   jump_addr,
    input           jmp_enable,

    output reg [31:0]   pc_next,
    output reg [31:0]   pc
);
    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
            pc      <= 0;
            pc_next <= 0;
        end
        else if(jmp_enable)
        begin
           pc       <=jump_addr;
           pc_next  <=jump_addr+3'b100;
           
        end
        else
        begin
           pc       <=pc_next;
           pc_next  <=pc_next+3'b100;
           
        end
    end


endmodule