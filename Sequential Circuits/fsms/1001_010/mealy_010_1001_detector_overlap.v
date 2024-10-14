`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2024 09:34:51 PM
// Design Name: 
// Module Name: mealy_010_1001_detector_overlap
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


module mealy_010_1001_detector_overlap(

                         input reset_n,
                         input clk,
                         input x,
                         output y,
                         output reg [2:0] statereg );//7states
                         reg [2:0] statenext;
                         localparam s0=3'b000;
                         localparam s1=3'b001;
                         localparam s2=3'b010;
                         localparam s3=3'b011;
                         localparam s4=3'b100;
                         localparam s5=3'b101;
                         localparam s6=3'b110;
                         
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
                                             statenext=s4;
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
                                             statenext=s4;
                                        else
                                             statenext=s3;
                                    end
                                s3:
                                begin
                                         if(x)
                                             statenext=s2;//overlapping
                                         else
                                             statenext=s6;
                                         end
                                s4:
                                begin
                                         if(x)
                                             statenext=s4;
                                         else
                                             statenext=s5;
                                         end
                                s5:
                                begin
                                         if(x)
                                             statenext=s2;
                                         else
                                             statenext=s6;
                                         end
                                s6:
                                begin
                                         if(x)
                                             statenext=s2;
                                         else
                                             statenext=s1;
                                         end
                            endcase
                            
                         end
                         //output logic
                         assign y=((statereg==s6)&x)|((statereg==s2)&(~x));
                         
endmodule
