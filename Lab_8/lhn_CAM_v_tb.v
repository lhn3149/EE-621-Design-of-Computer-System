module lhn_CAM_v_tb;

//----------------------------------------------------------------------------
//-- Declare input stimuli and expected outputs
//----------------------------------------------------------------------------
	reg	we_n_tb, rd_n_tb; //output enable
	reg	[8:0]	din_tb, argin_tb; //argument in
	reg	[3:0]	addrs_tb;
	wire	[8:0]	dout_tb; 
	wire 	[4:0] mbits_tb; //mbits = match bits
	integer i;

lhn_CAM_v dut (we_n_tb, rd_n_tb, din_tb, argin_tb, addrs_tb, dout_tb, mbits_tb);

//----------------------------------------------------------------------------
// In the procedural block below, we write to all memory locations, we read 
// these out, and then load some argument values to see with which locations 
// these match - see match bits values.
//----------------------------------------------------------------------------

initial begin
		we_n_tb = 1;
		rd_n_tb = 1;
		din_tb = 9'd0;
		argin_tb = 9'd0;
		addrs_tb = 4'b0000;
		#2000	
		for (i=0; i<=15; i=i+1) begin
			we_n_tb = 1;
			rd_n_tb = 1;
			din_tb  = 9'h55;
			argin_tb = 9'd0;
			addrs_tb = i;
			#2000
			we_n_tb = 0;
			rd_n_tb = 1;
			din_tb = din_tb + i ;
			argin_tb = 9'd0;
			addrs_tb = i;
			#2000;
		end
		we_n_tb = 1;
		#2000
		for (i=0; i<=15; i=i+1) begin
			we_n_tb = 1;
			rd_n_tb = 1;
			din_tb = 9'h55;
			argin_tb = 9'h0;
			addrs_tb = i;
			#2000
			we_n_tb = 1;
			rd_n_tb = 0;
			din_tb = 9'h55;
			addrs_tb = i;
			#2000;
		end
		rd_n_tb = 1;
		#2000
		argin_tb = 9'h55;
		#2000
		we_n_tb = 1;
		rd_n_tb = 1;
		din_tb = 9'h55;
		argin_tb = 9'h55;
		addrs_tb = 5;
							
		#2000
		we_n_tb = 0;
		rd_n_tb = 1;
		din_tb = 9'hff;
		argin_tb = 9'h0;
		addrs_tb = 5;
		
		#2000
		we_n_tb = 1;
		argin_tb = 9'hff;
		#2000
		argin_tb = 9'h55;
	end	
endmodule
