`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2024 07:23:33 PM
// Design Name: 
// Module Name: rca_4bit
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


module rca_4bit(
    input [3:0]x,
    input [3:0]y,
    output [3:0]s,
    input cin,
    output cout
    );
    wire c[3:1];
    full_adder fa0(.x(x[0]),.y(y[0]),.cin(cin),.s(s[0]),.cout(c[1]));
    full_adder fa1(.x(x[1]),.y(y[1]),.cin(c[1]),.s(s[1]),.cout(c[2]));
    full_adder fa2(.x(x[2]),.y(y[2]),.cin(c[2]),.s(s[2]),.cout(c[3]));
    full_adder fa3(.x(x[3]),.y(y[3]),.cin(c[3]),.s(s[3]),.cout(cout));
endmodule