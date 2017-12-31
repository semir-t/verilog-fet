module timers(CLK_50M);
	input wire CLK_50M;
	
	reg[5:0] cnt;
	reg timer_us = 0;
	reg[9:0] cnt_us;
	reg timer_ms = 0;
	//prescaler
	always @(posedge CLK_50M)
	begin
			cnt <= cnt + 1;
			if(cnt == 5'h32 ) //count to 50
			begin
				cnt <= 0;
				timer_us <= timer_us ^ 1; //toggle
			end
	end
	always @(posedge timer_us)
	begin
		cnt_us <= cnt_us + 1;
		if(cnt_us == 10'h3e8) //count to 1000 (1ms)
		begin
			timer_ms <= timer_ms ^ 1; //toggle
			cnt_us = 0;
	   end
	end

endmodule