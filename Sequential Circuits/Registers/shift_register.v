`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2024 08:19:07 PM
// Design Name: 
// Module Name: shift_register
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


module shift_register#(parameter n=4)(
                                                input clk,
                                                input si,
                                                output [n-1:0]Q,//if you care about output
                                                output so

    );
    reg  [n-1:0] qreg,qnext;
    always@(posedge clk)
    begin
        qreg<=qnext;
    end
    

    always@(si,qreg)
    begin
        qnext={si,qreg[n-1:1]};//righ shift
        //left shift
        //qnext={[n-2:0]:si};
    end
    
    assign Q=qreg;
    assign so=qreg[0];//right shift
endmodule
