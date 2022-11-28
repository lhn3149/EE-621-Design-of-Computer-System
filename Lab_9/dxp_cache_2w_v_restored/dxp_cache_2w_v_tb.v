// synopsys translate_off
`timescale 1 ns / 1 ps
// synopsys translate_on

module dxp_cache_2w_v_tb;

/*-----------------------------------
* Params:
* - 16 bit architecture
* - Fully Associative
* - 32 Blocks
* - 32 Words per Block
-----------------------------------*/

// DUT intputs:
reg  [15:0] MEM_address_tb;
reg  [15:0] MEM_in_tb;
reg         Resetn_tb;
reg         WR_tb;
reg         Clock_tb;
reg address_sample_period;
// DUT outputs:
wire [15:0] MEM_out_tb;
wire        Done_tb;
// TB signals:
wire [15:0] MEM_out_check_tb;
integer     i;
integer     failcount;

/*-----------------------------------
*                DUT
-----------------------------------*/
dxp_cache_2w_v dut (Resetn_tb, MEM_address_tb, MEM_in_tb, WR_tb, Clock_tb, MEM_out_tb, Done_tb); // Should be port matched for clarity
// 					(Resetn, MEM_address, MEM_in, WR, Clock, MEM_out, Done)

/*-----------------------------------
*       TB Reference Memory
-----------------------------------*/
dxpRISC521_ram1 model ( // Port matched instantiation, easier to read
    .address ( MEM_address_tb      ),
    .clock   ( ~Clock_tb           ), // Inverted clock
    .data    ( MEM_in_tb           ),
    .wren    ( WR_tb               ),
    .q       ( MEM_out_check_tb    )
);

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

/*-----------------------------------
* Reference Memory vs Cache Assertion
-----------------------------------*/
always @(posedge Clock_tb) begin
    if(Done_tb) begin
        if(MEM_out_tb != MEM_out_check_tb) begin
        // Look in the transcript to see if this assertion is tripped
            $display("%t: Model check failed for address %d expected data %d recieved data %d",$time, MEM_address_tb, MEM_out_check_tb, MEM_out_tb);
            failcount = failcount + 1;
	     //$stop; // take a look at mem_browser
        end
    end
end
 
always @(posedge Clock_tb) begin
	if(address_sample_period) begin
		if(MEM_address_tb == 168); //	 take a look at mem_browser
	end
end

/*-----------------------------------
*       Test Sequence
-----------------------------------*/
initial begin
	address_sample_period = 0;
    failcount = 0;
// reset the dut
    Resetn_tb = 1'd0;
    MEM_address_tb = 15'd0;
    MEM_in_tb = 15'd0;
    WR_tb = 1'd0;
    repeat (10) @(posedge Clock_tb);
    Resetn_tb = 1'd1;
    $display ("\n\n------------------------------------------------------------");
    $display ("Start of Test Sequence:");
// Demo a read miss:
// -> when the device comes out of reset it will immediately miss and populate address/block 0
    wait (Done_tb);
// Now block 0 is loaded
// Demo a read hit in block 0:
    @(posedge Clock_tb);
    MEM_address_tb = 16'd7;
    @(posedge Clock_tb);

// Demo a write miss:
    @(posedge Clock_tb);
    MEM_address_tb = 16'd8;
    MEM_in_tb = 16'd21;
    WR_tb = 1'd1;
    @(posedge Clock_tb);
    wait (Done_tb);
    @(posedge Clock_tb);
    MEM_in_tb = 16'd0;
    WR_tb = 1'd0;
    @(posedge Clock_tb);

// Demo a write hit:
    @(posedge Clock_tb);
    MEM_address_tb = 16'd15;
    MEM_in_tb = 16'd15;
    WR_tb = 1'd1;
    @(posedge Clock_tb);
    wait (Done_tb);
    @(posedge Clock_tb);
    MEM_in_tb = 16'd0;
    WR_tb = 1'd0;
    @(posedge Clock_tb);

// Endurance test
    // Fully populate cache with 'new' blocks -> should be all 'miss'
    for (i = 0; i < 16; i = i+1)begin
        @(posedge Clock_tb);
        MEM_address_tb = (i*32)+64;
        @(posedge Clock_tb);
        wait (Done_tb);
        @(posedge Clock_tb);
    end
    // Read/write to blocks in cache -> should be all 'hits'
    for (i = 15; i >= 0; i = i-1)begin
        @(posedge Clock_tb);
        MEM_address_tb = (i*32)+64;
        MEM_in_tb = MEM_address_tb;
        WR_tb = 1'd1;
        @(posedge Clock_tb);
        wait (Done_tb);
        @(posedge Clock_tb);
        MEM_address_tb = ((i-31)*-32)+64;
        MEM_in_tb = 0;
        WR_tb = 1'd0;
        @(posedge Clock_tb);
        wait (Done_tb);
        @(posedge Clock_tb);
    end
    // Fully populate cache with 'new' blocks -> should be all 'miss with writeback'
    for (i = 16; i < 30; i = i+1)begin
        @(posedge Clock_tb);
        MEM_address_tb = (i*32)+64; // Offset is 16*16+64 to ensure "clean" memory
        @(posedge Clock_tb);
        wait (Done_tb);
        @(posedge Clock_tb);
    end
    // Read back 'written to' blocks -> should be all 'miss'
    for (i = 0; i < 32; i = i+1)begin
        @(posedge Clock_tb);
        MEM_address_tb = (i*32)+64;
        @(posedge Clock_tb);
        wait (Done_tb);
        @(posedge Clock_tb);
    end
    // Read back 'written to' blocks -> should be all 'hits'
    for (i = 0; i < 32; i = i+1)begin
        @(posedge Clock_tb);
        MEM_address_tb = (i*32)+64;
        @(posedge Clock_tb);
        wait (Done_tb);
        @(posedge Clock_tb);
    end

    repeat (10) @(posedge Clock_tb);
$stop;// Take a look at mem_browser 
address_sample_period = 1;
// Random read/write test:
// Comment this out until you pass the endurance test
    repeat (5000) apply_random_test();
    if(failcount > 0) begin
        $display ("Test sequence ended, check failed assertions");
    end
    else begin
        $display ("Test sequence ended, no failed assertions detected, this DOES NOT guarantee that DUT is perfect");
    end
    $display ("Number of failed assertions: %d",failcount);
    $display ("------------------------------------------------------------\n\n");
    $stop; // Normally we would use $finish, but modelsim prefers $stop
end

/*-----------------------------------
*       Random Test Sequencer
-----------------------------------*/
task apply_random_test;
// This task will do random reads/writes in an attempt to improve coverage and find any weird edge cases
begin
    @(posedge Clock_tb)
    //2^14 is ~16000, so we'll constrain this to 0-999 to make it more likely to re-use an address.
    MEM_address_tb = $random % 1000;
    MEM_in_tb =  $random % 1000;
    WR_tb = $random;
    @(posedge Clock_tb);
    wait (Done_tb);
    @(posedge Clock_tb);
end
endtask
/*-------------------------------------------------------------------------------------------------------------------------------
// If I have a bug that only occurs 1 in 1000 times, I would need to run >> 1000 iterations of random tests in order to find it
// Snippet of code from the CAM:
    if (rd == 1) begin
        if ($random%1000 >= 998) dout = 0; // <- this is me injecting a weird code bug for an example of a 2 in 1000 error
        else dout = cam_mem[int_addrs];
// Resulting simulation output:
    # ------------------------------------------------------------
    # Start of Test Sequence:
    # Model check failed for address     6 expected data   503 recieved data     0
    # Model check failed for address     6 expected data   503 recieved data     0
    # Model check failed for address    13 expected data 11776 recieved data     0
    # Model check failed for address    13 expected data 11776 recieved data     0
    # Model check failed for address 15961 expected data     0 recieved data 15415
    # Model check failed for address 15961 expected data     0 recieved data 15415
    # Test sequence ended, check failed assertions
    # Number of failed assertions:           6
    # ------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------*/
endmodule
