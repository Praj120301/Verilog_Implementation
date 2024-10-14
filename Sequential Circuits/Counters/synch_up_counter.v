`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 04:51:18 AM
// Design Name: 
// Module Name: synch_up_counter
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



module synch_up_counter(
                        input clk,
                        input reset_n,
                        output [3:0]q
                        );
                        wire q0next,q1next,q2next,q3next;
                        
                        assign q0next=1'b1;
                        
                        t_ff ff0(.t(q0next),
                                 .reset_n(reset_n),
                                 .clk(clk),
                                 .q(q[0]),
                                 .qb());
                                 
                        assign q1next=q0next&q[0];     
                        t_ff ff1(.t(q1next),
                                 .reset_n(reset_n),
                                 .clk(clk),
                                 .q(q[1]),
                                 .qb());
                         assign q2next=q1next&q[1];
                         t_ff ff2(.t(q2next),
                                 .reset_n(reset_n),
                                 .clk(clk),
                                 .q(q[2]),
                                 .qb());
                          assign q3next=q2next&q[2]; 
                          t_ff ff3(.t(q3next),
                                 .reset_n(reset_n),
                                 .clk(clk),
                                 .q(q[3]),
                                 .qb());
                        
                        
endmodule
