`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2024 10:43:18 PM
// Design Name: 
// Module Name: multi_decade_counter
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


module multi_decade_counter(
                            input reset_n,clk,enable,done,
                            output [3:0] onesplace,tensplace,hundredsplace);
                            
                            wire a0,a1,a2;
                            wire done0,done1,done2;
                            
                            bcd_counter c0(.enable(enable),
                                           .clk(clk),
                                           .reset_n(reset_n),
                                           .done(done0),
                                            .q(onesplace)
                                            );
                                            assign a0=enable&done0;
                                            
                             bcd_counter c1(.enable(a0),
                                           .clk(clk),
                                           .reset_n(reset_n),
                                           .done(done1),
                                            .q(tensplace)
                                            );
                                            assign a1=done1&a0;
                                            
                             bcd_counter c2(.enable(a1),
                                           .clk(clk),
                                           .reset_n(reset_n),
                                           .done(done2),
                                            .q(hundredsplace)
                                            );                
                            assign a2=a1&done2;
                            
                            assign done=a2;
                            
endmodule
