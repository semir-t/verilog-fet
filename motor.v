module motor(motor_pin,timer_us,speed);

output reg motor_pin;
input wire timer_us;
input [9:0] speed;

reg [9:0] cnt;
parameter pulse_period = 1000;

always @(posedge timer_us)
begin
	cnt <= cnt + 1;
	if(cnt == pulse_period)
	begin
			cnt <= 0;
	end
	if(cnt < speed)
		motor_pin <= 1;
	else
		motor_pin <= 0;
end




endmodule