// Register:
// It has 16 Registers.
// Out of those 14 (R0,R1....R13) are General purpose Register.
// R14 (Stack Pointer) and R15 (Return Address Register) are Special purpose register.
// Each Register is 32 bit wide and clock edge triggered.


module REGISTER_FILE( input [4:0] Read_Reg1,
                      input [4:0] Read_Reg2,
                      input [4:0] Write_Reg,
                      input [31:0] Write_Data,
                      input Reset,
                      input Clk,
                      input RegWrite,
                      output reg [31:0] Read_Data1,
                      output reg [31:0] Read_Data2
                     );

//wire [3:0] A1,A2,A3;
//wire [31:0] D3;
//wire Reset,Clk;
//reg [31:0] D1,D2;

reg [31:0] R [15:0];
reg [15:0]ind;

//wire IsWb;
//--------------------------------------


always @(Reset)
                   begin
if (Reset==1)
                   begin
                   for (ind=0;ind<16;ind=ind+1)
                   begin
                   if (ind!=14)
                   R[ind]  = 32'b0;
                   else 
                   R[ind]  = 32'h1000;
                   end
                   end
                   end
                   
                     always @(Clk or Read_Reg1 or Read_Reg2)
                     begin
                     if (Reset!=1 && Clk==0)                      // Getting operands from Register file
                     begin                     
                     Read_Data1 = R[Read_Reg1];
                     Read_Data2 = R[Read_Reg2];
                     end
                     end

                     always @(posedge Clk)
                     begin                                       // Storing Result in the Register file
                     if (Reset!=1 && RegWrite==1)
                     R[Write_Reg] <= Write_Data;
                     end

endmodule


