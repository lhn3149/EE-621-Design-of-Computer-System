module dxp_CAM_v (we, rd, din, argin, addrs, dout, mbits);

//----------------------------------------------------------------------------
//-- Declare parameters and default values
//----------------------------------------------------------------------------
	parameter arg_max=7, addrs_max=4, bl_max=16;
//----------------------------------------------------------------------------
//-- Declare input and output port types
//----------------------------------------------------------------------------
	input	we, rd; //write and read enables active high
	input	[arg_max-5:0]	din, argin; //argument in
	input	[addrs_max-1:0]	addrs;
	output	reg	[arg_max-5:0]	dout; //mbits = match bits
	output	reg	[bl_max-1:0] mbits; //mbits = match bits
//----------------------------------------------------------------------------
//-- Declare internal memory array
//----------------------------------------------------------------------------
	reg	[arg_max-5:0] cam_mem [bl_max-1:0];
	integer	i, int_addrs;
//----------------------------------------------------------------------------
//-- The INITIALIZE procedural block
//----------------------------------------------------------------------------
	initial begin for (i=0; i<bl_max; i=i+1) cam_mem[i] = {(arg_max-4){1'b1}}; 
		mbits = {bl_max{1'b0}};	end
//----------------------------------------------------------------------------
//-- The WRITE procedural block
//----------------------------------------------------------------------------
	always @ (we, din, addrs)
		begin
			int_addrs = addrs;
			if (we == 1)
				begin
					cam_mem[int_addrs] = din;
				end
		end
//----------------------------------------------------------------------------
//-- The READ procedural block
//----------------------------------------------------------------------------
	always @ (rd, addrs)
		begin
			int_addrs = addrs;
			if (rd == 1)
				begin
					dout = cam_mem[int_addrs];
				end
			else
				begin
					dout = {(arg_max-4){1'bz}};
				end
		end
//----------------------------------------------------------------------------
//-- The MATCH procedural block
//----------------------------------------------------------------------------
	always @ (argin, cam_mem)
		begin
			mbits = {bl_max{1'b0}};
				for (i=0; i <= bl_max-1; i=i+1)
					begin
						if (argin == cam_mem[i])
							begin
								mbits[i] = 1;
							end
					end
		end
endmodule
