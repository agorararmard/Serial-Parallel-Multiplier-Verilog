// file: mux.v
// author: @amrgouhar

`timescale 1ns/1ns

module mux2x1(x0, x1, sel, out);

parameter n =1;

input[n-1:0] x0, x1;
input sel;
output [n-1:0] out;

assign {out} = (sel)? {x1}:{x0};

endmodule
