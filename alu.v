module ALU(a,b,alu_sel,alu_out,zero);
input [31:0] a,b; // inputs src1 and src2
input [2:0] alu_sel; // alu select / op
output reg [31:0] alu_out; // alu output result
output zero;
always @(*)
begin
case(alu_sel)
3'b000: alu_out = a + b; // ADD
3'b001: alu_out = a - b; // SUB
3'b010: alu_out = ~a; // INVERT
3'b011: alu_out = a<<b; // LSL
3'b100: alu_out = a>>b; // LSR
3'b101: alu_out = a & b; // bitwise AND
3'b110: alu_out = a | b; // bitwise OR
3'b111: begin if(a<b) begin alu_out = 32'd1; end
              else begin alu_out = 32'd0; end
        end // SLT
default: alu_out = a + b; // ADD
endcase
end

assign zero = (alu_out == 32'd0) ? 1'b1: 1'b0;
endmodule
