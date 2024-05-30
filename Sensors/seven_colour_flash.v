`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2024 10:51:06 AM
// Design Name: 
// Module Name: seven_colour_flash
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


module seven_colour_flash(
    input wire clk,       // Clock input
    output reg led       // LED output
);

// Internal variable for toggling the LED
reg [31:0] counter = 0;

// Toggle the LED with specific timing
always @(posedge clk) begin
    if (counter < 4000) begin // 4 seconds at 4 MHz clock
        led <= 1'b1; // LED ON
    end else if (counter < 2000) begin // 2 seconds at 4 MHz clock
        led <= 1'b0; // LED OFF
    end else begin
        counter <= 0; // Reset the counter
    end
    
    // Increment the counter
    counter <= counter + 1;
end

endmodule

  