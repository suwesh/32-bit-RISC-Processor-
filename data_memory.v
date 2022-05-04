`include "parameterfile.v"
module data_memory(clk, mem_access_addr, mem_write_data, mem_write_en, mem_read, mem_read_data);
input clk;
input [31:0] mem_access_addr; // address input shared by read and write port
// write port
input [31:0] mem_write_data;
input mem_write_en;
input mem_read;
// read port
output [31:0] mem_read_data;

reg [31:0] memory [31:0];
integer f;
wire [2:0] ram_addr = mem_access_addr[2:0];
initial begin
$readmemb("C:/Verilog/bin/test.data",memory);
$monitor("time = %d\n",$time,
            "\tmemory[0] = %b\n",memory[0],
            "\tmemory[1] = %b\n",memory[1],
            "\tmemory[2] = %b\n",memory[2],
            "\tmemory[3] = %b\n",memory[3],
            "\tmemory[4] = %b\n",memory[4],
            "\tmemory[5] = %b\n",memory[5],
            "\tmemory[6] = %b\n",memory[6],
            "\tmemory[7] = %b\n",memory[7],
            "\tmemory[8] = %b\n",memory[8],
            "\tmemory[9] = %b\n",memory[9],
            "\tmemory[10] = %b\n",memory[10],
            "\tmemory[11] = %b\n",memory[11],
            "\tmemory[12] = %b\n",memory[12],
            "\tmemory[13] = %b\n",memory[13],
            "\tmemory[14] = %b\n",memory[14],
            "\tmemory[15] = %b\n",memory[15],
            "\tmemory[16] = %b\n",memory[16],
            "\tmemory[17] = %b\n",memory[17],
            "\tmemory[18] = %b\n",memory[18],
            "\tmemory[19] = %b\n",memory[19],
            "\tmemory[20] = %b\n",memory[20],
            "\tmemory[21] = %b\n",memory[21],
            "\tmemory[22] = %b\n",memory[22],
            "\tmemory[23] = %b\n",memory[23],
            "\tmemory[24] = %b\n",memory[24],
            "\tmemory[25] = %b\n",memory[25],
            "\tmemory[26] = %b\n",memory[26],
            "\tmemory[27] = %b\n",memory[27],
            "\tmemory[28] = %b\n",memory[28],
            "\tmemory[29] = %b\n",memory[29],
            "\tmemory[30] = %b\n",memory[30],
            "\tmemory[31] = %b\n",memory[31]);
`simulation_time;
end

always @(posedge clk)
begin
if(mem_write_en)
begin memory[ram_addr] <= mem_write_data; end
end

assign mem_read_data = (mem_read == 1'b1) ? memory[ram_addr]: 32'd0;
endmodule