`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 04:08:30 PM
// Design Name: 
// Module Name: fsm_101_tb
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


module fsm_101_tb();
            reg clk,reset_n,x;
            wire y_mealy,y_moore;
            
            mealy_detector_101 dut0(
                           .reset_n(reset_n),
                           .clk(clk),
                           .x(x),
                           .y(y_mealy));
            moore_detector_101 dut1(
                          .reset_n(reset_n),
                          .clk(clk),
                          .x(x),
                          .y(y_moore));
                          
                          localparam t=10;
                          always begin
                          clk=1'b0;
                          #(t/2);
                          clk=1'b1;
                          #(t/2);
                          end
                          
             initial begin
             reset_n=1'b0;
             #10 reset_n=1'b1;
             x=1'b0;
             #(t)
             x=1'b0;
             #(t)
             x=1'b1;
             #(t)
             x=1'b0;
             #(t)
             x=1'b1;
             #(t)
             x=1'b0;
             end      
                          
endmodule
