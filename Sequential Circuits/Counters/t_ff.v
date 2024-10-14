`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 01:01:06 AM
// Design Name: 
// Module Name: t_ff
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


module t_ff( input t,reset_n,clk,
             output q,qb);
             
             
             localparam c2q_delay=2;
             reg qreg;
             wire qnext;
             always@(posedge clk or negedge reset_n)
             begin
                if(~reset_n)
                    qreg<=1'b0;
                else 
                //   #c2q_delay
                    qreg<=qnext;
             end
             assign qnext=t?(~qreg):qreg; //this is for t part
             
             //output logic
             assign q=qreg;
             assign qb=~qreg;
endmodule
