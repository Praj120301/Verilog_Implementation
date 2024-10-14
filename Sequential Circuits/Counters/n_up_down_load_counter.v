`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2024 01:28:54 PM
// Design Name: 
// Module Name: n_up_down_load_counter
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


module n_up_down_load_counter#(parameter n=4)(input clk,reset_n,enable,up,load,
                                              input [n-1:0] d,
                                              output [n-1:0] q);
reg [n-1:0] qnext,qreg;
always @(posedge clk, negedge reset_n)
begin
    if(reset_n)
         qreg<='b0;
    else if(enable)
         qreg<=qnext;
    else 
         qreg<=qreg;
end
//combination logic
/*always@(up,qreg)
begin
    qnext=qreg;//default value if enable is zero
    if(up)
        qnext=qreg+1;
    else 
        qnext=qreg-1;
end*/ //without load logic

always@(up,qreg,load,d)
begin 
    qreg=qnext;//default case so no latch is produced in the combinational end
    case({load,up})
        2'b00:qnext=qreg-1;
        2'b01:qnext=qreg+1;
        2'b10:qnext=d;//when loading d ,load has to be on and turned of immediately otherwise counting might not happen since it will create a infinite fsm
        2'b11:qnext=d;  
    endcase
end

assign q=qreg;
endmodule
