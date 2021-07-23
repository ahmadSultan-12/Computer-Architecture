
module alu_control( ALUCtl, ALUOp, FuncCode);
   input [1:0] ALUOp;
   input [3:0] FuncCode;
   output reg [3:0]ALUCtl;

   always @ (ALUOp, FuncCode) begin
   if (ALUOp==2'b00) // In ALU OP 11 is not possible so 1x an x1 are used instead of 10 and 01
     ALUCtl <= 2; // add
   else if(ALUOp==2'b01) 
       ALUCtl <= 6; // subtract 
   else if (ALUOp==2'b10)
      begin
      case(FuncCode)              
	   0: ALUCtl <= 2; // add
	   8: ALUCtl <= 6; // subtract
	   7: ALUCtl <= 0; // and
	   6: ALUCtl <= 1; // or
	   default: ALUCtl <=15; //should not happen	  
       endcase
      end
   else ALUCtl <=15;
   end
endmodule