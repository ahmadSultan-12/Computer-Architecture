//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:45 05/16/2021 
// Design Name: 
// Module Name:    mux1 
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
module mux1(pcsrc, pc_plus_four, pc_plus_immgen, new_pc);
    input pcsrc;
    input [31:0] pc_plus_four;
    input [31:0] pc_plus_immgen;
    output reg [31:0] new_pc;
	 always@(pcsrc,pc_plus_four,pc_plus_immgen)
	 begin
	 case(pcsrc)
	 0: new_pc<=pc_plus_four;
	 1: new_pc<=pc_plus_immgen;
	 default: new_pc<=0;
	 endcase
	 end

endmodule
