module control_unit(opcode, aluop, jump, BEQ, BNE, mem_read, mem_write, alu_src, reg_dst, mem_to_reg, reg_write);
input [3:0] opcode;
output reg[1:0] aluop;
output reg jump, BEQ, BNE, mem_read, mem_write, alu_src, reg_dst, mem_to_reg, reg_write;
always @(*)
begin
  case(opcode)
  4'b0000: begin // LW
           reg_dst = 1'b0; // writing the microinstructions
           alu_src = 1'b1;
           mem_to_reg = 1'b1;
           reg_write = 1'b1;
           mem_read = 1'b1;
           mem_write = 1'b0;
           BEQ = 1'b0;
           BNE = 1'b0;
           aluop = 2'b10;
           jump = 1'b0;
           end
  4'b0001: begin // SW
           reg_dst = 1'b0; // writing the microinstructions
           alu_src = 1'b1;
           mem_to_reg = 1'b0;
           reg_write = 1'b0;
           mem_read = 1'b0;
           mem_write = 1'b1;
           BEQ = 1'b0;
           BNE = 1'b0;
           aluop = 2'b10;
           jump = 1'b0;
           end
  4'b0010: begin // data processing
           reg_dst = 1'b1; // writing the microinstructions
           alu_src = 1'b0;
           mem_to_reg = 1'b0;
           reg_write = 1'b1;
           mem_read = 1'b0;
           mem_write = 1'b0;
           BEQ = 1'b0;
           BNE = 1'b0;
           aluop = 2'b00;
           jump = 1'b0;
           end
  4'b0011: begin // data processing
           reg_dst = 1'b1; // writing the microinstructions
           alu_src = 1'b0;
           mem_to_reg = 1'b0;
           reg_write = 1'b1;
           mem_read = 1'b0;
           mem_write = 1'b0;
           BEQ = 1'b0;
           BNE = 1'b0;
           aluop = 2'b00;
           jump = 1'b0;
           end
  4'b0100: begin // data processing
           reg_dst = 1'b1; // writing the microinstructions
           alu_src = 1'b0;
           mem_to_reg = 1'b0;
           reg_write = 1'b1;
           mem_read = 1'b0;
           mem_write = 1'b0;
           BEQ = 1'b0;
           BNE = 1'b0;
           aluop = 2'b00;
           jump = 1'b0;
           end
  4'b0101: begin // data processing
           reg_dst = 1'b1; // writing the microinstructions
           alu_src = 1'b0;
           mem_to_reg = 1'b0;
           reg_write = 1'b1;
           mem_read = 1'b0;
           mem_write = 1'b0;
           BEQ = 1'b0;
           BNE = 1'b0;
           aluop = 2'b00;
           jump = 1'b0;
           end
  4'b0110: begin // data processing
           reg_dst = 1'b1; // writing the microinstructions
           alu_src = 1'b0;
           mem_to_reg = 1'b0;
           reg_write = 1'b1;
           mem_read = 1'b0;
           mem_write = 1'b0;
           BEQ = 1'b0;
           BNE = 1'b0;
           aluop = 2'b00;
           jump = 1'b0;
           end
  4'b0111: begin // data processing
           reg_dst = 1'b1; // writing the microinstructions
           alu_src = 1'b0;
           mem_to_reg = 1'b0;
           reg_write = 1'b1;
           mem_read = 1'b0;
           mem_write = 1'b0;
           BEQ = 1'b0;
           BNE = 1'b0;
           aluop = 2'b00;
           jump = 1'b0;
           end
  4'b1000: begin // data processing
           reg_dst = 1'b1; // writing the microinstructions
           alu_src = 1'b0;
           mem_to_reg = 1'b0;
           reg_write = 1'b1;
           mem_read = 1'b0;
           mem_write = 1'b0;
           BEQ = 1'b0;
           BNE = 1'b0;
           aluop = 2'b00;
           jump = 1'b0;
           end
  4'b1001: begin // data processing
           reg_dst = 1'b1; // writing the microinstructions
           alu_src = 1'b0;
           mem_to_reg = 1'b0;
           reg_write = 1'b1;
           mem_read = 1'b0;
           mem_write = 1'b0;
           BEQ = 1'b0;
           BNE = 1'b0;
           aluop = 2'b00;
           jump = 1'b0;
           end
  4'b1011: begin // BEQ
           reg_dst = 1'b0; // writing the microinstructions
           alu_src = 1'b0;
           mem_to_reg = 1'b0;
           reg_write = 1'b0;
           mem_read = 1'b0;
           mem_write = 1'b0;
           BEQ = 1'b1;
           BNE = 1'b0;
           aluop = 2'b01;
           jump = 1'b0;
           end
  4'b1100: begin // BNE
           reg_dst = 1'b0; // writing the microinstructions
           alu_src = 1'b0;
           mem_to_reg = 1'b0;
           reg_write = 1'b0;
           mem_read = 1'b0;
           mem_write = 1'b0;
           BEQ = 1'b0;
           BNE = 1'b1;
           aluop = 2'b01;
           jump = 1'b0;
           end
  4'b1101: begin // jump
           reg_dst = 1'b0; // writing the microinstructions
           alu_src = 1'b0;
           mem_to_reg = 1'b0;
           reg_write = 1'b0;
           mem_read = 1'b0;
           mem_write = 1'b0;
           BEQ = 1'b0;
           BNE = 1'b0;
           aluop = 2'b00;
           jump = 1'b1;
           end
  default: begin
           reg_dst = 1'b1; // writing the microinstructions
           alu_src = 1'b0;
           mem_to_reg = 1'b0;
           reg_write = 1'b1;
           mem_read = 1'b0;
           mem_write = 1'b0;
           BEQ = 1'b0;
           BNE = 1'b0;
           aluop = 2'b00;
           jump = 1'b0;
           end
  endcase
end
endmodule