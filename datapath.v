`include "instruction_memory.v"
`include "register_file.v"
`include "alu.v"
`include "alucontrol.v"
`include "data_memory.v"
`include "controlunit.v"
module datapath(clk, jump, BEQ, mem_read, mem_write, alu_src, reg_dst, mem_to_reg ,reg_write, BNE, aluop, opcode);
input clk;
input jump, BEQ, mem_read, mem_write, alu_src, reg_dst, mem_to_reg ,reg_write, BNE;
input [1:0] aluop;
output [3:0] opcode;

reg [31:0] pc_current; // current instruction in the pc
wire [31:0] pc_next, pc2;
wire [31:0] instr;
wire [2:0] reg_write_dest; // reg write destination
wire [31:0] reg_write_data; // data to write in reg
wire [2:0] reg_read_addr1; // reg read address
wire [31:0] reg_read_data1; // reg read data
wire [2:0] reg_read_addr2;
wire [31:0] reg_read_data2;
wire [31:0] exit_im, read_data2;
wire [2:0] ALU_control;
wire [31:0] ALU_out;
wire zero_flag;
wire [31:0] PC_j, PC_BEQ, PC_2BEQ, PC_BNE, PC_2BNE; // pc values after jump and branch
wire BEQ_control;
wire [28:0] jump_shift;
wire [31:0] mem_read_data;
//PC
initial begin
pc_current <= 32'd0;
end
always @(posedge clk)
begin
pc_current <= pc_next;
end
assign pc2 = pc_current + 32'd2; // incremented pc value, next instruction
// instruction memory
instruction_memory im(.pc(pc_current),.instruction(instr));
// jump shift left 2
assign jump_shift = {instr[27:0], 1'b0};
// multiplexer regdest
assign reg_write_dest = (reg_dst == 1'b1) ? instr[5:3] : instr[8:6];
// register file(GPRs)
assign reg_read_addr1 = instr[11:9];
assign reg_read_addr2 = instr[8:6];
// General Purpose Registers
GPRs reg_file
(
    .clk(clk),
    .reg_write_en(reg_write),
    .reg_write_dest(reg_write_dest),
    .reg_write_data(reg_write_data),
    .reg_read_addr1(reg_read_addr1),
    .reg_read_data1(reg_read_data1),
    .reg_read_addr2(reg_read_addr2),
    .reg_read_data2(reg_read_data2)
);
// immediate extend
assign ext_im = {{10{instr[5]}}, instr[5:0]};
// ALU control unit
alucontrol ALU_control_unit(.alu_op(aluop),. op_code(instr[31:28]),.alu_control(ALU_control));
// multiplexer alu_src
assign read_data2 = (alu_src == 1'b1) ? ext_im : reg_read_data2;
//ALU
ALU alu_unit(.a(reg_read_data1),.b(reg_read_data2),.alu_sel(ALU_control),.alu_out(ALU_out),.zero(zero_flag));
// PC BEQ ADD
assign PC_BEQ = pc2 + {ext_im[30:0],1'b0};
assign PC_BNE = pc2 + {ext_im[30:0],1'b0};
// BEQ control
assign BEQ_control = BEQ & zero_flag;
assign BNE_control = BNE & (~zero_flag);
// PC_BEQ
assign PC_2BEQ = (BEQ_control == 1'b1) ? PC_BEQ : pc2;
// PC_BNE
assign PC_2BNE = (BNE_control == 1'b1) ? PC_BNE : PC_2BEQ;
// PC_j
assign PC_j = {pc2[31:29],jump_shift};
// PC_next
assign pc_next = (jump == 1'b1) ? PC_j : PC_2BNE;
// data memory
data_memory data_memory
(
    .clk(clk),
    .mem_access_addr(ALU_out),
    .mem_write_data(reg_read_data2),
    .mem_write_en(mem_write),
    .mem_read(mem_read),
    .mem_read_data(mem_read_data)
);
// write back
assign reg_write_data = (mem_to_reg == 1'b1) ? mem_read_data : ALU_out;
// output to control unit
assign opcode = instr[31:28];
endmodule
