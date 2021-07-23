module CONTROL(input [6:0] Opcode, input clk, rst, 
    output reg [1:0] PCSource, ALUOp, ALUSrcB, 
    output reg PCWriteCond, PCWrite, IorD, MemRead, MemWrite,
        Mem2Reg, IRWrite, ALUSrcA, RegWrite);
        
        
    integer Step;
    
    always@(posedge clk)
    if(rst) begin 
        {PCSource, ALUOp, ALUSrcB,PCWriteCond, PCWrite, IorD, 
            MemRead, MemWrite, Mem2Reg, IRWrite, ALUSrcA, RegWrite} = 0;
        Step <= 1;
    end
    else begin
        if (step == 1)
	    begin
                PCSource = 0;
                ALUOp = 0;
                ALUSrcA = 0;
                ALUSrcB = 1;
                PCWriteCond = 0;
                PCWrite = 1;
                IorD = 0;
                MemRead = 1;
                MemWrite = 0;
                Mem2Reg = 0;
                IRWrite = 1;
                RegWrite = 0;
            end
        else if (step ===2)
	    begin
                ALUSrcB = 2;
                PCWrite = 0;
                MemRead = 0;
                IRWrite = 0;
            end
        else if (step ===3)
	    casex(Opcode[6:4])
                3'b0?0: begin
                    ALUSrcA = 1;
                    ALUSrcB = 2;
                    ALUOp = 0;
                end
                3'b011: begin
                    ALUSrcA = 1;
                    ALUSrcB = 0;
                    ALUOp = 2;
                end
                3'b110: begin
                    PCSource = 1;
                    PCWriteCond = 1;
                    ALUSrcA = 1;
                    ALUSrcB = 0;
                    ALUOp = 1;
                end
            endcase
        else if (step ===4)
	    casex(Opcode[6:4])
                3'b000: begin
                    MemRead = 1;
                    IorD = 1;
                end
                3'b010: begin
                    MemWrite = 1;
                    IorD = 1;
                end
                3'b011: begin
                    RegWrite = 1;
                    Mem2Reg = 0;
                end
            endcase
        else if (step ===5)
	    if(Opcode[6:4] == 3'b000) begin
                RegWrite = 1;
                Mem2Reg = 1;
            end


        if (Step == 5) Step <= 1;
        else Step <= Step + 1;
    end
    
endmodule

