`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 08:49:16 PM
// Design Name: 
// Module Name: alu1bit
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


module alu1bit(
                input a, 
                input b,
                input less,
                input cin,
                input ainv,
                input binv,
                input [1:0] select,
                output result,
                output cout);
                
                wire aprime,bprime;
                wire andout,orout,addout;
                
                mux_2x1 m0(.x1(a),.x2(~a),.s(ainv),.f(aprime));
                mux_2x1 m1(.x1(b),.x2(~b),.s(binv),.f(bprime));
                and     a0(andout,aprime,bprime);
                or      o0( orout,aprime,bprime);
                full_adder f0(.x(aprime),.y(bprime),.cin(cin),.s(addout),.cout(cout));
                mux_4x1    mux1(.x0(andout),.x1(orout),.x2(addout),.x3(less),.s0(select[0]),.s1(select[1]),.f(result));
                
                
                
endmodule
