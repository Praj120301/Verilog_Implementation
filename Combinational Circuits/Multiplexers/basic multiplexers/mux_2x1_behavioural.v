`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 12:12:41 PM
// Design Name: 
// Module Name: mux_2x1_behavioural
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


module mux_2x1_behavioural(
    input x1,
    input x2,
    input s,
    output reg f
    );
    always @(x1,x2,s)
    begin 
       /* if(s)
          begin
            f=x1;
          end
        else
          begin
            f=x2;
          end*/
          case(s)
            1:f=x2;
            0:f=x1;
          endcase
    end
endmodule
