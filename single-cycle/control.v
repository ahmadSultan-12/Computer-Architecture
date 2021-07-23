
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:33:49 05/18/2021 
// Design Name: 
// Module Name:    control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module control(instruction, clk, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite);
    input [6:0] instruction;
    input clk;
    output reg branch;
    output reg memread;
    output reg memtoreg;
    output reg [1:0] aluop;
    output reg memwrite;
    output reg alusrc;
    output reg regwrite;
	 always@(instruction) begin
	 
	 case(instruction)
	 //r-type
	 7'h33: begin
		   alusrc<=0;
			memtoreg<=0;
			regwrite<=1;
			memread<=0;
			memwrite<=0;
			branch<=0;
			aluop<=2'b10;
			end
	//lw
	 7'h3: begin
		   alusrc<=1;
			memtoreg<=1;
			regwrite<=1;
			memread<=1;
			memwrite<=0;
			branch<=0;
			aluop<=2'b00;
			end
    //sw
	 7'h23: begin
		   alusrc<=1;
//			memtoreg<=1'bx;
			regwrite<=0;
			memread<=0;
			memwrite<=1;
			branch<=0;
			aluop<=2'b00;
			end
	 //beq
	 7'h63: begin
		   alusrc<=0;
//			memtoreg<=1'bx;
			regwrite<=0;
			memread<=0;
			memwrite<=0;
			branch<=1;
			aluop<=2'b01;
			end
	  default: begin
	      alusrc<=0;
			memtoreg<=1'b0;
			regwrite<=0;
			memread<=0;
			memwrite<=0;
			branch<=0;
			aluop<=2'b00;
			end
	 endcase
	 end
			

endmodule
