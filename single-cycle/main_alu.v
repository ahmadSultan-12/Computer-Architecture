module ALU(out_sig, zero, a, b, alu_ct);
  output reg [31:0]out_sig;
  output zero;
  input [31:0]a;
  input [31:0]b;
  input [3:0]alu_ct;
  assign zero = (out_sig==0);
  always @ ( alu_ct, a, b) begin
	case ( alu_ct)
	0: out_sig <= a & b; // and
	1: out_sig <= a | b;  // or
	2: out_sig <= a + b; // add
	6: out_sig <= a - b; // subract
	default: out_sig <= 0; // should not happen
	endcase
   end
endmodule