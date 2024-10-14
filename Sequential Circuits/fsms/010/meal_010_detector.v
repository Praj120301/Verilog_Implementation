`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2024 07:36:57 PM
// Design Name: 
// Module Name: meal_010_detector
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


module meal_010_detector(
                         input reset_n,
                         input clk,
                         input x,
                         output y,
                         output reg [1:0] statereg );
                         
                         reg [1:0] statenext;
                         localparam s0=2'b00;
                         localparam s1=2'b01;
                         localparam s2=2'b10;
                         //sequential logic remains the same no matter what
                         always@(posedge clk,negedge reset_n)
                         begin
                            if(~reset_n)
                                statereg<=s0;
                            else
                            statereg<=statenext;
                         end
                         
                         //combinational logic this is where the statediagram is expressed
                         always@(*)
                         begin
                            case(statereg)
                            
                                s0: begin
                                        if(x)
                                             statenext=s0;
                                        else
                                             statenext=s1;
                                    end
                                s1: begin
                                        if(x)
                                             statenext=s2;
                                        else
                                             statenext=s1;
                                    end
                                s2: begin
                                         if(x)
                                             statenext=s0;
                                        else
                                             statenext=s1;
                                    end
                            endcase
                            
                         end
                         
                         assign y=(statereg==s2)&(~x);
                         
                         
endmodule
