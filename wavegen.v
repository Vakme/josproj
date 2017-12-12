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
	 
	localparam 	c = 500000000/(2626*2), 
					d = 500000000/(2947*2), 
					e = 500000000/(3306*2),
					f = 500000000/(3492*2),
					g = 500000000/(3920*2),
					a = 500000000/(4400*2),
					h = 500000000/(4949*2),
					C = 500000000/(5232*2),
					D = 500000000/(5873*2),
					E = 500000000/(6593*2),
					F = 500000000/(6985*2),
					G = 500000000/(7840*2),
					A = 500000000/(8800*2),
					H = 500000000/(9888*2);
	
	reg [25:0] counter;
	reg [25:0] counter2;
	reg [25:0] div;
	 
	always @(posedge rst or posedge clk)
	begin
		if (rst)
            div <= 0;
		else
		begin
			case(~diods)
				8'b11101110:
				begin
					div <= c;
					counter2 <= 0;
				end
				8'b11101101:
				begin
					div <= d;
					counter2 <= 0;
				end
				8'b11101011:
				begin
					div <= e;
					counter2 <= 0;
				end
				8'b11100111:
				begin
					div <= f;
					counter2 <= 0;
				end
				8'b11011110:
				begin
					div <= g;
					counter2 <= 0;
				end
				8'b11011101:
				begin
					div <= a;
					counter2 <= 0;
				end
				8'b11011011:
				begin
					div <= h;
					counter2 <= 0;
				end
				8'b11010111:
				begin
					div <= C;
					counter2 <= 0;
				end
				//8'b11111111:
				default:
				begin
					counter2 <= counter2 + 1;
					if(counter2 >= 2500000)
					begin
						counter2 <= 0;
						div <= 25'b1111111111111111111111111;
					end
				end
			endcase
		end
	end	

	always@(posedge rst or posedge clk)
	begin
		if (rst)
		begin
			wave <= 0;
			counter <= 0;
		end
		else
		begin
			counter <= counter + 1;
         if (counter >= div)
         begin
				counter <= 0;
            wave <= ~wave;
         end
		end
	end
	
endmodule
