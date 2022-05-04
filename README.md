# 32-bit-RISC-Processor-
32-bit RISC Processor design using Harvard Architecture in Verilog.
Harvard Architecture is a computer architecture with seperate memory and pathways for data and instructions, whereas in von-newmann architecture data and instructions share the same memory and pathways.

Instruction Set
-Memory Access Instructions
1. Load word-LW: LD ws, offset(rs1) - ws Mem32[rs1+rs2]
2. Store word-SW: ST rs2, offset(rs1) Mem32[rs1+offset]=rs2

-Data Processing Insructions
1. Add: ADD ws,rs1,rs2 - ws = rs1+rs2
2. Subtract: SUB ws,rs1,rs2 - ws = rss1-rs2
3. Invert: INV ws,rs1 - ws = !rs1
4. Logical Shift Left: LSL ws,rs1,rs2 - ws = rs1<<rs2
5. Logical Shift Right: LSR ws,rs1,rs2 - ws = rs1>>rs2
6. Bitwise AND: AND ws,rs1,rs2 - ws = rs1&rs2
7. Bitwise OR: OR ws,rs1,rs2 - ws = rs1|rs2
8. Set on less than: SLT ws,rs1,rs2 - if rs1<rs2 then ws = 1 else ws = 0
                                                 
-Control Flow Instructions
1. Branch on equal: BEQ rs1,rs2,offset - branch to (pc+2+(offset<<1))when rs1=rs2
2. Branch not equal: BNE rs1,rs2,offset - branch to (pc+2+(offset<<1))when rs1!=rs2
3. Jump: JMP offset - Jump to {pc[30:26],(offset<<1)}
                                                 
----- Control signal / microinstructions -----
![controlsignal_microinstructions](https://user-images.githubusercontent.com/83471963/166769869-5a18ad02-72e4-458e-8b89-d68617563a38.png)

----- ALU design -----
![ALUdesign](https://user-images.githubusercontent.com/83471963/166801657-cf9fadd9-6001-4e35-b3dd-9c2ff086f19b.png)
