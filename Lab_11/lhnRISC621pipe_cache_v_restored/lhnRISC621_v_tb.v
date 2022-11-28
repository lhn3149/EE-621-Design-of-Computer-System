// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on

module lhnRISC621_v_tb;
	reg	Resetn_tb, Clock_tb;
	reg	[4:0] SW_in_tb;
	wire [7:0] Display_out_tb;
	wire [95:0] ICis_tb;
	integer i;

lhnRISC621_v	dut	(Resetn_tb, Clock_tb, SW_in_tb, Display_out_tb, ICis_tb);
// Resetn_pin, Clock_pin, SW_pin, Display_pin, ICis;
	
initial	begin	
//----------------------------------------------------------------------------
//	Resetn_tb, Clock_tb, SW_in_tb, Display_out_tb
//----------------------------------------------------------------------------
//-- Test Vector 1 (40ns): Reset
//----------------------------------------------------------------------------
	for (i=0; i<5; i=i+1) apply_test_vector(0, 0, 5'b00000);
//----------------------------------------------------------------------------
//-- All other test vectors
//----------------------------------------------------------------------------
	for (i=5; i<10; i=i+1) begin
		Clock_tb = 0;
		#20000;
		Clock_tb = 1;
		#20000;
	end
	for (i=10; i<20; i=i+1) apply_test_vector(1, 0, 5'b00000);
	for (i=20; i< 15000; i=i+1) apply_test_vector(1, 0, 5'b01111); //13500
end

task apply_test_vector;
	input	Resetn_int, Clock_int;
	input	[4:0] SW_in_int;
	
	begin
		Resetn_tb = Resetn_int; Clock_tb = Clock_int; SW_in_tb = SW_in_int;
		#20000; Clock_tb = 1; #20000;
	end
endtask
endmodule
