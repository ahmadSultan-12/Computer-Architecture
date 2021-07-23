
// A 32 bit flip flop
module reg_file_1b(output reg [1:0]out, 
		    input [1:0]in, enable, clk, reset);
	always @ (posedge clk)
	  begin
	     if (reset == 1'b0)
	     begin
	        if (enable == 1'b1 )
		    out = in;
	     end
	     else if (reset == 1'b1)
		    out <= 1'b0;
	   end
endmodule
 