`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2024 12:40:39 AM
// Design Name: 
// Module Name: simple_register_behv
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


module simple_register_behv#(parameter n=4)(
                                                input clk,
                                                input [n-1:0] I,
                                                output [n-1:0]Q

    );
    reg  [n-1:0] qreg,qnext;
    always@(posedge clk)
    begin
        qreg<=qnext;
    end
    
    always@(I)
    begin
        qnext=I;
    end
    
    assign Q=qreg;
endmodule
