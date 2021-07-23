module CONNECTED_RISC(input pc_enable, clk, pc_reset, Reg_Reset, output [31:0]alu_out_sig);
wire [31:0]instruction;wire [31:0]imm_out;
//ALU
wire alu_out_zero;wire [31:0]out_to_alu;wire [3:0]ALUCtl;
//Control
wire ct_out_branch, ct_out_memread, 
     ct_out_memtoreg, ct_out_memwrite, 
     ct_out_alusrc, ct_out_regwrite;
wire [1:0]ct_out_aluop;
// IF
wire [31:0]pc_out,pc_in;wire [31:0]pc_plus_4;wire [31:0]pc_imm_out; wire pc_mux_and_out;
//FIle Register
wire [31:0] Read_Data1;wire [31:0] Read_Data2; 
// Data Memory Start
wire [31:0]ReadData;wire [31:0]new_write_data_to_reg;

   //Make A PC instance
   reg_32b pc(pc_out, pc_in, pc_enable, clk, pc_reset);

   //Instruction Memory
    inst_mem inst_memory(instruction, pc_out);  

   //PC_ADDER
   adder_32b pc_adder(pc_plus_4, pc_out, 32'd4);

   //IMM_PC ADDER
   adder_32b imm_pc_adder(pc_imm_out, pc_out, imm_out);

   //PC_MUX_AND
   and(pc_mux_and_out, ct_out_branch, alu_out_zero);

   //PC_MUX
   mux1 pc_mux(pc_mux_and_out, pc_plus_4, pc_imm_out, pc_in);

   //CONTROL
   control control_block(instruction[6:0], clk, ct_out_branch, ct_out_memread, 
			ct_out_memtoreg, ct_out_aluop, ct_out_memwrite, 
			ct_out_alusrc, ct_out_regwrite);

   //REG_FILE
   Register_File reg_file( instruction[19:15], instruction[24:20], instruction[11:7],
                      new_write_data_to_reg, Reg_Reset, clk, ct_out_regwrite,
                      Read_Data1, Read_Data2);

   //IMM_GEN
   IMM_GEN imm_gen_inst(imm_out, instruction);

   //MIDDLE MUX ALU
   mux3 middle_mux(ct_out_alusrc, Read_Data2, imm_out, out_to_alu);

   //ALU
   ALU alu_main(alu_out_sig, alu_out_zero, Read_Data1, out_to_alu, ALUCtl);

   //ALU_CONTROL
   alu_control instance_alu_ctl(ALUCtl, ct_out_aluop, {instruction[30],instruction[14:12]});
   
   //DATA MEMORY
   Memory data_mem(alu_out_sig, Read_Data2, ct_out_memwrite, ct_out_memread,clk, Reg_Reset, ReadData);
   
   //END MUX
   mux2 mux_end(ct_out_memtoreg, ReadData, alu_out_sig, new_write_data_to_reg);

endmodule
