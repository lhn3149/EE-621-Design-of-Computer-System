// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on

module dxp_CPU2_v_tb2;
	reg	Resetn_tb, Clock_tb;
	reg	[3:0] SW_in_tb, PB_in_tb;
	wire [3:0] DHR_out_tb, DLR_out_tb;
	integer i;

dxp_CPU2_v	dut (Resetn_tb, Clock_tb, 
	SW_in_tb, PB_in_tb, 
	DHR_out_tb, DLR_out_tb);
	
initial	begin	
//----------------------------------------------------------------------------
//	Resetn_tb, Clock_tb, LD_A_tb, SW_in_tb, PB_in_tb, DHR_out_tb, DLR_out_tb
//----------------------------------------------------------------------------
//-- Test Vector 1 (40ns): Reset
//----------------------------------------------------------------------------
	apply_test_vector(0, 0, 4'b0000, 4'b0000);
//----------------------------------------------------------------------------
//-- All other test vectors
//----------------------------------------------------------------------------
	for (i=0; i<30; i=i+1)
		apply_test_vector(1, 0, 4'b0101, 4'b0001);
	for (i=0; i<30; i=i+1)
		apply_test_vector(1, 0, 4'b0101, 4'b0000);
	for (i=0; i<30; i=i+1)
		apply_test_vector(1, 0, 4'b0101, 4'b0001);
	for (i=0; i<30; i=i+1)
		apply_test_vector(1, 0, 4'b0101, 4'b0001);
	for (i=0; i<30; i=i+1)
		apply_test_vector(1, 0, 4'b1010, 4'b0000);
	for (i=0; i<30; i=i+1)
		apply_test_vector(1, 0, 4'b1010, 4'b0001);
	for (i=0; i<500; i=i+1)
		apply_test_vector(1, 0, 4'b1010, 4'b0001);
end

task apply_test_vector;
	input	Resetn_int, Clock_int;
	input	[3:0] SW_in_int, PB_in_int;
	
	begin
		Resetn_tb = Resetn_int; Clock_tb = Clock_int; 
		SW_in_tb = SW_in_int; PB_in_tb = PB_in_int;
		#20000;
		Clock_tb = 1;
		#20000;
	end
endtask
endmodule
