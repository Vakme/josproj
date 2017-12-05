`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:32:57 11/21/2017 
// Design Name: 
// Module Name:    keyboard 
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
module keypad(
	 input clk,
	 //input rst,
	 input [3:0] row,
	 output [3:0] col,
    output reg [7:0] diods
    );
	 
	 localparam [3:0] C1 = 4'b0111, C2 = 4'b1011, C3 = 4'b1101, C4 = 4'b1110, idle = 4'b1111;
	 reg [3:0] st = idle, nst = idle;
	 
	 always @(posedge clk)
	 begin
		st <= nst;
	 end
	 
	 always @(posedge clk)
	 begin
		if(row == C1 || 
			row == C2 ||
			row == C3 ||
			row == C4)
			diods <= ~{row, col};
		else
			diods <= ~{idle, idle};
			
	 end
	 
	 always @*
	 begin
		case(st)
			idle:
				nst = C1;
			C1: 
				nst = C2;
			C2: 
				nst = C3;
			C3: 
				nst = C4;
			C4: 
				nst = idle;
			default:
				nst = idle;
		endcase
	 end

	assign col = st;
	//assign diods = ~{row, col};

endmodule
