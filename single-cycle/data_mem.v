
//It has 4KB of Random access memory.
//Memory is 8 bits wide but processor access 32 bits (4B) for Operation.


module  Memory(input [31:0] Address, Wdata, input MemWrite, MemRead, clk, rst,
    output [31:0] Rdata);

    reg [31:0] Memory[31:0];
    integer i;
    
    assign Rdata = (MemRead)? Memory[Address[31:2]]:32'd0;
    
    always@(negedge clk or posedge rst) begin
        if(rst) begin
            Memory[0] = 32'hF; // Initiated with 15
            Memory[1] = 32'hA; // Initiated with 10
            for(i=2;i<32;i=i+1) Memory[i] = 32'd0;
        end
        else if(MemWrite) Memory[Address[31:2]] = Wdata;
    end
    
endmodule
