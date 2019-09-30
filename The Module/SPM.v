// file: SPM.v
// author: @amrgouhar

`timescale 1ns/1ns

module SPM(MP,MC,start,P,done,clk,resetn);
    input [31:0] MP;
    input [31:0] MC;
    input start;
    output reg  [63:0] P;
    output reg done;
    input clk;
    input resetn;
    
    reg [6:0] index;
    
    
    reg y;
    
    wire p;
    
    wire [63:0] Y;  // make reg and shift inside the always
    assign Y = {{32{MC[31]}},MC};
    
    SPM32 bitX (.x(MP),.y(y),.p(p),.clk(clk),.rst(resetn| start), .start(start));
    
    
    reg en;
    
    
    
    
    
    always @(posedge clk or negedge resetn) begin
        if(!resetn) begin
            index <= 7'b0;
            P = 64'd0;
            en = 1'b0;
            done = 1'b0;
        end
        else begin
        
            if(start) begin
                index <= 7'b0;
                P = 64'd0;
                en = 1'b1;
                done = 1'b0;
            end
            if(en) begin
                if(index == 63)
                    done <= 1'b1;
                index <= index + 1;
                if(index < 64) begin
                    y<= Y[index];
                    // P = {p,P[63:1]};
                    
                    P[63] = p;
                    P = P >> 1;
                    P[63] = p;
                end
                else begin
                    y <= Y[index - 64];
                    // P = {p,P[63:1]};
                    
                    P[63] = p;
                    P = P >> 1;
                    P[63] = p;
                end
                
                if(done)
                    en = 1'b0;
                    
            end
        end
        
    end

endmodule

