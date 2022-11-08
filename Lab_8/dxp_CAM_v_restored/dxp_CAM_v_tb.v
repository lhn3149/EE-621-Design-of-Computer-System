module dxp_CAM_v_tb;

//----------------------------------------------------------------------------
//-- Declare input stimuli and expected outputs
//----------------------------------------------------------------------------
	reg	we_n_tb, rd_n_tb; //output enable
	reg	[7:0]	din_tb, argin_tb; //argument in
	reg	[2:0]	addrs_tb;
	wire	[7:0]	dout_tb, mbits_tb; //mbits = match bits
	integer i;

dxp_CAM_v dut (we_n_tb, rd_n_tb, din_tb, argin_tb, addrs_tb, dout_tb, mbits_tb);

//----------------------------------------------------------------------------
// In the procedural block below, we write to all memory locations, we read 
// these out, and then load some argument values to see with which locations 
// these match - see match bits values.
//----------------------------------------------------------------------------

initial begin
		we_n_tb = 1;
		rd_n_tb = 1;
		din_tb = 8'b00000000;
		argin_tb = 8'b00000000;
		addrs_tb = 3'b000;
		din_tb = 8'b01010101;
		#20000		
		for (i=0; i<=7; i=i+1) begin
			we_n_tb = 1;
			rd_n_tb = 1;
			din_tb = 8'b01010101;
			argin_tb = 8'b00000000;
			addrs_tb = i;
			#20000
			we_n_tb = 0;
			rd_n_tb = 1;
			din_tb = din_tb + i ;
			argin_tb = 8'b00000000;
			addrs_tb = i;
			#20000;
		end
		we_n_tb = 1;
		#20000
		for (i=0; i<=7; i=i+1) begin
			we_n_tb = 1;
			rd_n_tb = 1;
			din_tb = 8'b10101010;
			argin_tb = 8'b00000000;
			addrs_tb = i;
			#20000
			we_n_tb = 1;
			rd_n_tb = 0;
			din_tb = 8'b10101010;
			argin_tb = 8'b00000000;
			addrs_tb = i;
			#20000;
		end
		rd_n_tb = 1;
		#20000
		argin_tb = 8'b01010101;
		#20000
		we_n_tb = 1;
		rd_n_tb = 1;
		din_tb = 8'b11111111;
		argin_tb = 8'b00000000;
		addrs_tb = 5;
							
		#20000
		we_n_tb = 0;
		rd_n_tb = 1;
		din_tb = 8'b11111111;
		argin_tb = 8'b00000000;
		addrs_tb = 5;
		
		#20000
		we_n_tb = 1;
		argin_tb = 8'b11111111;
		#20000
		argin_tb = 8'b00000000;
	end	
endmodule
