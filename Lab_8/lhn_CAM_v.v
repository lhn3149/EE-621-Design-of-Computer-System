module lhn_CAM_v (we_n, rd_n, din, argin, addrs, dout, mbits);

// 14 bit address
// 8W / block --> 3b for specify words
// 16 locations, 2-way associative  --> 8 groups --> 3b for groups
// 8b for TAGs
 
//----------------------------------------------------------------------------
//-- Declare input and output port types
//----------------------------------------------------------------------------
	input	we_n, rd_n; 		//write and read enables
	input	[8:0]	din, argin; //data input and argument input busses
	input	[3:0] addrs; 		//	point to 16 locations, internally will splits to group and TAG
	output	reg	[8:0]	dout; //data output bus and mbits = match bits
	output reg [15:0] mbits;
//----------------------------------------------------------------------------
//-- Declare internal memory array
//----------------------------------------------------------------------------
	reg	[8:0] cam_mem [7:0][1:0]; // 2x8 array CAM
			//^8 bit tag,^8 groups,^2-way associative
	integer	i, j, tag, grp;
//----------------------------------------------------------------------------
//-- The WRITE procedural block.
//-- This enables a new tag value to be written at a specific location, 
//--    using a WE, data input and address input busses as with any
//--    other memory.
//-- In the context of a cache, this happens when a new block is 
//--    uploaded in the cache.
//----------------------------------------------------------------------------
	always @ (we_n, din, addrs)
		begin
			grp = addrs[3:1];
			tag = addrs[0];		
			if (we_n == 0)
				begin
					cam_mem[grp][tag] = din;
				end
		end

	always @ (rd_n, addrs, cam_mem)
		begin
			grp = addrs[3:1];
			tag = addrs[0];	
			if (rd_n == 0)
				begin
					dout = cam_mem[grp][tag];
				end
			else
				begin
					dout = 9'h00;
				end
		end
//----------------------------------------------------------------------------
//-- The MATCH procedural block.
//-- This implements the actual CAM function.
//-- An mbit is 1 if the argument value is equal to the content of the 
//--    memory location associated with it.
//----------------------------------------------------------------------------
	always @ (argin)
		begin
				for (i=0; i <= 1; i=i+1)
					begin
						for (j=0; j<=7; j=j+1)
						begin
							if (argin == cam_mem[j][i]) begin
									mbits[j+i] = 1; end
						end
					end
		end
endmodule
