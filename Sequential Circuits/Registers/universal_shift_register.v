`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2024 03:50:23 AM
// Design Name: 
// Module Name: universal_shift_register
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


module universal_shift_register#(parameter n=64)(
                                                input clk,reset_n,
                                                input msbin,input lsbin,
                                                input [n-1:0] I,
                                                input [1:0]s,
                                                output [n-1:0] q
                                                );
                                                reg [n-1:0] qreg,qnext;
                                                always@(posedge clk or negedge reset_n) //synchronous reset with latch
                                                begin 
                                                    if(!reset_n)
                                                    qreg<=0;
                                                    else
                                                    qreg<=qnext;
                                                end
                                                assign q=qreg;//output logic
                                                always@(qreg,msbin,lsbin,I)
                                                begin
                                                    qnext=qreg; //default 
                                                    case(s)
                                                        2'b00:qnext=qreg;//remains same
                                                        2'b01:qnext={msbin,qreg[n-1:1]};//right shift 
                                                        2'b10:qnext={qreg[n-2:0],lsbin};//left shift
                                                        2'b11:qnext=I;//parallel in
                                                        default:qnext=qreg;
                                                    endcase
                                                end
                                                
endmodule
