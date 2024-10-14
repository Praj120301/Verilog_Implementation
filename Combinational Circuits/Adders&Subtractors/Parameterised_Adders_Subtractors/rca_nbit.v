`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2024 09:44:49 PM
// Design Name: 
// Module Name: rca_nbit
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


module rca_nbit #(parameter n=4)(
        input [n-1:0]x,
        input [n-1:0]y,
        output [n-1:0]s ,
        input cin,
        output cout
        );
        wire c[n:0];
        assign c[0]=cin;
        assign cout=c[n];
        generate 
            genvar k;
            for(k=0;k<n;k=k+1)
            begin: stage
                full_adder FA(
                .x(x[k]),
                .y(y[k]),
                .s(s[k]),
                .cin(c[k]),
                .cout(c[k+1])
                );
            end;
            
        endgenerate
endmodule
