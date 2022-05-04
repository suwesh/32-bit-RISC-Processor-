`timescale 1ns / 1ps
`include "parameterfile.v"
`include "processor.v"
module risc_processor32_tb;
// inputs
reg clk;
risc_processor32 uut(.clk(clk));
initial begin
  clk <= 0;
  `simulation_time;
  $finish;
end
always
begin
  #10 clk = ~clk; // clock pulse changes every 10ns.00ps
end

endmodule