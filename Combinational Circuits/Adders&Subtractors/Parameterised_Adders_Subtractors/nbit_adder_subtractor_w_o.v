`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2024 04:35:04 PM
// Design Name: 
// Module Name: nbit_adder_subtractor_w_o
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


module nbit_adder_subtractor_w_o #(parameter n=64) (
input [n-1:0] x,y,
output [n-1:0]sum,
output cout,
input add_n,
output overflow

);
wire overflow1,overflow2;
wire [n-1:0] xored_y;
generate
    genvar i;
    for(i=0;i<n;i=i+1)
    begin
        assign  xored_y[i]=add_n^y[i];
    end
endgenerate


             rca_nbit #(.n(n)) 
             a0(
             .x(x),
             .y(xored_y),
             .s(sum),
             .cin(add_n), 
             .cout(cout)
             
             );
   assign overflow1=((x[n-1] )& (xored_y[n]) & (~sum[n-1])); 
   assign overflow2=   ((~x[n-1])& (~xored_y[n-1]) &(sum[n-1]));
   assign overflow=overflow1|overflow2; 
endmodule
