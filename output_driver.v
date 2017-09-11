module output_driver(CLK, CURR_TIME);
    input CLK;
    input [17:0]CURR_TIME;

    always @(posedge CLK)
    begin : begin_1
	    reg [17:0]sec;
	    reg [17:0]min;
	    reg [17:0]hour;

	    hour = CURR_TIME / 3600;
	    min  = (CURR_TIME % 3600) / 60;
	    sec  = (CURR_TIME % 3600) % 60;


            $display("TIME: %d:%d:%d", hour, min, sec);
	end

endmodule
