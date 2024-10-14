`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2024 02:53:38 PM
// Design Name: 
// Module Name: nbit_moduluscounter
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

//could be used for for loops
module nbit_moduluscounter #( parameter final=7)(input clk,reset_n,enable,output [bits-1:0] q

    );//ignore warning
    localparam bits=$clog2(final);
    
    reg [bits-1:0] qreg,qnext;
    wire done;
    
    //sequential logic remains unchanged
    always@(posedge clk,negedge reset_n)
    begin
        if(~reset_n)
             qreg='b0;
        else if(enable)
             qreg<=qnext;
        else qreg<=qreg;//hold value
    end
    
    assign done= (qreg==final);
    always@(done,qreg)
    begin
        qnext=done?'b0:qreg+1;
    end
    
    assign q=qreg;
    endmodule
//to get a bcd counter put parametr as 10 and expose the done,which means just treat done as a output instead of a wire