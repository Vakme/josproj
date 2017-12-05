`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:10 10/10/2017 
// Design Name: 
// Module Name:    clockdiv 
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
module clockdiv #(parameter div = 10000)(
    input clk,
    input rst,
    output reg slow_clk
    );
    
    localparam nbits = clogb2(div);
    reg [nbits-1:0] cnt;
    
    assign comp = (cnt == div-1);
    
    always @(posedge clk, posedge rst)
        if(rst)
                cnt <= {nbits{1'b0}};
        else if(comp)
                cnt <= {nbits{1'b0}};
        else
                cnt <= cnt + 1;
                
    
    always @(posedge clk, posedge rst)
        if(rst)
                slow_clk <= 1'b0;
        else if(comp)
                slow_clk <= 1'b1;
			 else
				slow_clk <= 1'b0;


    function integer clogb2;
        input reg [31:0] val;
        begin
                val = val-1;
                for(clogb2 = 0; val > 0;  clogb2 = clogb2+1)
                        val = val >> 1;
        end
    endfunction


endmodule
