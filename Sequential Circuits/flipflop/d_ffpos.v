`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2024 03:34:33 PM
// Design Name: 
// Module Name: d_ffpos
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module d_ffpos (input d,
                input clk,
                output reg q);
                always@(posedge clk)
                begin
                    q=d;
                end
endmodule
