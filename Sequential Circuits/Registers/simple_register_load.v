`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2024 08:00:54 PM
// Design Name: 
// Module Name: simple_register_load
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


module simple_register_load #(parameter n=4)(

                                                input clk,
                                                input [n-1:0] I,
                                                input load,
                                                output [n-1:0]Q

    );
    reg  [n-1:0] qreg,qnext;
    always@(posedge clk)
    begin
        qreg<=qnext;
    end
    
/*always@(I)
    begin
        qnext=I;
    end*/
    always @(I,load)
    begin
      
        if(load)
            qnext=I;
        else
            qnext=qreg;
    end
    
    assign Q=qreg;
endmodule
