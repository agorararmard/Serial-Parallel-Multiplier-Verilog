// file: BSA.v
// author: @amrgouhar

`timescale 1ns/1ns

//Bit serail carry save adder
module BSA(x,y,clk, rst, s, start);
input x;
input y;
input clk;
input rst;
input start;
output reg s; 
wire car1;
reg car2;
wire fs;

FA fa(.a(x), .b(y), .c(car2), .cout(car1), .out(fs));
always @(posedge clk or negedge rst)begin
        if (!rst)
            begin
                s <= 1'b0;
                car2 <= 1'b0;
            end
        else
        if(start)
            begin
            s <= 1'b0;
            car2 <= 1'b0;
        end
        else
            begin
                s <= fs;
                car2 <= car1;
            end
    end
endmodule

