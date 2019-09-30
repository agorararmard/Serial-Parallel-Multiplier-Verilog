// file: FA.v
// author: @amrgouhar

`timescale 1ns/1ns

module FA(a,b,c,out, cout);
input a,b,c;
output out, cout;

assign out = a^b^c;
assign cout = ((a^b)&c)|(a&b);
endmodule