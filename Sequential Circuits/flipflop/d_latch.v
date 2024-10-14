`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2024 05:54:18 PM
// Design Name: 
// Module Name: d_latch
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


 module d_latch(
    input d,
    input clk,
    output reg q,
    output  q_b
    );
    
    assign q_b=~q;
    always@(clk,d)
    begin
        if(clk)
            q=d;
        else 
            q=q;
    end
    
endmodule
