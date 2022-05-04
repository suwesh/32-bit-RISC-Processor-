`include "parameterfile.v"
module instruction_memory(pc,instruction);
input [31:0] pc; // program counter
output [31:0] instruction; // instruction to be executed
reg [31:0] memory [31:0];
wire [3:0] rom_addr = pc[4:1];
initial begin
  $readmemb("C:/Verilog/bin/test.prog", memory,0,14);
end
assign instruction = memory[rom_addr];
endmodule