`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2024 01:28:38 PM
// Design Name: 
// Module Name: debouncer_instantiation
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


module debouncer_instantiation(
                               input clk,
                               input reset_n,
                               input noisy,
                               output debounced);
                               wire timer_done,timer_reset;
                               debouncer_delayed_fsm fsm0(
                                .clk(clk),
                                .reset_n(reset_n),
                                .no(noisy),
                                .td(timer_done),
                                .deb(debounced),
                                .tr(timer_reset));
                                
                                
              timer#(.n(19999999) ) T0
              (
             .reset_n(~timer_reset),
             .en(~timer_reset),
             .clk(clk),
             .done(timer_done)
             );
             
endmodule
