`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 08:36:41 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder 
(   input x,
    input y,
    input cin,
    output s,
    output cout
    );
    wire s1,c1,c2;
    half_adder h1(.x(x),
                   .y(y),
                   .s(s1),
                   .c(c1));
    half_adder h2(.x(s1),
                   .y(cin),
                   .s(s),
                   .c(c2));
     or (cout,c2,c1);    
endmodule
