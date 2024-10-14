`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 01:13:53 AM
// Design Name: 
// Module Name: asynch_up_counter
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


module asynch_up_counter #(parameter n=4)(   
                                            input clk,
                                            input reset_n,
                                            output [n-1:0] q   
                                          );
                                          wire qbwire[n-2:0];
                                          //first ff
                                          t_ff ff0(
                                                .t(1'b1),
                                                .reset_n(reset_n),
                                                .clk(clk),
                                                .q(q[0]),
                                                .qb(qbwire[0]));
                                                
                                          generate
                                                genvar k;
                                                for(k=1;k<n-1;k=k+1)
                                                begin:stage
                                                    t_ff ff(.t(1'b1),
                                                             .reset_n(reset_n),
                                                             .clk(qbwire[k-1]),
                                                             .q(q[k]),
                                                             .qb(qbwire[k]));
                                                             
                                                end
                                          endgenerate
                                          // finalff
                                          t_ff ffn(
                                                    .t(1'b1),
                                                    .reset_n(reset_n),
                                                    .clk(qbwire[n-2]),
                                                    .q(q[n-1]),
                                                    .qb()
                                                    );                                                    
                                          
endmodule
