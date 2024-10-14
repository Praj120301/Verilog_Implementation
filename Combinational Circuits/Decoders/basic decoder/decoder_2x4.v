`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2024 08:29:02 PM
// Design Name: 
// Module Name: decoder_2x4
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


module decoder_2x4(
    input [1:0]w,
    output reg [0:3]y
    );
    
    always @(w)
    begin
    y=4'b0000; //default
    
    y[w]=1'b1;
    end
    
    
endmodule




 
     //using if
     /*   if(w==2'b00)
            y=4'b1000;
        else if (w==2'b01)
            y=4'b0100;
        else if (w==2'b10)
            y=4'b0010;
        else  if(w==2'b11)
            y=4'b0001;
        else y=4'b0000;*/     
        //using case 
    /*    case(w)
        0:y=4'b1000;
        1:y=4'b0100;
        2:y=4'b0010;
        3:y=4'b0001;
        endcase*/