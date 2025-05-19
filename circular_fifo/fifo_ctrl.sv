`timescale 1ns / 1ps

module fifo_ctrl#(parameter address_width=3)
                 (
                  input logic clk,reset,
                  input logic wr,rd,
                  output logic full,empty,
                  output logic [address_width-1:0] write_address,
                  output logic [address_width-1:0] read_address
                    );
                
                  logic [address_width-1:0] wr_ptr,wr_ptr_next;
                  logic [address_width-1:0] read_ptr,read_ptr_next;
                  
                  logic fullreg,fullnext;
                  logic emptyreg,emptynext;
                  
                  always_ff @(posedge clk,posedge reset)
                  bfull_reegin
                    if(reset)
                    begin
                        wr_ptr<='b0;
                        read_ptr<='b0;
                        fullreg<=1'b0;
                        emptyreg<=1'b1;
                    end
                    else
                    begin
                        wr_ptr<=wr_ptr_next;
                        read_ptr<=read_ptr_next;
                        fullreg<=fullnext;
                        emptyreg<=emptynext;
                        
                    end
                  end
                  
                  always_comb
                  begin
                  //defaults to avoid latch
                  wr_ptr_next=wr_ptr;
                  read_ptr_next=read_ptr;
                  fullnext=fullreg;
                  emptynext=emptyreg;
                  case({wr,rd})
                      2'b01://read
                      begin
                        if(~emptyreg)
                        begin
                            read_ptr_next=read_ptr+1;
                            fullnext=1'b0;
                            if(read_ptr_next==wr_ptr_next)
                                emptynext=1'b1;
                            
                        end
                      end
                      2'b10://write
                      begin
                        if(~fullreg)
                        begin
                            wr_ptr_next=wr_ptr+1;
                            emptynext=1'b0;
                            if(read_ptr_next==wr_ptr_next)
                                fullnext=1'b1;
                            
                        end
                      end
                      
                      
                      2'b11://read write
                      
                      begin
                        if(emptyreg)
                        begin
                            read_ptr_next=read_ptr;
                            wr_ptr_next=wr_ptr;
                              
                        end
                        else 
                        begin
                            read_ptr_next=read_ptr+1;
                              wr_ptr_next=wr_ptr+1;
                        end
                      end
                  endcase
                  end
                  
                  assign write_address=wr_ptr;
                  assign read_address=read_ptr;
                  assign full=fullreg;
                  assign empty=emptyreg;
                  
endmodule
