`include "input_driver.v"
`include "time_handler.v"
`include "output_driver.v"
`timescale 10ns/1ns

module TestForPLI;
     reg [6:0]input_bus;
     reg  clk;
     wire ihour;
     wire dhour;
     wire imin;
     wire dmin;
     wire isec;
     wire dsec;
     wire reset;
     wire [20:0]driver_out;
     wire [17:0]curr_time;

     assign {ihour, dhour, imin, dmin, isec, dsec, reset} = input_bus;

     input_driver driver_1 (.CLK(clk), .IHOUR(ihour), .DHOUR(dhour), .IMIN(imin), 
	                 .DMIN(dmin), .ISEC(isec), .DSEC(dsec), .RESET_TIME(reset), .OPER(driver_out));

     time_handler time_h_1 (.A_TIME(driver_out[20:3]), .DEC(driver_out[1]), .CLK(clk), .RESET(driver_out[0]), .CURR_TIME(curr_time));

     output_driver driver_2 (.CLK(clk), .CURR_TIME(curr_time));

     initial
         begin
             clk = 0;
	     input_bus = 0;
	     $display("Running testbench");
         end

     always  
         begin
             input_bus = 1 << 2;
             clk = !clk;
	 end

    
endmodule
