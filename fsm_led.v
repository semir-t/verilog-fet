module fsm_led(CLK_50M,timer_ms,led_pin,state);

input wire CLK_50M;
output reg led_pin;
input wire timer_ms;
input state;

reg [9:0] cnt;

always@( posedge timer_ms)
begin
	cnt = cnt + 1;
	if( cnt == 1000 )
	begin
		led_pin <= ~(led_pin) & state; // toggle LED state
		cnt = 0;
	end
end
endmodule