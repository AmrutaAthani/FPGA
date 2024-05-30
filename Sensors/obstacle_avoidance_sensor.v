`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2024 09:52:24 AM
// Design Name: 
// Module Name: obstacle_avoidance_sensor
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


module obstacle_avoidance_sensor(
    input wire sensor_input,  // Sensor input
    output reg led_output    // LED output
);

// Combinational logic to toggle LED based on sensor input
always @(*) begin
    if (sensor_input == 1'b1) begin
        led_output = 1'b0; // Turn off LED
    end else begin
        led_output = 1'b1; // Turn on LED
    end
end

endmodule

