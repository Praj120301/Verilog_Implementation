`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 02:22:09 PM
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


module timer #(parameter bits=4)(
             input clk,
             input reset_n,
             input enable,
             input [bits-1:0] finalvalue,
             output done);
             
             reg [bits-1:0] qreg,qnext;
             always@(posedge clk,negedge reset_n)
             begin
                if(~reset_n)
                qreg<='b0;
                else if(enable)
                qreg<=qnext;
                else qreg<=qreg;
             end
             
             assign done = (qreg==finalvalue);
             
             always@(*)
             begin
                qnext=done?'b0:qreg+1;
             end
endmodule
