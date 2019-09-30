// file: BSTC.v
// author: @amrgouhar

`timescale 1ns/1ns

module BSTC(a, s, clk, rst, start);
    input a;
    input clk;
    input rst;
    input start;
    output reg s;
        
    reg z;
    
    wire T=a | z;
    
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
           s <= 1'b0;
           z <= 1'b0;
        end
        else if(start) begin
           s <= 1'b0;
           z <= 1'b0;
        end
        else begin
            s <= a ^ z; 
            z <= T;
        end
    end
    
endmodule