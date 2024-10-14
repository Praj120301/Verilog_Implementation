`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2024 08:48:53 PM
// Design Name: 
// Module Name: decoder_2x4_en
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


module decoder_2x4_en(
    input [1:0]w,
    output reg [0:3]y,
    input en
    );
    
    always @(w or en)
    begin
    y=4'b0000; //default
    if(en)
            //y[w]=1'b1;
              case(w)
        0:y=4'b1000;
        1:y=4'b0100;
        2:y=4'b0010;
        3:y=4'b0001;
        endcase
    else 
            y=4'b0000;

    end
endmodule
