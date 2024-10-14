`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2024 04:08:50 PM
// Design Name: 
// Module Name: bcd_counter
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


module bcd_counter( input clk,
                    input enable,
                    input reset_n,
                    output done,
                    output [3:0]q);//q can go upt 15 but we will only limit till 9
reg [3:0]qreg,qnext;
//sequential logic
    always@(posedge clk,negedge reset_n)
    begin
        if(~reset_n)
        qreg<='b0;
        else if(enable)
        qreg<=qnext;
        else 
        qreg<=qreg;
    end
    //comibnation part(next start part)
    assign done =(qreg==9); //exit statement which means the counter will reset to zero once done is high
    
    always@(done or qreg)
    begin
        qnext=done?'b0:qreg+1;
    end
    //output logic
    assign q=qreg;
endmodule
