`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2024 09:05:46 PM
// Design Name: 
// Module Name: uart
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


module uart#(parameter dbit=8,sbtick=16)(
                                         input clk,reset_n,
                                         //reciever
                                         output [dbit-1:0] rdata,
                                         input rduart,
                                         output rxempty,
                                         input rx,
                                         
                                         //transmitter
                                         input [dbit-1:0] wdata,
                                         input wruart,
                                         output txfull,
                                         output tx ,
                                         
                                         input [10:0] timer_final_value
                                                                                 
                                            );
                                         //timer instantiation 
                                         wire tick;
                                         timer #(.bits(11)) buadrate(
                                                                     .clk(clk),
                                                                     .reset_n(reset_n),
                                                                     .enable(1'b1),
                                                                     .finalvalue(timer_final_value),
                                                                     .done(tick));
                                                                     
                                         
                                          //receiver 
                                          wire rxdonetick;
                                          wire [dbit-1:0] rxdout;        
                                          reciever#( .dbit(dbit),.sbtick(sbtick)) rx0( 
                                                                                      .clk(clk),
                                                                                      .reset_n(reset_n),
                                                                                      .rx(rx),
                                                                                      .stick(tick),
                                                                                      .rxdone(rxdonetick),
                                                                                      .rxdout(rxdout));      
                                           
                                           fifo_generator_0 recieverfifo (
                                                                                      .clk(clk),      // input wire clk
                                                                                      .srst(~reset_n),    // input wire srst
                                                                                      .din(rxdout),      // input wire [7 : 0] din
                                                                                      .wr_en(rxdonetick),  // input wire wr_en
                                                                                      .rd_en(rduart),  // input wire rd_en
                                                                                      .dout(rdata),    // output wire [7 : 0] dout
                                                                                      .full(),    // output wire full
                                                                                      .empty(rxempty)  // output wire empty
                                                                                    );
                                                                                    
                                          //transmitter
                                          wire txfifoempty,txdonetick;
                                          wire [dbit-1:0] txdin; 
                                          
                                          
                                           transmitter #(.dbit(8),.sbtick(16)) (
                                                                                        .clk(clk),
                                                                                        .reset_n(reset_n),
                                                                                        .stick(tick),
                                                                                        .txstart(~txfifoempty),
                                                                                        .txdin(txdin),
                                                                                        .tx(tx),
                                                                                        .txdone(txdonetick));             
                                                                             
                                          fifo_generator_0 your_instance_name (
                                                                                      .clk(clk),      // input wire clk
                                                                                      .srst(~reset_n),    // input wire srst
                                                                                      .din(wdata),      // input wire [7 : 0] din
                                                                                      .wr_en(wruart),  // input wire wr_en
                                                                                      .rd_en(txdonetick),  // input wire rd_en
                                                                                      .dout(txdin),    // output wire [7 : 0] dout
                                                                                      .full(txfull),    // output wire full
                                                                                      .empty(txfifoempty)  // output wire empty
                                                                                    );                            
             
endmodule
