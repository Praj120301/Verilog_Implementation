`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2024 03:00:55 PM
// Design Name: 
// Module Name: mux_generic_1bit
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


module mux_generic_1bit #(parameter INS=4)
(
input [INS-1:0] w,
input [$clog2(INS):0]s,
output reg f);
integer k; //we use integer and not generate since this behavioural and not structural
always @(w,s)
begin   
    f='bx;
    for(k=0;k<INS;k=k+1) 
        if(k==s)
            f=w[k];
end
endmodule
