`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 09:49:25 AM
// Design Name: 
// Module Name: photo_intrrupter
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


module photo_intrrupter( input wire clk ,
input wire rst ,
input wire sensor ,
output reg led );


localparam low = 1'b0;
localparam high = 1'b1;


always @ (posedge clk or posedge rst)
begin
    if(rst)
    begin
    led<=low;
    end
else begin
    if(sensor == high)begin
    led<= high;
    end
    else begin
    led<=low;
    end
    end
end
endmodule

 
