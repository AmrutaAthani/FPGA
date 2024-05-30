`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2024 11:01:28 AM
// Design Name: 
// Module Name: laser_transmitter
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


module laser_transmitter(
    input wire clk,     // Clock input
    input wire rst,     // Reset input
    output reg laser    // Output for laser control
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        laser <= 1'b0;      // Turn off the laser initially
    end else begin
        laser <= 1'b1;      // Turn on the laser
    end
end

endmodule
