module lhn_3to8_dec (data_in, eq);

input [2:0] data_in;
output reg	[13:0] eq;

always @ (data_in)
	case (data_in)
		3'h0: eq = 14'h0001;
		3'h1: eq = 14'h0002;
		3'h2: eq = 14'h0004;
		3'h3: eq = 14'h0008;
		3'h4: eq = 14'h0010;
		3'h5: eq = 14'h0020;
		3'h6: eq = 14'h0040;
		3'h7: eq = 14'h0080;
		default: eq = 14'h0000;
	endcase
endmodule
