// file: HA.v
// author: @amrgouhar

`timescale 1ns/1ns

module HA(a,b,out, cout);
input a;
input b;
output out;
output cout;

assign out = a ^ b;
assign cout = a & b;

endmodule