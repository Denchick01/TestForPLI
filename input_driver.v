`define RESET_OPCODE 0
`define DEC_OPCODE 1
`define ADD_OPCODE 2

module input_driver (IHOUR, DHOUR, IMIN, 
		   DMIN,  ISEC,  DSEC, 
		   RESET_TIME, OPER);

    parameter hour   = 3600;
    parameter minute = 60;
    parameter second = 1;
    parameter time_buff_size = 18;
    parameter oper_l = 3;

    input IHOUR, 
    input DHOUR; 
    input IMIN; 
    input DMIN;  
    input ISEC;  
    input DSEC;
    input RESET_TIME;

    output [time_buff_size + oper_l:0] OPER;
    reg [time_buff_size + oper_l:0] OPER;

    always @(posedge IHOUR or posedge DHOUR or posedge IMIN or
             posedge DMIN or posedge ISEC or posedge DSEC or
             posedge RESET_TIME)

        begin
            if (RESET_TIME)
                OPER <= (0 << oper_l) | RESET_OPCODE;
            else if (IHOUR)
                OPER <= (hour << oper_l) | ADD_OPCODE;
            else if (DHOUR)
                OPER <= (hour << oper_l) | DEC_OPCODE;
            else if (IMIN)
                OPER <= (minute << oper_l) | ADD_OPCODE;
            else if (DMIN)
                OPER <= (minute << oper_l) | DEC_OPCODE;
            else if (ISEC)
                OPER <= (decond << oper_l) | ADD_OPCODE;
            else if (DSEC)
                OPER <= (second << oper_l) | DEC_OPCODE;
            else;
     end            
endmodule
