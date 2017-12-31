
module timers(CLK_50M,timer_ms,timer_us);
	input wire CLK_50M;
	
	reg[5:0] cnt = 0;
	reg[9:0] cnt_us = 0;
	
	output reg timer_ms = 0;
	output reg timer_us = 0;
	
	//prescaler
	always @(posedge CLK_50M)
	begin
			if(cnt == 5'h18 ) //count to 25
			begin
				cnt <= 0;
				timer_us <= timer_us ^ 1; //toggle
			end
			else
			begin
				cnt <= cnt + 1;
			end
	end
	always @(posedge timer_us)
	begin
		cnt_us <= cnt_us + 1;
		if(cnt_us == 10'h1f4) //count to 500 (1ms)
		begin
			timer_ms <= timer_ms ^ 1; //toggle
			cnt_us <= 0;
	   end
	end

endmodule