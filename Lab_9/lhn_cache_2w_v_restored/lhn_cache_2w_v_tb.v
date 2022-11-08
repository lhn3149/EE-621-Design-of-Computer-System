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
// READ MISS 
// penalty: 
//----------------------------------------------------------------------------
	for (i=0; i<20; i=i+1) begin
		apply_test_vector(1, 14'h0000, 14'h0a5a, 0, 0);
		//	Task parameters: Resetn_tb, MEM_address_tb, MEM_in_tb, WR_tb, Clock_tb
	end
	// 35 --> 16
//----------------------------------------------------------------------------
// READ HIT
// block size: 8 words (can read any within 00-07 address)
//----------------------------------------------------------------------------
	for (i=0; i<4; i=i+1) begin
		apply_test_vector(1, 14'h0007, 14'h0a5a, 0, 0); end 
		//	Task parameters: Resetn_tb, MEM_address_tb, MEM_in_tb, WR_tb, Clock_tb
//----------------------------------------------------------------------------
// READ MISS (read next block)
// Let's read a word from the next successive block; this is a miss again, so
// there's need for another 32 cycles to upload this new block in the cache
//----------------------------------------------------------------------------
// READ MISS (different group)
//----------------------------------------------------------------------------
	for (i=21; i<41; i=i+1) begin
		apply_test_vector(1, 14'h0fff, 14'h0a5a, 0, 0);
	end
//----------------------------------------------------------------------------
// READ HIT
//----------------------------------------------------------------------------
	for (i=41; i<45; i=i+1) begin
		apply_test_vector(1, 14'h0ffe, 14'h0a5a, 0, 0);
	end
//----------------------------------------------------------------------------
// Reading again from the second block
//----------------------------------------------------------------------------
	for (i=46; i<50; i=i+1) begin
		apply_test_vector(1, 14'h0003, 14'h5a5a, 0, 0);
	end 
//----------------------------------------------------------------------------
// WRITE HIT (block in cache)
// 2 READ HIT
	for (i=51; i<55; i=i+1) begin
		apply_test_vector(1, 14'h0fff, 14'h0333, 1, 0);
	end 
	for (i=56; i<60; i=i+1) begin
		apply_test_vector(1, 14'h0ffe, 14'h0a5a, 0, 0);
	end
	for (i=61; i<65; i=i+1) begin
		apply_test_vector(1, 14'h0fff, 14'h0a5a, 0, 0);
	end
//----------------------------------------------------------------------------
// Now attempt a write that results in a miss;
//----------------------------------------------------------------------------
	for (i=66; i<86; i=i+1) begin
		apply_test_vector(1, 14'h0c00, 14'h05a5, 1, 0);
	end

// 3 READs HIT
	for (i=86; i<90; i=i+1) begin
		apply_test_vector(1, 14'h0fff, 14'h0a51, 0, 0); end
	for (i=91; i<95; i=i+1) begin
		apply_test_vector(1, 14'h0c00, 14'h0a5a, 0, 0); end
	for (i=96; i<100; i=i+1) begin
		apply_test_vector(1, 14'h0000, 14'h0a5a, 0, 0); end 
//----------------------------------------------------------------------------
// Both group 0 cache block locations have valid blocks uploaded; now try 
// a read from another block in this group, so that one of the former two
// have to be replaced by writing back to the MEM

// Block replacement --> but update with new value from cache (after a write)
// request a read from a location (miss), choose which block to replace, check 
// if the block is different from the memory
//----------------------------------------------------------------------------
	for (i=100; i<120; i=i+1) begin
		apply_test_vector(1, 14'h0040, 14'h0333, 0, 0); // upload TAG 1, GROUP 0 
	end
	for (i=121; i<125; i=i+1) begin
		apply_test_vector(1, 14'h0041, 14'h0333, 0, 0); end // read a word in TAG 1, GROUP 0 block
	for (i=126; i<130; i=i+1) begin
		apply_test_vector(1, 14'h040, 14'h0333, 1, 0); end // write  a word in that block
	for (i=131; i<135; i=i+1) begin	
		apply_test_vector(1, 14'h0000, 14'h0222, 0, 0); end // READ a word from 1st block
	for (i=136; i<140; i=i+1) begin	
		apply_test_vector(1, 14'h0040, 14'h0222, 0, 0); end // READ a word from 2nd block
	for (i=141; i<160; i=i+1) begin
		apply_test_vector(1, 14'h0080, 14'h0444, 0, 0); end // READ miss from TAG 2, GROUP
														// since GROUP 0 in cache has been filled
														// need to replace a block | write back and upload this block
	for (i=161; i<165; i=i+1) begin	
		apply_test_vector(1, 14'h0081, 14'h0444, 0, 0); end// READ Hit from newly uploaded block.
	for (i=166; i<170; i=i+1) begin	
		apply_test_vector(1, 14'h0041, 14'h0444, 1, 0); end //WRITE HIT because it is still in the cache.
		
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
