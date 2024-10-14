`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2024 03:45:08 PM
// Design Name: 
// Module Name: comp_storage_ele_tb
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


module comp_storage_ele_tb();
reg d,clk;
wire qlatch,qffpos,qffneg;

comp_storage_ele uut(
                    .d(d),
                    .clk(clk),
                    .qa(qlatch),
                    .qb(qffpos),
                    .qc(qffneg));
                    
    localparam t=20;//clk period
    //generate clock
    always
    begin
    clk=1'b0;
    #(t/2);
    clk=1'b1;
    #(t/2);
    end
    
    initial 
    begin
    
    d=1'b0;
    #(t);
    d=1'b1;
    @(posedge clk);
    d=1'b0;
    
    repeat(2) @(negedge clk);
    d=1'b1;
    end
    
endmodule
