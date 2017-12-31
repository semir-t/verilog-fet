module servo(servo_pin,timer_ms,timer_us,speed,step);

input wire timer_ms;
input wire timer_us;
output reg servo_pin;
input step;
reg [14:0] cnt = 0;
input [7:0] speed; // speed in ms
reg [7:0] servo_cnt = 0;
reg [7:0] angle = 160;				// angle in degrees
reg [7:0] current_angle = 0;

//wire signed [2:0] step;
//assign step = angle > current_angle ? 1 : -1;
always @(posedge timer_ms)
begin
	if(servo_cnt == speed)
	begin
		if(angle > current_angle)
			current_angle <= current_angle + step;
		else	
			current_angle <= current_angle - step;
		servo_cnt <= 0;
	end
	else
	begin
		servo_cnt <= servo_cnt + 1;
	end
	if(current_angle == angle)
	begin
		if(angle == 0)
			angle <= 90;
		else 
			angle <= 0;
	end
end
always @(posedge timer_us)
begin
	cnt <= cnt + 1;
	if(cnt == 20000)
	begin
		cnt <= 0;
	end
	if(cnt < 1000 + current_angle * 6)
	begin
		servo_pin <= 1;
	end
	else
	begin
		servo_pin <= 0;
	end
end


endmodule