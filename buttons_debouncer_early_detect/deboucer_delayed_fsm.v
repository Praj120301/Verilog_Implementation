`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2024 12:29:14 PM
// Design Name: 
// Module Name: debouncer_delayed_fsm
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

//moore cqt
module debouncer_delayed_fsm(
                                input clk,reset_n,
                                no,td,
                                output deb,tr);//input :-noisy and timerdone
                                               //output timerreset, debounce(on)
                                reg [1:0] statereg,statenext;
                                parameter s0=2'b00;
                                parameter s1=2'b01;
                                parameter s2=2'b10;
                                parameter s3=2'b11;
                                
                                always@(posedge clk,negedge reset_n)
                                begin
                                if(~reset_n)
                                statereg<=s0;
                                else 
                                statereg<=statenext;
                                end
                                
                                always@(*)
                                begin
                                    statenext=statereg;//default value
                                    case(statereg)
                                        s0:begin
                                            if(~no)
                                                statenext=s0;
                                            else if(no)
                                                statenext=s1;
                                            end
                                        s1:begin
                                            if(~no)
                                                statenext=s0;
                                            else if(no&~td)
                                                statenext=s1;
                                            else if(no&td)
                                                statenext=s2;
                                                                                           
                                            end
                                        s2:begin
                                            if(no)
                                            statenext=s2;
                                            else if(~no)
                                            statenext=s3;
                                            
                                            end
                                        s3:begin
                                            if(no)
                                            statenext=s2;
                                            else if(~no&~td)
                                            statenext=s3;
                                            else if(~no&td)
                                            statenext=s0;
                                            end
                                       endcase
                                end
                                //output logic
                                assign tr=(statereg==s0)|(statereg==s2);
                                assign deb=(statereg==s1)|(statereg==s3);
                                
endmodule
