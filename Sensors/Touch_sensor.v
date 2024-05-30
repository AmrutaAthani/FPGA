`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2024 09:50:19 AM
// Design Name: 
// Module Name: Touch_sensor
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


module Touch_sensor(
input wire touch_signal,
output reg touched);

reg touch_state,touch_state_next;

always@(posedge touch_signal)
begin
touch_state<=touch_state_next;
end

always@(touch_state)
begin
touch_state_next=(touch_state==0&&touch_signal==1'b1)?1'b1:1'b0;
end

always@(posedge touch_signal)
begin
touched<=touch_state;
end

endmodule
