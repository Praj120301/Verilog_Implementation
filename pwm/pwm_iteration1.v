`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2024 11:24:55 AM
// Design Name: 
// Module Name: pwm_iteration1
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

module pwm_iteration1#(resolution=8)
                                    (
                                        input reset_n,
                                        input clk,
                                        input [resolution-1:0] dutyval,
                                        output [resolution-1:0] out,
                                      output done
                                        );
                                        reg [resolution-1:0] qreg,qnext;
                                        
                                        always@(posedge clk,negedge reset_n)
                                        begin
                                            if(~reset_n)
                                                qreg<='b0;
                                            else 
                                                qreg<=qnext;
                                        end
                                       assign done =(qreg==(2**resolution-1));
                                        always@(*)
                                        begin
                                            qnext=done?'b0:(qreg+1);
                                        end
                                        //output logic 
                                        assign out=(qreg<dutyval);
endmodule