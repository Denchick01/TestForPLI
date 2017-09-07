module time_handler (A_TIME, DEC, CLK, RESET, CURR_TIME);

    parameter start_time = 0;
    parameter time_buff_size = 18;    
    parameter max_time = 24 * 3600;

    input DEC;
    input [time_buff_size - 1:0] A_TIME;
    input CLK;
    input RESET;

    output [time_buff_size - 1:0] CURR_TIME;
    reg [time_buff_size - 1:0] CURR_TIME;

    always @(posedge CLK or posedge RESET)

        begin
            if (RESET)
                CURR_TIME <= start_time;
            else if (CLK && !DEC)
                CURR_TIME <= add_time(CURR_TIME, A_TIME);
            else if (CLK && DEC)
                CURR_TIME <= dec_time(CURR_TIME, A_TIME);
            else;
            
 
     function [time_buff_size - 1:0] add_time;
         input [time_buff_size - 1:0] C_TIME;
	 input [time_buff_size - 1:0] ADD_VALUE;
         begin 
             if (C_TIME + ADD_VALUE > max_time)
                 add_time <= 0;
	     else
                 add_time <=  C_TIME + ADD_VALUE;
         end

    function [time_buff_size - 1:0] dec_time;
        input [time_buff_size - 1:0] C_TIME;
	input [time_buff_size - 1:0] DEC_VALUE;
        begin 
            if (C_TIME < DEC_VALUE)
                add_time <= 0;
	    else
                add_time <=  C_TIME - ADD_VALUE;
        end
 
    endfunction
         
endmodule
