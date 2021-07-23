
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:41 05/16/2021 
// Design Name: 
// Module Name:    mux3(middleone) 
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
module mux3(alusrc, read_data2, imm_gen, out_to_alu);
    input alusrc;
    input [31:0] read_data2;
    input [31:0] imm_gen;
    output reg [31:0] out_to_alu;
	 always@(read_data2,imm_gen,alusrc)
	 begin
	 case(alusrc)
	 0: out_to_alu<=read_data2;
	 1: out_to_alu<=imm_gen;
	 default: out_to_alu<=0; 
	 endcase
	 end


endmodule
