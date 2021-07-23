`timescale 1ns / 100ps
module TB_PROCESSOR();

reg clk,rst;
wire pc_sel, pc_write_cond, pc_write, I_or_D, mem_read, mem_write,
     mem_to_reg, IR_write, alu_src_A, reg_write, alu_zero_out, and_or;
wire [3:0] alu_ctl;
wire [31:0] read_data1, read_data2, write_data, imm_out_val, alu_input_A,
     alu_input_B, alu_out_signal, read_mem_data, pc_in, mem_address;
wire [1:0] pc_src, alu_op, alu_src_B;
wire [31:0] pc_out, instruction, mem_data_reg, A, B, ALUOut;

CONNECTED processor(
    pc_sel, pc_write_cond, pc_write, I_or_D, mem_read, mem_write,
    mem_to_reg, IR_write, alu_src_A, reg_write, alu_zero_out, and_or, 
    alu_ctl,
    read_data1, read_data2, write_data, imm_out_val, alu_input_A,
    alu_input_B, alu_out_signal, read_mem_data, pc_in, mem_address,
    pc_src, alu_op, alu_src_B,  
    pc_out, instruction, mem_data_reg, A, B, ALUOut,
    clk, rst
);

initial begin
rst =1;
clk =0;
#2 rst = 0;
end
always #1 clk = ~clk;

endmodule
