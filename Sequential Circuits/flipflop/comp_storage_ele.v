`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2024 03:37:47 PM
// Design Name: 
// Module Name: comp_storage_ele
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


module comp_storage_ele( input d,clk,
                         output qa,qb,qc
    );
    d_latch l0(.d(d),
              .clk(clk),
              .q(qa),
              .q_b());
            
     d_ffpos ff0(.d(d),
                 .clk(clk),
                 .q(qb));
                
     d_ffneg ff1(.d(d),
                 .clk(clk),
                 .q(qc));
                
endmodule
