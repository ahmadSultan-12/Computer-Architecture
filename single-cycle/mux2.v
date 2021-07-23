
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:42 05/16/2021 
// Design Name: 
// Module Name:    mux2 
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
module mux2(mem_to_reg, read_data, alu_result, new_write_data_to_reg);
    input mem_to_reg;
    input [31:0] read_data;
    input [31:0] alu_result;
    output reg [31:0] new_write_data_to_reg;
	 always@(read_data,alu_result,mem_to_reg)
	 begin
	 case(mem_to_reg)
	 1: new_write_data_to_reg<=read_data;
	 0: new_write_data_to_reg<=alu_result;
	 default: new_write_data_to_reg<=0;
	 endcase
	 end


endmodule
