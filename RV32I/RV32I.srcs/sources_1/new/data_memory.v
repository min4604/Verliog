
module dm_control(
    input       [2:0]   dop,                    // deside how many bytes (funct3)
    input               we,                     // enable write to memory
    input               clk,                    // for SAVE till next clock
    input       [31:0]  dm_addr,                // from ALU output
    input       [31:0]  data_in,                // from register rs2
    output  reg [31:0]  data_out                // to mux_wb
);
    
    reg [31:0] bank_in;
    reg [31:0] bank_out;
    reg [2:0] dop_last;
    reg [31:0] data_old;
    
    wire [31:0] mem_out;
    
    data_memory bank(
        .we(we),
        .clk(clk),
        .dm_addr(dm_addr),
        .data_in(bank_in),
        .data_out(mem_out)
    );

    always @(*) begin
        dop_last = dop;
        case(dop)
            3'b000:     // load byte (signed)
                data_out = {{24{mem_out[7]}}, mem_out[7:0]};
            3'b001:     // load half word (signed)
                data_out = {{16{mem_out[15]}}, mem_out[15:0]};
            3'b010:     // load word
                data_out = mem_out;
            3'b100:     // load byte unsigned
                data_out = {24'b0, mem_out[7:0]};
            3'b101:     // load half world unsigned
                data_out = {16'b0, mem_out[15:0]};
        endcase
        bank_out = mem_out;
    end
    
    always @(posedge clk) begin
        if (we)
            case(dop_last)  // previous op
                3'b000:     // save byte
                    bank_in <= {bank_out[31:8], data_in[7:0]};
                3'b001:     // save half word
                    bank_in <= {bank_out[31:16], data_in[15:0]};
                3'b010:     // save word
                    bank_in <= data_old;
            endcase
    end
    
    
endmodule

module data_memory(                 // one-byte per memory bank
    input   we,                     // enable write to memory
    input   clk,                    // SAVE till next clock
    input   [31:0] dm_addr,         // from ALU output
    input   [31:0] data_in,         // from register rs2
    output  reg [31:0] data_out     // to mux_wb
);
    
    reg [7:0] memory_bank [1023:0]; // 1024 byte data memory
    
    always @(posedge(clk)) begin    // write
        if(we) begin
            memory_bank[dm_addr] <= data_in[7:0];
            memory_bank[dm_addr+1] <= data_in[15:8];
            memory_bank[dm_addr+2] <= data_in[23:16];
            memory_bank[dm_addr+3] <= data_in[31:24];
        end
    end
    
    always @(*) begin               // read
        if(!we) data_out = {memory_bank[dm_addr+3], memory_bank[dm_addr+2], memory_bank[dm_addr+1], memory_bank[dm_addr]};
    end

endmodule