`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 11:07:17 AM
// Design Name: 
// Module Name: rgb_led
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


module rgb_led(
    input wire clk,
    output reg red_led,
    output reg green_led,
    output reg blue_led
);

// Internal state variable to control the LED sequence
reg [1:0] led_state;
reg [31:0] counter;

// Define states for LED sequence
parameter IDLE_STATE = 2'b00;
parameter RED_STATE = 2'b01;
parameter GREEN_STATE = 2'b10;
parameter BLUE_STATE = 2'b11;

always @(posedge clk) begin
    // State machine to control LED sequence
    case(led_state)
        IDLE_STATE: begin
            counter <= 0;
            red_led <= 1'b0;
            green_led <= 1'b0;
            blue_led <= 1'b0;
            led_state <= RED_STATE;
        end
        RED_STATE: begin
            red_led <= 1'b1;
            green_led <= 1'b0;
            blue_led <= 1'b0;
            if (counter == 1_000_000) begin // Adjust the delay according to your clock frequency
                counter <= 0;
                led_state <= GREEN_STATE;
            end else begin
                counter <= counter + 1;
            end
        end
        GREEN_STATE: begin
            red_led <= 1'b0;
            green_led <= 1'b1;
            blue_led <= 1'b0;
            if (counter == 1_000_000) begin // Adjust the delay according to your clock frequency
                counter <= 0;
                led_state <= BLUE_STATE;
            end else begin
                counter <= counter + 1;
            end
        end
        BLUE_STATE: begin
            red_led <= 1'b0;
            green_led <= 1'b0;
            blue_led <= 1'b1;
            if (counter == 1_000_000) begin // Adjust the delay according to your clock frequency
                counter <= 0;
                led_state <= IDLE_STATE;
            end else begin
                counter <= counter + 1;
            end
        end
        default: begin
            led_state <= IDLE_STATE;
        end
    endcase
end

endmodule



