`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 08:05:16 PM
// Design Name: 
// Module Name: reciever
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


module reciever#(parameter dbit=8,sbtick=16)(input clk,reset_n,
                                              rx,stick,
                                              output reg rxdone,
                                              output [dbit-1:0] rxdout);
        localparam idle=0,start=1,data=2,stop=4;
        
        reg [1:0] statereg,statenext;
        reg [3:0] snext,sreg;  //counts ticks from timer 16 ticks for one sample length
        reg [$clog2(dbit):0] nnext,nreg; // counts number of bits transmitters
        reg [dbit-1:0] breg,bnext;  //holds value of transmitter bits
        
        //sequential logic
        always@(posedge clk,negedge reset_n)
        begin
            if(~reset_n)
                begin
                    statereg<=idle;
                    sreg<='b0;
                    nreg<='b0;
                    breg<='b0;
                end
            else 
                begin
                    statereg<=statenext;
                    sreg<=snext;
                    nreg<=nnext;
                    breg<=bnext;
                end
         end 
        //combinational
        always@(*)
        begin 
            statenext=statereg;
            nnext=nreg;
            snext=sreg;
            bnext=breg;
            rxdone=1'b0;
            case(statereg)
                idle:  
                    begin
                            if(~rx)
                            begin
                                snext=0;
                                statenext=start;
                            end
                    end
                 start:
                    begin
                            if(stick)
                            begin
                                if(sreg==7)
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
                            if(stick)
                            begin
                                if(sreg==15)
                                begin   
                                    snext=0;
                                    bnext={rx,breg[dbit-1:1]};//right shift
                                    if(nreg==dbit-1)
                                    begin
                                        statenext=stop;
                                    end
                                    else 
                                        nnext=nreg+1;
                                end
                                else 
                                    snext=sreg+1;
                            end 
                            
                    end
                 stop:
                 begin
                    if(stick)
                    begin
                        if(sreg==sbtick-1)
                        begin
                            rxdone=1'b1;
                            statenext=idle;
                            
                        end
                        else 
                            snext=sreg+1;  
                     end
                    
                 end
                 default:statereg=idle; 
            endcase
            
        end
        
        //output logic
        assign rxdout=breg;
endmodule
