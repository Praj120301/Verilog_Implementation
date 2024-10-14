`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 11:07:03 AM
// Design Name: 
// Module Name: mux_2x1_gate
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


module mux_2x1_gate(
    input x1,x2,s,
    output f
    );
    
     and a1(g1,x2,s);
    or  o0(f,g0,g1);
    and a0(g0,x1,~s);
  
endmodule
