`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 03:44:25 PM
// Design Name: 
// Module Name: mealy_detector_101
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


module mealy_detector_101(
                          input reset_n,
                          input clk,
                          input x,
                          output y);
                          
                          reg [1:0] statereg,statenext;
                          
                          localparam s0=2'b00;
                          localparam s1=2'b01;
                          localparam s2=2'b10;
                          localparam s3=2'b11; 
                          //sequential logic
                          always@(posedge clk,negedge reset_n)
                          begin
                                if(~reset_n)
                                    statereg<=s0;//s0 is considered as reset state
                                else 
                                    statereg<=statenext;   
                          end
                          
                          //next state logic
                          always@(*)
                          begin
                            case(statereg)
                                s0:begin
                                       if(x)
                                       statenext=s1;
                                       else
                                       statenext=s0;
                                   end
                                s1:begin
                                       if(x)
                                       statenext=s1;
                                       else
                                       statenext=s2;
                                   end
                                s2:begin
                                       if(x)
                                       statenext=s1;
                                       else
                                       statenext=s0;
                                   end
                                 default: statenext=statereg;
                            endcase
                          end
                          
                          
                         assign y= (statereg==s2)&x;
endmodule
