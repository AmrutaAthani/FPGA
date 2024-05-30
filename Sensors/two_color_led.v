`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 10:51:25 AM
// Design Name: 
// Module Name: two_color_led
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


module two_color_led(
    input wire clk,
    output reg red_led,
    output reg green_led
);

reg [25:0] counter;

always @(posedge clk) begin
    if (counter == 0) begin
        red_led <= 1;   // Start with red LED on
        green_led <= 0;
    end else begin
        if (counter == 5000) begin // Adjust the counter value for desired blink rate
            red_led <= ~red_led; // Toggle LEDs
            green_led <= ~green_led;
        end
    end
    counter <= counter + 1; // Increment counter
end

endmodule
