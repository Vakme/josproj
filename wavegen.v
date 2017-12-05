`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:25 11/28/2017 
// Design Name: 
// Module Name:    wavegen 
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
module wavegen(
    input clk,
	 input rst,
	 input [7:0] diods,
    output reg wave
    );
	 
	 localparam c = 2626, 
					d = 2947, 
					e = 3306, 
					f = 3492, 
					g = 3920, 
					a = 4400,
					h = 4949, 
					C = 5232, 
					D = 5873, 
					E = 6593, 
					F = 6985, 
					G = 7840, 
					A = 8800, 
					H = 9888, 
					idle = 1; 
	 
	 signalscaler #(.freq(c)) clkdivwave1(.rst(rst), .clk(clk), .scaledsignal(scaleC));
	 signalscaler #(.freq(d)) clkdivwave2(.rst(rst), .clk(clk), .scaledsignal(scaleD));
	 signalscaler #(.freq(e)) clkdivwave3(.rst(rst), .clk(clk), .scaledsignal(scaleE));
	 signalscaler #(.freq(f)) clkdivwave4(.rst(rst), .clk(clk), .scaledsignal(scaleF));
	 signalscaler #(.freq(g)) clkdivwave5(.rst(rst), .clk(clk), .scaledsignal(scaleG));
	 signalscaler #(.freq(a)) clkdivwave6(.rst(rst), .clk(clk), .scaledsignal(scaleA));
	 signalscaler #(.freq(h)) clkdivwave7(.rst(rst), .clk(clk), .scaledsignal(scaleH));
	 signalscaler #(.freq(C)) clkdivwave8(.rst(rst), .clk(clk), .scaledsignal(scaleHighC));

	 signalscaler #(.freq(idle)) clkdivwave0(.rst(rst), .clk(clk), .scaledsignal(scaleNone));
	 
	 always @*
	 begin
		case(~diods)
			8'b11101110:
				wave = scaleC;
			8'b11101101:
				wave = scaleD;
			8'b11101011:
				wave = scaleE;
			8'b11100111:
				wave = scaleF;
			8'b11011110:
				wave = scaleG;
			8'b11011101:
				wave = scaleA;
			8'b11011011:
				wave = scaleH;
			8'b11010111:
				wave = scaleHighC;
			default:
				wave = 0;
		endcase
	 end
			
	 

endmodule
