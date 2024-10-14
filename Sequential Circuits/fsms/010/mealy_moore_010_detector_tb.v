`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2024 07:53:21 PM
// Design Name: 
// Module Name: mealy_moore_010_detector_tb
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


module mealy_moore_010_detector_tb();
reg reset_n,clk,x;
wire y;
wire [1:0] statereg;
moore_010_detector dut(.reset_n(reset_n),
                       .clk(clk),
                       .x(x),
                       .y(y),
                       .statereg(statereg));
            localparam t=10;
                          always
                             begin
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
             x=1'b1;
             #(t)
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
