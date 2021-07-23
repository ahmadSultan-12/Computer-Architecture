module CONNECTED
    (
    output pc_sel, pc_write_cond, pc_write, I_or_D, mem_read, mem_write,
        mem_to_reg, IR_write, alu_src_A, reg_write, alu_zero_out, and_or, 
    output [3:0] alu_ctl,
    output [31:0] read_data1, read_data2, write_data, imm_out_val, alu_input_A,
        alu_input_B, alu_out_signal, read_mem_data, pc_in, mem_address,
    output [1:0] pc_src, alu_op, alu_src_B,  
    output reg [31:0] pc_out, instruction, mem_data_reg, A, B, ALUOut,
    input clk, rst
    );

///////////////// DATAPATH////////////////


// MUX for deciding instruction or data from memory
    MUX2x1 mux_I_or_D(I_or_D, pc_out, ALUOut, mem_address);

// Instruction and data memory are combined into 1 module for multi cycle procesoor
    MEMORY memory(mem_address, B, mem_write, mem_read, clk, rst, read_mem_data);

// MUX from memory to register file
    MUX2x1 mux_mem_to_reg(mem_to_reg, ALUOut, mem_data_reg, write_data);

//  REGISTER FILE BLOCK
    REGISTER_FILE register_file(instruction[19:15], instruction[24:20], instruction[11:7], write_data, 
        rst, clk , reg_write, read_data1, read_data2);

// Immediate generation module
    IMM_GEN imm_gen(imm_out_val, instruction);

// MUX for selecting input A for ALU
    MUX2x1 mux_alu_input_A(alu_src_A, pc_out, A, alu_input_A);

// MUX for selecting input B for ALU
    MUX3x1 mux_alu_input_B(alu_src_B, B, 32'h4, imm_out_val, alu_input_B);

// MAIN ALU block
    ALU alu(alu_out_signal, alu_zero_out,alu_input_A, alu_input_B, alu_ctl);

// MUX for selecting pc register input
    MUX2x1 muxPCSource(pc_src[0], alu_out_signal, ALUOut, pc_in);

// Control block misc units
    and(and_or, alu_zero_out, pc_write_cond);
    or(pc_sel, and_or, pc_write);

/////////////////////// CONTROLLER ///////////////////////////

    // Controller for data path
    CONTROL control(instruction[6:0], clk, rst, pc_src, alu_op, alu_src_B,
        pc_write_cond, pc_write, I_or_D, mem_read, mem_write,
        mem_to_reg, IR_write, alu_src_A, reg_write);

   // controller for ALU
    ALU_CONTROL aluControl(alu_ctl, alu_op, {instruction[30], instruction[14:12]});
     
// PC update logic
    always@(posedge clk)
    if (rst) begin
        pc_out <= 0;
        instruction <= 0;
        mem_data_reg <= 0;
        A <= 0;
        B <= 0;
        ALUOut <= 0;
    end
    else begin
        if(pc_sel) pc_out <= pc_in;
        if(IR_write) instruction <= read_mem_data;
        mem_data_reg <= read_mem_data;
        A <= read_data1;
        B <= read_data2;
        ALUOut <= alu_out_signal;
    end
        
endmodule
