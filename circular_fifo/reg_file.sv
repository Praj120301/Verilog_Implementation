`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2025 18:15:25
// Design Name: 
// Module Name: reg_file
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


module reg_file #(address_width=3,data_width=8)
                 (input logic clk,
                  input logic w_en,
                  input logic [address_width-1:0] write_address,
                  input logic [address_width-1:0] read_address,
                  input logic [data_width-1:0]    write_data,
                  output logic [data_width-1:0]   read_data);
                  
                  logic [data_width-1:0]mem[0:(2**address_width) -1];
                  
                  always_ff@(posedge clk)
                  begin
                    if(w_en)
                        mem[write_address]<=write_data;
                  end
                  
                  // read
                  assign read_data=mem[read_address];
endmodule
