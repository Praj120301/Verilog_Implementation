`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2024 12:38:04 PM
// Design Name: 
// Module Name: a_operators
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


module a_operators #(parameter n=4)(
    input [n-1:0]x,
    input [n-1:0]y,
    output [n-1:0]s,
    output cout,overflow
    
    
    );
    //way1
   // assign s=x+y;  //implementation without carry
   wire [n:0] sum;  ///bigger output for sum with carryy
   
  //way2
 /*  assign sum={1'b0,x}+{1'b0,y}; //expand range of x and y with one bit so but can carry a c out
   assign s= sum[n-1:0];//assign 4 lsbs to the sum
   assign cout=sum[n];*/
   
   
   
   //way3 (automatic expansion)
  /* assign sum=x+y; //verilog tends to expand range automatically
   assign s= sum[n-1:0];//assign 4 lsbs to the sum// be careful about automatic expansion as it could lead to expansion
                        // of signed on unsigned. you can use   *signed input [n-1:0]x,* to declare and the expansion would be better
   assign cout=sum[n];*/
   
   //way 4
  // assign {cout,s}=x+y;//automatic expansion and assignment with c and s
   
   
   //  way 5 with overflow
    assign {cout,s}=x+y;
    assign overflow= (x[n-1]&y[n-1]&~s[n-1])|(~x[n-1]&~y[n-1]&s[n-1]);
   
   
endmodule
