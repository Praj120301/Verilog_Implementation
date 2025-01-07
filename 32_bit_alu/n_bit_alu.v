`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2024 02:43:39 AM
// Design Name: 
// Module Name: n_bit_alu
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

module  n_bit_alu #(parameter n=32)(
                 input [n-1:0] a,
                 input [n-1:0] b,
                 input cin,
                 input ainv,
                 input binv,
                 input [1:0] select,
                 output [n-1:0]result,
                 output cout
                 );
                 wire c[n:0];
                 assign c[0]=cin;
                 assign cout=c[n];
                         alu1bit a0(.a(a[0]),.b(b[0]),.less(c[n]),.cin(c[0]),.ainv(ainv),.binv(binv),.select(select),.result(result[0]),.cout(c[1]));//first call
                 generate
                     genvar k;
                     for(k=1;k<n;k=k+1)
                     begin : stage 
                        alu1bit a1(.a(a[k]),.b(b[k]),.less(0),.cin(c[k]),.ainv(ainv),.binv(binv),.select(select),.result(result[k]),.cout(c[k+1]));
                     end
                 endgenerate
                 
                 


endmodule
