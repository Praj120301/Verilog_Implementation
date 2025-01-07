`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2024 04:10:29 PM
// Design Name: 
// Module Name: transmitter
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


module transmitter #(parameter dbit=8,sbtick=16) (
                    input clk,reset_n,
                    stick,txstart,
                    input [dbit-1:0] txdin,
                    output tx,
                    output reg txdone);
                    
                    localparam idle=0,start=1,data=2,stop=3;
                    
                    reg [1:0] statereg,statenext;//holds which state it is in 
                    reg [3:0] sreg,snext;        //holds how many time the timer ticked since 1 sample needs 16 timer ticks
                    reg [$clog2(dbit-1):0] nreg,nnext;  //holds how many bits have been transmitted or not
                    reg [dbit-1:0]bnext,breg;           //holds which value of bits to be transmitted
                    reg txreg,txnext;
                    //sequential part
                    always@(posedge clk,negedge reset_n)
                    begin
                        if(~reset_n)
                        begin
                            statereg<=idle;
                            sreg='b0;
                            nreg<='b0;
                            breg='b0;
                            txreg<='b1;
                        end
                        else
                        begin
                            statereg<=statenext;
                            sreg<=snext;
                            nreg<=nnext;
                            breg<=bnext;
                            txreg<=txnext;
                        end
                    end 
                    
                    //combinational part
                    always@(*)
                    begin
                        //default values
                        statenext=statereg;
                        nnext=nreg;
                        bnext=breg;
                        snext=sreg;
                        txdone=1'b0;
                        
                       
                        case(statereg)
                            idle:
                                 
                                 begin
                                 txnext=1'b1;
                                    if(txstart)
                                    begin
                                        snext=0;
                                        bnext=txdin;
                                        statenext=start;
                                        
                                    end
                                 end
                            start:
                                begin
                                    txnext=1'b0;
                                    if(stick)
                                    begin
                                        if(sreg==15)
                                        begin
                                            snext=0;
                                            nnext=0;
                                            statenext=data;
                                            
                                        end
                                        else 
                                            snext=sreg+1;
                                    end
                                end
                            data:
                                begin
                                    txnext=breg[0];
                                    if(stick)
                                    begin
                                        if(sreg==15)
                                        begin
                                            snext='b0;
                                            bnext={1'b0,breg[dbit-1:1]};//rightshift
                                            if(nreg==(dbit-1))
                                            begin
                                                 snext=0;
                                                 statenext=stop;
                                            end
                                            else
                                            begin   
                                                nnext=nreg+1;
                                            end
                                      
                                            
                                        end
                                        else
                                        begin
                                            snext=sreg+1;
                                        end
                                        
                                    end
                                    
                                    
                                end
                             stop:
                             begin
                                txnext=1'b1;
                                if(stick)
                                begin
                                    if(sreg==(sbtick-1))
                                    begin
                                        txdone=1'b1;
                                        statenext=idle;
                                    end
                                    else 
                                        snext=sreg+1;
                                end
                             end
                             default:
                             statenext=idle;
                             
                        endcase
                    end
                    
                    //output  logic
                    assign tx=txreg;
endmodule
