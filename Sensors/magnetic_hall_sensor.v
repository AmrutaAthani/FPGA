`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2024 10:53:34 AM
// Design Name: 
// Module Name: magnetic_hall_sensor
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


module magnetic_hall_sensor(
    input wire hall_sensor_input,  // Hall sensor input
    output reg led_output          // LED output
);

// Combinational logic to toggle LED based on sensor input
always @(*) begin
    if (hall_sensor_input == 1'b0) begin
        led_output = 1'b1; // Turn on LED
    end else begin
        led_output = 1'b0; // Turn off LED
    end
end

endmodule



