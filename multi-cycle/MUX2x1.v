
module MUX2x1(input Sel, input [31:0] A, B, output [31:0] O);

    assign O = (Sel)? B:A;

endmodule
