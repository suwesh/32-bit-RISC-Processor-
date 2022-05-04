module GPRs(clk, reg_write_en, reg_write_dest, reg_write_data, reg_read_addr1, reg_read_data1, reg_read_addr2, reg_read_data2);
input clk;
//write port
input reg_write_en; // enable 1 or 0
input [2:0] reg_write_dest; // reg write destination
input [31:0] reg_write_data; // reg write data
//read port 1
input [2:0] reg_read_addr1; // input is the reg address
output [31:0] reg_read_data1; // output is the reg data
//read port 2
input [2:0] reg_read_addr2; // input is the reg address
output [31:0] reg_read_data2; // output is the reg data
////
reg [31:0] reg_array [15:0];
integer i; // reg [2:0] i;
// write port
initial begin
  for(i=0; i<16; i=i+1)
  begin
  reg_array[i] <= 32'd0;
  end
end
always @(posedge clk)
begin
  if(reg_write_en)
  begin
  reg_array[reg_write_dest] <= reg_write_data;
  end
end

assign reg_read_data1 = reg_array[reg_read_addr1];
assign reg_read_data2 = reg_array[reg_read_addr2];
endmodule