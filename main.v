module main(CLK_50M,
				Reset,
				led_pin,
				servo_left,
				servo_right,
				motor_left,
				motor_right,
				led_test,
				state
				);

input wire CLK_50M;
input wire Reset;
output wire  led_pin;
output wire servo_left;
output wire servo_right;
output wire motor_left;
output wire motor_right;
output reg led_test;
input [2:0] state;

reg [9:0] left_motor_speed = 0;
reg [9:0] right_motor_speed = 0;
reg [9:0] left_servo_speed = 0;
reg [9:0] right_servo_speed = 0;
reg servo_state = 0;
reg led_state = 0;
reg[24:0] cnt;

wire timer_ms;
wire timer_us;
timers(CLK_50M,timer_ms,timer_us);

always @(*)
case(state)
	3'b000: //OFF STATE
		begin 
			led_state <= 0;
			left_motor_speed <= 0;
			right_motor_speed <=0;
			left_servo_speed <= 0;
			right_servo_speed <= 0;
			servo_state <= 0;
		end
	3'b001: //FORWARD SLOW
		begin 
			led_state <= 1;
			left_motor_speed <= 500;
			right_motor_speed <= 500;
			left_servo_speed <= 5;
			right_servo_speed <= 5;
			servo_state <= 1;
		end
	3'b010: //FORWARD FAST
		begin 
			led_state <= 1;
			left_motor_speed <= 800;
			right_motor_speed <= 800;
			left_servo_speed <= 2;
			right_servo_speed <= 2;
			servo_state <= 1;
		end
	3'b011: //MOVE RIGHT
		begin 
			led_state <= 1;
			left_motor_speed <= 800;
			right_motor_speed <= 0;
			left_servo_speed <= 2;
			right_servo_speed <= 5;
			servo_state <= 1;
		end
	3'b100: //MOVE LEFT
		begin 
			led_state <= 1;
			left_motor_speed <= 0;
			right_motor_speed <= 800;
			left_servo_speed <= 5;
			right_servo_speed <= 2;
			servo_state <= 1;
		end
	3'b101:
		begin 
		
		end
	3'b110:
		begin 
		
		end
	3'b111:
		begin 
		
		end
endcase

fsm_led(CLK_50M,timer_ms,led_pin,led_state);
servo(servo_left,timer_ms,timer_us,left_servo_speed,servo_state);
servo(servo_right,timer_ms,timer_us,right_servo_speed,servo_state);
motor(motor_left,timer_us,left_motor_speed);
motor(motor_right,timer_us,right_motor_speed);


endmodule


