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
	input semitone,
	input [7:0] diods,
   output reg wave
   );
	 
	localparam 	c = 500000000/(2626*2),
					cis = 500000000/(2771*2),
					d = 500000000/(2947*2), 
					dis = 500000000/(3111*2),
					e = 500000000/(3306*2),
					f = 500000000/(3492*2),
					fis = 500000000/(3700*2),
					g = 500000000/(3920*2),
					gis = 500000000/(4153*2),
					a = 500000000/(4400*2),
					ais = 500000000/(4662*2),
					h = 500000000/(4949*2),
					C = 500000000/(5232*2),
					Cis = 500000000/(5544*2),
					D = 500000000/(5873*2),
					Dis = 500000000/(6223*2),
					E = 500000000/(6593*2),
					F = 500000000/(6985*2),
					Fis = 500000000/(7400*2),
					G = 500000000/(7840*2),
					Gis = 500000000/(8306*2),
					A = 500000000/(8800*2),
					Ais = 500000000/(9323*2),
					H = 500000000/(9888*2),
					C3 = 500000000/(10465*2),
					C3is = 500000000/(11087*2);
	
	reg [25:0] counter;
	reg [25:0] counter2;
	reg [25:0] counter3;
	reg [25:0] div;
	reg make_semitone;
	
	always @(posedge rst or posedge clk)
	if(rst)
		make_semitone <= 1'b0;
	else
		if(semitone)
		begin
			make_semitone <= 1'b1;
			counter3 <= 0;
		end
		else
		begin
			counter3 <= counter3 + 1;
			if(counter3 >= 2500000)
			begin
				counter3 <= 0;
				make_semitone <= 1'b0;
			end
		end
	 
	always @(posedge rst or posedge clk)
	begin
		if (rst)
            div <= 0;
		else
		begin
			case(~diods)
				8'b11101110:
				begin
					if(make_semitone)
						div <= cis;
					else
						div <= c;
					counter2 <= 0;
				end
				8'b11101101:
				begin
					if(make_semitone)
						div <= dis;
					else
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
					if(make_semitone)
						div <= fis;
					else
						div <= f;
					counter2 <= 0;
				end
				8'b11011110:
				begin
					if(make_semitone)
						div <= gis;
					else
						div <= g;
					counter2 <= 0;
				end
				8'b11011101:
				begin
					if(make_semitone)
						div <= ais;
					else
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
					if(make_semitone)
						div <= Cis;
					else
						div <= C;
					counter2 <= 0;
				end
				8'b10111110:
				begin
					if(make_semitone)
						div <= Cis;
					else
						div <= C;
					counter2 <= 0;
				end
				8'b10111101:
				begin
					if(make_semitone)
						div <= Dis;
					else
						div <= D;
					counter2 <= 0;
				end
				8'b10111011:
				begin
					div <= E;
					counter2 <= 0;
				end
				8'b10110111:
				begin
					if(make_semitone)
						div <= Fis;
					else
						div <= F;
					counter2 <= 0;
				end
				8'b01111110:
				begin
					if(make_semitone)
						div <= Gis;
					else
						div <= G;
					counter2 <= 0;
				end
				8'b01111101:
				begin
					if(make_semitone)
						div <= Ais;
					else
						div <= A;
					counter2 <= 0;
				end
				8'b01111011:
				begin
					div <= H;
					counter2 <= 0;
				end
				8'b01110111:
				begin
					if(make_semitone)
						div <= C3is;
					else
						div <= C3;
					counter2 <= 0;
				end
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
