`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2024 03:42:24 PM
// Design Name: 
// Module Name: encoder_4x2
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


module encoder_4x2(
    input [3:0] w,
    output reg [1:0] y
);
    always@(w)
    begin
    y='bx;
        case(w)
        4'b0001:y=0;
        4'b0010:y=2'b01;
        4'b0100:y=2'b10;
        4'b1000:y=2'b11;
        default:y='bx;
        endcase
    end
    



endmodule
