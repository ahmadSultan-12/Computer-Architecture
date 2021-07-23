`timescale 1 ns/10 ps

module tb_IF();
reg pc_enable, clk, reset;
wire [31:0]out_inst;
initial begin
  clk = 1'b0;
  reset = 1'b1;
  #40 reset = 1'b0;
  pc_enable = 1'b0;
end
always #100 pc_enable = ~pc_enable;
always #20 clk = ~clk;

// Testing IF module
IF if_instance(out_inst, pc_enable, clk, reset);

endmodule