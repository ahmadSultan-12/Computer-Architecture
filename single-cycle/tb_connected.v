`timescale 1ns/100ps
module tb_connected();
wire [31:0] alu_out_sig;
reg pc_enable, clk, pc_reset, Reg_Reset;
initial begin
clk = 0;
pc_reset = 1;
Reg_Reset=1;
pc_enable =0;
#1 
Reg_Reset=0;
pc_reset=0;
#1
pc_enable = 1;
end
always #1 clk = ~clk;

CONNECTED_RISC cr_module(pc_enable, clk, pc_reset, Reg_Reset, alu_out_sig);
endmodule
