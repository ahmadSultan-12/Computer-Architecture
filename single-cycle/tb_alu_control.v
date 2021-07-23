
`timescale 1 ns/10 ps

module tb_alu_control();
reg clk;
reg [1:0] ALUOp;
wire [3:0]ALUCtl;
reg [3:0] FuncCode;
alu_control ac_inst( ALUCtl, ALUOp, FuncCode, clk);
initial begin
  clk = 1'b0;
  #1
  FuncCode = 4'b0000; 
  ALUOp = 2'b01;
  #2 FuncCode = 4'b1000; 
  #2 FuncCode = 4'b0111; 
#2 FuncCode = 4'b0110; 
#2
  ALUOp = 2'b00;
  FuncCode = 4'b0000; 
#2  FuncCode = 4'b1000; 
  #2 FuncCode = 4'b0111; 
#2 FuncCode = 4'b0110;  
#2  ALUOp = 2'b10;
  FuncCode = 4'b0000; 
#2 FuncCode = 4'b1000; 
  #2 FuncCode = 4'b0111; 
#2 FuncCode = 4'b0110;  
end
always #1 clk = ~clk;

// Testing IF module


endmodule