`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2024 04:39:30 PM
// Design Name: 
// Module Name: priority_generic_encoder
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


module priority_generic_encoder #(parameter N=24)(
                                                 input [N-1:0]w,
                                                 output z,
                                                 output reg[$clog2(N)-1:0]y);
                                                 integer k=0;
                                                 
                                                 
                                                 assign z=|w;
                                                 always @(w)
                                                 begin
                                                 y='bx;
                                                    for(k=0;k<N;k=k+1)
                                                    if(w[k])
                                                        y=k;
                                                 end 
                                                 
endmodule
