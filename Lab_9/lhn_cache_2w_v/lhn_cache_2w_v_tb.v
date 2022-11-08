// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on

module lhn_cache_2w_v_tb;

	reg [13:0] MEM_address_tb;
	reg [13:0] MEM_in_tb;
	reg	Resetn_tb, WR_tb, Clock_tb;
	wire [13:0] MEM_out_tb;
	wire Done_tb;
	integer i, MC_tb = 0;

lhn_cache_2w_v	dut	(Resetn_tb, MEM_address_tb, MEM_in_tb, WR_tb, Clock_tb, MEM_out_tb, Done_tb);
	
initial	begin	
//----------------------------------------------------------------------------
//	Task parameters: Resetn_tb, MEM_address_tb, MEM_in_tb, WR_tb, Clock_tb
//----------------------------------------------------------------------------
//-- Test Vector 1 (40ns): Reset
//----------------------------------------------------------------------------
	apply_test_vector(0, 14'h0000, 14'h0a5a, 0, 0);
//----------------------------------------------------------------------------
//-- These clock cycles are necessary to get the PLL going
//----------------------------------------------------------------------------
	for (i=0; i<5; i=i+1) begin
		Clock_tb = 0;
		#20000;
		Clock_tb = 1;
		#20000;
		end
//----------------------------------------------------------------------------
//-- All other test vectors
//----------------------------------------------------------------------------
// Reading from address 000 after reset will result in a miss; it will take 32
// cycles to upload the block in the cache; then reading the value is
// attempted again; this time it is a hit and will be output one cycle later
//----------------------------------------------------------------------------
	for (i=0; i<35; i=i+1) begin
		apply_test_vector(1, 14'h0000, 14'h0a5a, 0, 0);
	end
	// 35 --> 16
//----------------------------------------------------------------------------
// Let's read from another address in the same block; this is a hit because
// the block is already in the cache
//----------------------------------------------------------------------------
		apply_test_vector(1, 14'h000f, 14'h0a5a, 0, 0);
//----------------------------------------------------------------------------
// Let's read a word from the next successive block; this is a miss again, so
// there's need for another 32 cycles to upload this new block in the cache
//----------------------------------------------------------------------------
		apply_test_vector(1, 14'h0010, 14'h0a5a, 0, 0);
//----------------------------------------------------------------------------
// This is a read from a block in another group
//----------------------------------------------------------------------------
	for (i=37; i<72; i=i+1) begin
		apply_test_vector(1, 14'h0fff, 14'h0a5a, 0, 0);
	end
//----------------------------------------------------------------------------
// From another location in the same block
//----------------------------------------------------------------------------
	for (i=73; i<75; i=i+1) begin
		apply_test_vector(1, 14'h0ffe, 14'h0a5a, 0, 0);
	end
//----------------------------------------------------------------------------
// Reading again from the second block
//----------------------------------------------------------------------------
		apply_test_vector(1, 14'h0010, 14'h5a5a, 0, 0);
//----------------------------------------------------------------------------
// Now writing to a location in the "far" block; this results in a hit and in
// setting of the dirty bit for this block; next two cycles we read from 
// another and then from the same address to check if the write was successful
//----------------------------------------------------------------------------
		apply_test_vector(1, 14'h0fff, 14'h0333, 1, 0);
		apply_test_vector(1, 14'h0ffe, 14'h0a5a, 0, 0);
		apply_test_vector(1, 14'h0fff, 14'h0a5a, 0, 0);
//----------------------------------------------------------------------------
// Now attempt a write that results in a miss;
//----------------------------------------------------------------------------
	for (i=79; i<114; i=i+1) begin
		apply_test_vector(1, 14'h0c00, 14'h05a5, 1, 0);
	end
		apply_test_vector(1, 14'h0fff, 14'h0a5a, 0, 0);
		apply_test_vector(1, 14'h0c00, 14'h0a5a, 0, 0);
		apply_test_vector(1, 14'h0000, 14'h0a5a, 0, 0);
//----------------------------------------------------------------------------
// Both group 0 cache block locations have valid blocks uploaded; now try 
// a read from another block in this group, so that one of the former two
// have to be replaced by writing back to the MEM

// Block replacement --> but update with new value from cache (after a write)
// request a read from a location (miss), choose which block to replace, check 
// if the block is different from the memory
//----------------------------------------------------------------------------
	for (i=118; i<185; i=i+1) begin
		apply_test_vector(1, 14'h0a00, 14'h0333, 0, 0);
	end
		apply_test_vector(1, 14'h0a01, 14'h0333, 0, 0);
		apply_test_vector(1, 14'h0a00, 14'h0333, 1, 0);
		apply_test_vector(1, 14'h0000, 14'h0222, 0, 0);
		apply_test_vector(1, 14'h0a00, 14'h0222, 0, 0);
	for (i=186; i<225; i=i+1) begin
		apply_test_vector(1, 14'h0c00, 14'h0444, 0, 0);
	end
		apply_test_vector(1, 14'h0c01, 14'h0444, 0, 0);
//----------------------------------------------------------------------------
//-- Keep going for another few clock cycles
//----------------------------------------------------------------------------
	for (i=0; i<3; i=i+1) begin
		Clock_tb = 0;
		#20000;
		Clock_tb = 1;
		#20000;
		end
end

task apply_test_vector;
	input	Resetn_int;
	input	[13:0] MEM_address_int;
	input [13:0] MEM_in_int;
	input	WR_int, Clock_int;
	
	begin
		Resetn_tb = Resetn_int; WR_tb = WR_int; Clock_tb = Clock_int; MC_tb = MC_tb + 1;
		#20000;
		MEM_address_tb = MEM_address_int;
		MEM_in_tb = MEM_in_int;
//MEM_address and MEM_in are passed to the block on the rising edge of the clock
		Clock_tb = 1;
		#20000;
	end
endtask
endmodule
