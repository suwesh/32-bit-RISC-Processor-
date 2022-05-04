`include "datapath.v"

module risc_processor32(clk);
input clk;
wire jump, BEQ, BNE, mem_read, mem_write, alu_src, reg_dst, mem_to_reg, reg_write;
wire [1:0] aluop;
wire [3:0] opcode;
// datapath
datapath DU
(
    .clk(clk),
    .jump(jump),
    .BEQ(BEQ),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_src(alu_src),
    .reg_dst(reg_dst),
    .mem_to_reg(mem_to_reg),
    .reg_write(reg_write),
    .BNE(BNE),
    .aluop(aluop),
    .opcode(opcode)
);
// control unit
control_unit CU
(
    .opcode(opcode),
    .reg_dst(reg_dst),
    .mem_to_reg(mem_to_reg),
    .aluop(aluop),
    .jump(jump),
    .BNE(BNE),
    .BEQ(BEQ),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_src(alu_src),
    .reg_write(reg_write)
);
endmodule