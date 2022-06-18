`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2021 08:46:34 PM
// Design Name: 
// Module Name: clk_div_disp
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


module clk_div_disp(
    input clk,
    input reset,
    output refresh_clk,
    output time_clk
    );
    
    reg [16:0] refresh;
    reg [19:0] time_count;
    reg ref;
    reg time_c;
    assign refresh_clk = ref;
    assign time_clk = time_c;
    
    always @(posedge clk) begin
        if (time_count < 500000) begin 
            time_count <= time_count + 1;
          end
        else begin
            time_c <= ~time_c;
            time_count <= 0;
          end
    end
    
    always @(posedge clk) begin
        if (refresh < 100000) begin 
            refresh <= refresh + 1;
          end
        else begin
            ref <= ~ref;
            refresh <= 0;
          end
    end
    
endmodule

