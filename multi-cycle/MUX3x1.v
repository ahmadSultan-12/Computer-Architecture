module MUX3x1(input [1:0] Sel, input [31:0] A, B, C, output [31:0] O);

    assign O = (Sel[1])? C:(Sel[0]? B:A);

endmodule

