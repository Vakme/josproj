`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:32:13 12/05/2017 
// Design Name: 
// Module Name:    signalscaler 
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
module signalscaler #(parameter freq = 440)(
input clk,
input rst,
output reg scaledsignal
    );

reg [25:0] counter;

localparam procFreq = 500000000;

localparam div = procFreq/(freq*2);

always@(posedge rst or posedge clk)
begin
    if (rst)
        begin
				scaledsignal <= 0;
            counter <= 0;
        end
    else
        begin
            counter <= counter + 1;
            if ( counter == div)
                begin
                    counter <= 0;
                    scaledsignal <= ~scaledsignal;
                end
        end
end
endmodule  

