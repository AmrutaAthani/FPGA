`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2024 12:13:45 PM
// Design Name: 
// Module Name: passive_buzzer_1
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


module passive_buzzer_1(
 input wire clk,        // Clock input
    output reg buzzer      // Buzzer output
);

// Define frequencies for different musical notes
parameter C = 261;
parameter D = 294;
parameter E = 329;
parameter F = 349;
parameter G = 392;
parameter A = 440;
parameter B = 493;

// Define the melody sequence
reg [2:0] melody_index = 3'b000; // Start with the first note
reg [15:0] note_duration = 16'd500000; // Duration for each note

always @(posedge clk) begin
    if (note_duration != 0) begin
        note_duration <= note_duration - 1;
    end else begin
        case(melody_index)
            3'b000: begin buzzer <= 1; note_duration <= 16'd500000; end // C
            3'b001: begin buzzer <= 1; note_duration <= 16'd500000; end // D
            3'b010: begin buzzer <= 1; note_duration <= 16'd500000; end // E
            3'b011: begin buzzer <= 1; note_duration <= 16'd500000; end // F
            3'b100: begin buzzer <= 1; note_duration <= 16'd500000; end // G
            3'b101: begin buzzer <= 1; note_duration <= 16'd500000; end // A
            3'b110: begin buzzer <= 1; note_duration <= 16'd500000; end // B
            3'b111: begin buzzer <= 0; note_duration <= 16'd1500000; end // Silence
            default: begin buzzer <= 0; note_duration <= 16'd500000; end // Default to silence
        endcase
        melody_index <= melody_index + 1;
        if (melody_index == 3'b1000) begin
            melody_index <= 3'b000; // Reset index to repeat the melody
        end
    end
end

endmodule