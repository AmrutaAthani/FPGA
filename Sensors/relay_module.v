`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2024 04:13:24 PM
// Design Name: 
// Module Name: relay_module
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


module relay_module(

    input wire clk,              // Clock input
    input wire rst,              // Reset input
    output reg relay_control,   // Output to control the relay module
    output reg led_output       // Output to control the LED on the Basys3 board
);

// Parameter for delay in clock cycles
parameter DELAY = 50000000;  // For a 100 MHz clock, this corresponds to a delay of 0.5 seconds

reg [31:0] counter;  // Counter for timing

// Always block for clock and reset
always @(posedge clk or posedge rst) begin
    if (rst) begin
        // Initialize
        counter <= 0;
        relay_control <= 0;   // Initially turn off the relay
        led_output <= 0;      // Initially turn off the LED
    end else begin
        // Increment counter on each clock cycle
        counter <= counter + 1;
        
        // Toggle relay output and LED output when delay is reached
        if (counter == DELAY) begin
            relay_control <= ~relay_control; // Toggle relay output
            led_output <= ~relay_control;    // Toggle LED output (inversely to relay control)
            counter <= 0;   // Reset counter
        end
    end
end

endmodule


