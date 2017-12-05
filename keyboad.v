`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:08:22 11/21/2017 
// Design Name: 
// Module Name:    keyboad 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module keyboad(
    input clk,
	 input rst,
    input [3:0] row,
    output [3:0] col,
    output [7:0] diods,
	 output waveR,
	 output waveL
    );

	clockdiv clkdiv(.rst(rst), .clk(clk), .slow_clk(slow_clk));
	keypad kypd(.clk(slow_clk), .row(row), .col(col), .diods(diods));
	wavegen wavgn(.clk(clk), .diods(diods), .rst(rst), .wave(waveR));
	
	assign waveL = waveR;

endmodule
