`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2024 11:27:31 AM
// Design Name: 
// Module Name: pwm_iteration1_tb
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

module pwm_iteration1_tb();
                        localparam r=4;
                        reg reset_n;
                        reg clk;
                        reg [r-1:0]dutyval;
                        wire [r-1:0]out;
                        wire done;
                        
      pwm_iteration1 #(.resolution(r)) uut (.reset_n(reset_n),
                                             .clk(clk),
                                             .dutyval(dutyval),
                                             .out(out),
                                             .done(done));
      localparam T=10;

      initial #(7*(2**r)*T) $stop;
      
      always
      begin
        clk=1'b0;
        #(T/2);
        clk=1'b1;
        #(T/2);
        
      end
      
      initial begin
      reset_n=1'b0; 
      #2 reset_n=1'b1;
      dutyval=(0.25*2**r);
      end                                               
endmodule
