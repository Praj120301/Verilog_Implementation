`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2024 09:01:57 PM
// Design Name: 
// Module Name: coding_guidelines
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


module coding_guidelines(
                         input a,b,c,clk,
                         output f,g
                         );
reg freg,fnext,greg,gnext;

always @(posedge clk)
begin
freg<=fnext;
greg<=gnext;
end

//next state logic
always@(a,b,c,greg)
begin
    gnext=b|c;
    fnext=a&(~greg);
end

//outputlogic
assign f=freg;
assign g=greg;

endmodule
