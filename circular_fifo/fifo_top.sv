`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2025 19:28:56
// Design Name: 
// Module Name: fifo_top
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


module fifo_top #(parameter addr_width=3,data_width=8)
                 (input logic clk,reset,
                  input logic rd,wr,
                  input logic [data_width-1:0] write_data,
                  output logic [data_width-1:0] read_data,
                  output logic full, empty           
                 );
                 logic [addr_width-1:0] write_address,read_address;
                 reg_file #(.address_width(addr_width),.data_width(data_width))
                                  ( .w_en(wr&~full),.*);
                 fifo_ctrl#(.address_width(addr_width))
                                                  (.*);
                                                
                                                 
endmodule
