

module IMM_GEN(sign_ex_imm, inst);
   input [31:0]inst;
   output reg [31:0]sign_ex_imm;
   wire [6:0]opcode;

   // Get OPcode from the array
   assign opcode = inst[6:0]; 

   // Based on opcode decide output
   always @ (inst)
   begin
   case (opcode)
	7'd03: sign_ex_imm <= { {20{inst[31]}}, inst[31:20]};// I-type
	7'd35: sign_ex_imm  <= { {20{inst[31]}}, inst[31:25], inst[11:7]}; // S Type
	7'd99: sign_ex_imm  <= { {19{inst[31]}}, inst[31], inst[7],
                                    inst[30:25], inst[11:8], 1'b0};// SB-TYPE
	default: sign_ex_imm <= 32'b0;
   endcase
   
   end
endmodule