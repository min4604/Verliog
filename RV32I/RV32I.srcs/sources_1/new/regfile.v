module regfile(
    input               clk,
    input               rd_enable,
    input               r1_enable,
    input               r2_enable,
    input               rst,

    input       [4:0]   rs1_addr,
    input       [4:0]   rs2_addr,
    input       [4:0]   rd_addr,

    input      [31:0]   rd_data,
    output reg [31:0]   rs1,
    output reg [31:0]   rs2
);
     
    reg        [31:0]   regfile [0:31];

    always@(posedge(clk)) begin
        if (!rst) 
        begin
 
        end
        else
        begin
            if (rd_enable && rd_addr != 0) begin
                regfile[rd_addr] <= rd_data;
            end
        end
    end

    always@(*) begin
        if(!r1_enable)
            rs1 = 0;
        else if (r1_enable && rs1_addr != 0) 
        begin
           /* if(rd_enable && rs1_addr == rd_addr)
                rs1 = rd_data;
            else
                rs1 = regfile[rs1_addr];*/
            rs1 = regfile[rs1_addr];
        end
        else
            rs1 = 0;
    end

    always@(*) begin
        if(!r2_enable)
            rs2 = 0;
        else if (r2_enable && rs2_addr != 0) begin
            /*if(rd_enable && rs2_addr == rd_addr)
                rs2 = rd_data;
            else
                rs2 = regfile[rs2_addr];*/
            rs2 = regfile[rs2_addr];
        end
        else
            rs2 = 0;
    end

endmodule