module lhn_3to8_dec (data_in, eq);

input [2:0] data_in;
output reg	[7:0] eq;

always @ (data_in)
	case (data_in)
		3'h0: eq = 8'h01;
		3'h1: eq = 8'h02;
		3'h2: eq = 8'h04;
		3'h3: eq = 8'h08;
		3'h4: eq = 8'h10;
		3'h5: eq = 8'h20;
		3'h6: eq = 8'h40;
		3'h7: eq = 8'h80;
		default: eq = 8'h00;
	endcase
endmodule
