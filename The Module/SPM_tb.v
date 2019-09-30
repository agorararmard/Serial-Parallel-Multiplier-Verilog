// file: SPM_tb.v
// author: @amrgouhar
// Testbench for SPM

`timescale 1ns/1ns

module SPM_tb;

	//Inputs
	reg signed [31: 0] MP;
	reg signed [31: 0] MC;
	reg start;
	reg clk;
	reg resetn;


	//Outputs
	wire signed [63: 0] P, ref_P;
	wire done, err;


	//Instantiation of Unit Under Test
	SPM uut (
		.MP(MP),
		.MC(MC),
		.start(start),
		.clk(clk),
		.resetn(resetn),
		.P(P),
		.done(done)
	);

    assign ref_P =  MP * MC;
    assign err = done&&(P!= ref_P) && !start;
    
    always #2 clk = ~clk;
    
	initial begin
	//Inputs initialization
		MP = 15;
		MC = -13;
		start = 0;
		clk = 0;
		resetn = 0;
        #10 	resetn = 1;
        start = 1;
		#2 start = 0;
        #500;
        repeat(20) begin
            MP =  $random % 65536;
            MC =  $random % 65536;
            start = 1;
            #2 start = 0;
            #500;
        end
        
	//Wait for the reset
		#100;

	end
	
    always @(posedge done)
    begin
            if(!err)
                begin
                    #5;
                $display("Success");
            end
            else begin
                #5;
                $display("Failure");
            end
    end


endmodule

