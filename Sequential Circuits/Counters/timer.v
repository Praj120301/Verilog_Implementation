`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2024 08:59:22 PM
// Design Name: 
// Module Name: timer
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


module timer #(parameter finalval=100)(
                                      input clk,
                                      reset_n,
                                      enable,
                                      output done,
                                      output [bits-1:0]q);
    localparam bits=$clog2(finalval);
    reg [bits-1:0] qnext,qreg;
    //sequential logic
    always@(posedge clk,negedge reset_n)
    begin
        if(~reset_n)
            qreg<='b0;
        else if (enable)
            qreg<=qnext;
        else qreg<=qreg;    
    end
    //combinational logic
    assign done=(qreg==finalval);
    always@(*)
    qnext=done?'b0:qreg+1;
    assign q=qreg;
    
endmodule
