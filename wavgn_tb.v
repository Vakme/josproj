`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:26:52 11/28/2017
// Design Name:   wavegen
// Module Name:   /home/lab_jos/bielabra/projekt/project/wavgn_tb.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: wavegen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module wavgn_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire wave;

	// Instantiate the Unit Under Test (UUT)
	wavegen uut (
		.clk(clk), 
		.rst(rst), 
		.wave(wave)
	);

	
	initial begin
		rst = 1'b0;
      #2 rst = 1'b1;
      #2 rst = 1'b0;
    end
        
    initial begin
                clk = 1'b0;
                forever #10 clk = ~clk;
    end
        
    initial #1500 $finish;
      
endmodule

