
`timescale 1 ns/10 ps
module tb_imm_gen();
	reg [31:0]inst;
	wire [31:0]out;
	IMM_GEN myImmGen(out, inst);
	initial begin
	// R-type instruction
	inst = 32'h01e50f33;  //add x30 x10 x30
	// I-type instruction
#2	inst = 32'h00850f03; //addi x30, x10, 8
	// S-type instruction
#2	inst = 32'h01ff2523; //sw x31, 10(x30)
	// SB-type instruction
#2	inst = 32'h01ff2563;  // 
#2	inst = 32'b0; // All zeros	
	$stop;
	end

endmodule

