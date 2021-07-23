module inst_mem(output [31:0]inst, input [31:0]pc_out);
reg [255:0]mem; // 32 32 bit registers in the instruction memory
initial begin // Hard Code Instructions In the instruction memory
mem[31:0] = 32'b00000000000000000010000010000011; // start: lw x1, 0(x0)
mem[63:32] = 32'b00000000010000000010000100000011; // lw x2, 4(x0)
mem[95:64] = 32'b00000000001000001110001000110011; // or x4, x1, x2
mem[127:96] = 32'b00000000001000001000000110110011; // add x3, x1, x2
mem[159:128] = 32'b01000000001000001000001000110011; // sub x4, x1, x2
mem[191:160] = 32'b00000000001100000010000000100011; // sw x3, 0(x0)
mem[223:192] = 32'b00000000010000000010001000100011; // sw x4, 4(x0)
mem[255:224] = 32'b11111110010000100000000011100011; // beq x4, x4, start
//add instruction
//subtract instruction
//AND instruction
//OR instruction
end
assign inst = mem[(pc_out*8)+:32];
endmodule

