`timescale 1 ns/10 ps

module tb_alu();
reg clk;
reg [31:0] a,b;
wire zero;
wire [31:0]out_sig;
reg [3:0]alu_ctl;
ALU alu_inst(out_sig, zero, a, b, alu_ctl);
initial begin
  clk = 1'b0;
  a = 32'hFFFF_FFFF;
  b = 32'h0;
  alu_ctl = 2;
#2   alu_ctl = 4'd6;
#2   alu_ctl = 0;
#2   alu_ctl = 1;
end
always #1 clk = ~clk;

// Testing IF module


endmodule