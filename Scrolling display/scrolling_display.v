`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2024 02:47:55 PM
// Design Name: 
// Module Name: scrolling_display
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


module scrolling_display(
    input clock,
    input reset,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output dp,
    output [3:0] an
    );

reg [28:0] ticker; //to hold a count of 50M
wire click;
reg [3:0] fourth, third, second, first; // registers to hold the LED values

always @ (posedge clock or posedge reset) //always block for the ticker
begin
 if(reset)
  ticker <= 0;
 else if(ticker == 50000000) //reset after 1 second
  ticker <= 0;
 else
  ticker <= ticker + 1;
end

reg [3:0] clickcount; //register to hold the count upto 9. That is why a 4 bit register is used. 3 bit would not have been enough.

assign click = ((ticker == 50000000)?1'b1:1'b0); //click every second

always @ (posedge click or posedge reset)
begin
 if(reset)
  clickcount <= 0;
 else if(clickcount == 8)
   clickcount <= 0;
  else 
  clickcount <= clickcount + 1;

end

always @ (*) //always block that will scroll or move the text. Accomplished with case
begin
    case(clickcount)
    0:
    begin
     fourth = 1; 
     third = 2; 
     second = 3; 
     first = 4; 
    end
    
    1:
    begin
     fourth = 2; 
     third = 3; 
     second = 4; 
     first = 5; 
    end
    
    2:
    begin
     fourth = 3; 
     third = 4;
     second = 5; 
     first = 6; 
    end
    
    3:
    begin
     fourth = 4; 
     third = 5; 
     second = 6; 
     first = 1; 
    end
    
    4:
    begin
     fourth = 5; 
     third = 6; 
     second = 1; 
     first = 2; 
    end
    
    5:
    begin
     fourth = 6; 
     third = 1; 
     second = 2;
     first = 3; 
    end
    
    6:
    begin
     fourth = 1; 
     third = 2; 
     second = 3; 
     first = 4; 
    end
    
    7:
    begin
     fourth = 2;
     third = 3; 
     second = 4; 
     first = 5; 
    end
    
    8:
    begin
     fourth = 3; 
     third = 4; 
     second = 5; 
     first = 6; 
    end
  endcase
  
end

//see my other post on explanation of LED multiplexing.

localparam N = 18;

reg [N-1:0]count;

always @ (posedge clock or posedge reset)
 begin
  if (reset)
   count <= 0;
  else
   count <= count + 1;
 end

reg [6:0]sseg;
reg [3:0]an_temp;

always @ (*)
 begin
  case(count[N-1:N-2])
   
   2'b00 : 
    begin
     sseg = first;
     an_temp = 4'b1110;
    end
   
   2'b01:
    begin
     sseg = second;
     an_temp = 4'b1101;
    end
   
   2'b10:
    begin
     sseg = third;
     an_temp = 4'b1011;
    end
    
   2'b11:
    begin
     sseg = fourth;
     an_temp = 4'b0111;
    end
  endcase
 end
assign an = an_temp;

reg [6:0] sseg_temp; 
always @ (*)
 begin
  case(sseg)
  1: sseg_temp = 7'b1111000;
   2 : sseg_temp = 7'b0100100;
   3 : sseg_temp = 7'b0110000;
   4 : sseg_temp = 7'b0011001;
   5: sseg_temp = 7'b0010010;
   6: sseg_temp = 7'b0000010;
   
   default : sseg_temp = 7'b1111111; //blank
  endcase
 end
assign {g, f, e, d, c, b, a} = sseg_temp; 
assign dp = 1'b1;
endmodule


  
