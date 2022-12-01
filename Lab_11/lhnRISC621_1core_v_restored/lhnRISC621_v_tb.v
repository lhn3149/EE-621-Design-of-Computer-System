// synopsys translate_off
`timescale 1 ns / 1 ps
// synopsys translate_on

module lhnRISC621_v_tb;
	reg	Resetn_tb, Clock_tb;
	reg	[4:0] SW_in_tb;
	reg 	start_multiplication;
	wire [7:0] Display_out_tb;
	wire [95:0] ICis_tb;
	integer i;

FPGA_TopWraper	dut	(Resetn_tb, Clock_tb, SW_in_tb, Display_out_tb);
// Resetn_pin, Clock_pin, SW_pin, Display_pin, ICis;

/*-----------------------------------
*       Clock Configuration
-----------------------------------*/
initial begin
    // Setup our clock:
    Clock_tb = 1'd0;
    // In case the done signal never comes up:
    repeat (1000000) @(posedge Clock_tb);
    $display ("Watchdog tripped, check for hanging test sequence");
    $display ("------------------------------------------------------------\n\n");
    $stop; // Normally we would use $finish, but modelsim prefers $stop
end
always #20 Clock_tb = ~Clock_tb; // Free-running clock


initial	begin	
//----------------------------------------------------------------------------
//	Resetn_tb, Clock_tb, SW_in_tb, Display_out_tb
//----------------------------------------------------------------------------
//-- Test Vector 1 (40ns): Reset
//----------------------------------------------------------------------------
	 Resetn_tb = 1'd0;
	 SW_in_tb  = 5'd1;
	 start_multiplication = 1'b0;
	 i = 0;
	 
	 repeat (20) @(posedge Clock_tb);
	 Resetn_tb = 1'd1;
	 repeat(16)	apply_random_test; // input first array
	 $display ("\n\n------------------------------------------------------------");
	 $display ("first array inputted");
	 $display ("\n\n------------------------------------------------------------");
	 i = 0;
	 repeat(16)	apply_random_test; // input first array
	 $display ("\n\n------------------------------------------------------------");
	 $display ("second array inputted");
	 $display ("\n\n------------------------------------------------------------");
	 start_multiplication = 1'b1;

	 repeat (20) @(posedge Clock_tb);
	 apply_random_test;
	 repeat (2000) @(posedge Clock_tb);
	 $display ("Checking multiplication?");
	 $display ("\n\n------------------------------------------------------------");
	 repeat(16)	apply_random_test; // input first array
	 repeat (100) @(posedge Clock_tb);
	 $display ("Checking result?");
	 $display ("\n\n------------------------------------------------------------");
	 $stop;
end


task apply_random_test;
// This task will do random SW input and mimic push botton push
	begin
		SW_in_tb[4:1] = 	i;
		 @(posedge Clock_tb)
		 repeat (100) @(posedge Clock_tb);
		 SW_in_tb[0] = 0;
		 repeat (100) @(posedge Clock_tb);
		 SW_in_tb[0] = 1;
		 repeat (100) @(posedge Clock_tb);
		 i = i + 1'b1;
	end

endtask

endmodule
