module IF(instruction, pc_enable, clk, pc_reset);
output [31:0]instruction;
input pc_enable, clk, pc_reset;
wire [31:0]pc_out; 
wire [31:0]pc_in;

// Program Counter is a 32 bit register
   reg_32b pc(pc_out, pc_in, pc_enable, clk, pc_reset);
// Program Counter Output is connected to Instruction memory
   inst_mem inst_memory(instruction, pc_out);
// Adder for PC
   adder_32b pc_adder(pc_in, pc_out, 32'd4);
endmodule
