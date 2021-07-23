module MEMORY(input [31:0] Address, Wdata, input MemWrite, MemRead, clk, rst,
    output [31:0] Rdata);

    reg [31:0] Mem[63:0];
    integer i;
    
    assign Rdata = (MemRead)? Mem[Address[31:2]]:32'd0;
    
    always@(negedge clk or posedge rst) begin
        if(rst) begin
            Mem[0] = 32'b00001000000000000010000010000011; // start: lw x1, 128(x0)
            Mem[1] = 32'b00001000010000000010000100000011; // lw x2, 132(x0)
            Mem[2] = 32'b00000000001000001111000110110011; // and x3, x1, x2
            Mem[3] = 32'b00000000001000001110001000110011; // or x4, x1, x2
            Mem[4] = 32'b00000000001000001000000110110011; // add x3, x1, x2
            Mem[5] = 32'b01000000001000001000001000110011; // sub x4, x1, x2
            Mem[6] = 32'b00001000001100000010000000100011; // sw x3, 128(x0)
            Mem[7] = 32'b00001000010000000010001000100011; // sw x4, 132(x0)
            Mem[8] = 32'b11111110001100011000000011100011; // beq x3, x3, start
            for(i=9;i<32;i=i+1) Mem[i] = 32'd0;
            
            Mem[32] = 32'hF; // Initiated with 15 // Adress = 128
            Mem[33] = 32'hA; // Initiated with 10 // Adress = 132
            for(i=34;i<64;i=i+1) Mem[i] = 32'd0;
        end
        else if(MemWrite) Mem[Address[31:2]] = Wdata;
    end
    
endmodule
