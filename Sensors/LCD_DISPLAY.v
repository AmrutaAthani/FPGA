`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2024 10:33:34 AM
// Design Name: 
// Module Name: LCD_DISPLAY
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


module LCD_DISPLAY(
    input wire clk,             // clock input
    output reg lcd_rw,         // read & write control
    output reg lcd_e,          // enable control
    output reg lcd_rs,         // data or command control
    output reg [7:0] data      // data line
);


parameter N = 22;
reg [7:0] datas [1:N];


initial begin
    datas[1]  = 8'h38;
    datas[2]  = 8'h0c;
    datas[3]  = 8'h06;
    datas[4]  = 8'h01;
    datas[5]  = 8'hC0;
    datas[6]  = 8'h41;
    datas[7]  = 8'h4D;
    datas[8]  = 8'h52;
    datas[9]  = 8'h55;
    datas[10] = 8'h54;
    datas[11] = 8'h41;
    datas[12] = 8'h41;
    datas[13] = 8'h54;
    datas[14] = 8'h48;
    datas[15] = 8'h41;
    datas[16] = 8'h4E;
    datas[17] = 8'h49;
   //datas[18] = 8'h54;
    //datas[19] = 8'h49;
    //datas[20] = 8'h4f;
  //  datas[21] = 8'h4e;
  //  datas[22] = 8'h53;
end


reg [31:0] i = 0;
reg [4:0] j = 1;


always @(posedge clk) begin
    if (i <= 1000000) begin
        i <= i + 1;
        lcd_e <= 1'b1;
        data <= datas[j];
    end
    else if (i > 1000000 && i < 2000000) begin
        i <= i + 1;
        lcd_e <= 1'b0;
    end
    else if (i == 2000000) begin
        j <= j + 1;
        i <= 0;
    end


   if (j <= 5) begin
        lcd_rs <= 1'b0; // command signal
    end
    else if (j > 5) begin
        lcd_rs <= 1'b1; // data signal
    end


   if (j == 17) begin
        j <= 5;
    end


   lcd_rw <= 1'b0; // lcd write
end


endmodule
