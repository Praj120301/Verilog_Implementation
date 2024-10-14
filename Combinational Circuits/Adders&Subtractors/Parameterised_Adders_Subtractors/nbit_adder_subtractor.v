`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2024 11:48:15 PM
// Design Name: 
// Module Name: nbit_adder_subtractor
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


module nbit_adder_subtractor #(parameter n=16) (
input [n-1:0] x,y,
output [n-1:0]sum,
output cout,
input add_n

);
wire [n-1:0] xored_y;
generate
    genvar i;
    for(i=0;i<n;i=i+1)
    begin
        assign  xored_y[i]=add_n^y[i];
    end
endgenerate


             rca_nbit #(.n(n)) a0(
             .x(x),
             .y(xored_y),
             .s(sum),
             .cin(add_n), 
             .cout(cout)
             
             );
endmodule
