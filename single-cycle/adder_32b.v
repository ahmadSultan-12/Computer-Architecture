// Adder for PC 
module adder_32b(output reg [31:0]out, input [31:0]A, input [31:0]B);
	always @ (A,B)
	begin
		out <= A + B;
	end
endmodule