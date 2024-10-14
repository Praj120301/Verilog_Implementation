`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2024 08:33:56 PM
// Design Name: 
// Module Name: mux_2x1_nbit
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


module mux_2x1_nbit #(parameter n=3)(
    input [n-1:0]w0,w1,
    output reg [n-1:0]f,
    input s
    );
    always @(w0 or w1 or s)
    begin 
        f=s?w1:w0;
    end
    
endmodule
