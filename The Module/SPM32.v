// file: SPM32.v
// author: @amrgouhar

`timescale 1ns/1ns

module SPM32(x,y,p,clk, rst, start);
    input [31:0]x;
    input y;
    output p;
    input clk;
    input rst;
    input start;
    
    wire[31:0] s;
    
    BSTC tcmp(.a(x[31]&y),.s(s[31]) ,.clk(clk), .rst(rst),.start(start));
    
    genvar i;
    generate
        for(i = 0; i <= 30; i = i+1) begin: addbit
            BSA csa(.x(x[i] & y), .y(s[i+1]), .s(s[i]),.clk(clk), .rst(rst), .start(start));
        end
    endgenerate
    
    assign p = s[0];
    
endmodule