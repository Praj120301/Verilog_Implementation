`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2024 01:04:09 PM
// Design Name: 
// Module Name: timer
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


module timer#(parameter n=255)(input reset_n,
             input en,
             input clk,
             output done);
             localparam bits=$clog2(n);
             reg [bits-1:0]statereg;
             reg [bits-1:0] statenext;
             
             always@(posedge clk,negedge reset_n)
             begin
                if(~reset_n)
                statereg<='b0;
                else if(en)
                statereg<=statenext;
                else statereg<=statereg;
             end
             
             always@(*)
             begin
                statenext=done?'b0:statereg+1;
             end
             assign done=(statereg==n);
             
             
             
endmodule
