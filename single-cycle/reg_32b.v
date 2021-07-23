// A 32 bit flip flop
module reg_32b(out, in, enable, clk, reset);
input [31:0]in;
output reg [31:0]out;
input enable, clk,reset;
	always @ (posedge clk or posedge reset)
	  begin
	     if (reset == 1'b0)
	     begin
	        if (enable == 1'b1 )
		    out <= in;
	     end
	     else if (reset == 1'b1)
		    out <= 1'b0;
	   end
endmodule
 