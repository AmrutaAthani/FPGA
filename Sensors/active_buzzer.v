module active_buzzer(
input wire clk,
input wire rst,
output reg pwm_out);

reg[23:0] counter;

always@(posedge clk or posedge rst)
begin
if(rst)
begin
counter<=24'b0;
pwm_out<=1'b0;
end
else
begin
if(counter ==24'd500000)
begin
counter<=24'b0;
pwm_out<=~pwm_out;
end
else
begin
counter<=counter+1;
end
end
end
endmodule
