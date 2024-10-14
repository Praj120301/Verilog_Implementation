`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2024 03:29:06 AM
// Design Name: 
// Module Name: up_counter_gen_synch_model
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

//also n bit
module up_counter_gen_synch_model #(parameter bits=4)(
                
                                                        input clk,input reset_n,
                                                        output [bits-1:0]q  );
                                                        
                                                        reg [bits-1:0] qreg,qnext;
                                                        
                                                        always@(posedge clk,negedge reset_n)
                                                        begin
                                                         if(~reset_n)
                                                            qreg<='b0;
                                                            else
                                                            qreg<=qnext;
                                                        end
                                                        
                                                        always@(qreg)
                                                        begin
                                                            qnext=qreg+1;
                                                        end
                                                        
                                                        assign q=~qreg; 
                                                        
endmodule
