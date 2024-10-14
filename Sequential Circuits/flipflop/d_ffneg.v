`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2024 03:09:04 PM
// Design Name: 
// Module Name: d_ffneg
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


module d_ffneg(
                input d,
                input clk,
                output reg q);
                always@(negedge clk)
                begin
                    q=d;
                end
endmodule
