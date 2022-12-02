module FPGA_Top_Wrapper (
input         Resetn_pin , // Reset Signal from push button
input         Clock_pin  , // Clock Signal from FPGA 50 MHz Oscillator
input  [ 4:0] SW_pin     , // 4 user switches and one pushbutton
output reg [ 7:0] Display_pin  // 8 LEDs on the FPGA
);
wire c0, c1, c2;
wire Done_core0, Done_core1,Done_core2, Done_core3;
reg [4:0] SW_pin_0, SW_pin_1, SW_pin_2, SW_pin_3;
wire [7:0] Display_core0, Display_core1, Display_core2, Display_core3;
//reg [7:0] Display_pin;
integer array_size, core_order, operation_per_core;
parameter [2:0] core0 = 3'd0, core1 = 3'd1, core2=3'd2, core3=3'd3;

lhnRISC621_v risc_inst_0(
	.Resetn_pin      ( Resetn_pin  ), 
	.c0              ( c0          ), 
   .c1              ( c1          ),
	.c2              ( c2          ),
	.SW_pin          ( SW_pin_0      ), 
	.Display_pin     ( Display_core0 ), 
	.ICis            ( /*NC*/      ),
	.Done				  ( Done_core0	 )
);
defparam risc_inst_0.my_cache.my_ram.altsyncram_component.init_file = "lab11_core0.mif";

lhnRISC621_v risc_inst_1(
	.Resetn_pin      ( Resetn_pin  ),	
	.c0              ( c0          ), 
   .c1              ( c1          ),
	.c2              ( c2          ),
	.SW_pin          ( SW_pin_1   ), 
	.Display_pin     ( Display_core1 ),
	.ICis            ( /*NC*/      ),
	.Done					( Done_core1 )
);
defparam risc_inst_1.my_cache.my_ram.altsyncram_component.init_file = "lab11_core1.mif";

lhnRISC621_v risc_inst_2(
	.Resetn_pin      ( Resetn_pin  ),	
	.c0              ( c0          ), 
   .c1              ( c1          ),
	.c2              ( c2          ),
	.SW_pin          ( SW_pin_2   ), 
	.Display_pin     ( Display_core2 ),
	.ICis            ( /*NC*/      ),
	.Done					( Done_core2 )
);
defparam risc_inst_2.my_cache.my_ram.altsyncram_component.init_file = "lab11_core2.mif";


lhnRISC621_v risc_inst_3(
	.Resetn_pin      ( Resetn_pin  ),	
	.c0              ( c0          ), 
   .c1              ( c1          ),
	.c2              ( c2          ),
	.SW_pin          ( SW_pin_3   ), 
	.Display_pin     ( Display_core3 ),
	.ICis            ( /*NC*/      ),
	.Done					( Done_core3 )
);
defparam risc_inst_3.my_cache.my_ram.altsyncram_component.init_file = "lab11_core3.mif";


lhn_pll_3_v my_pll (
	.inclk0 ( Clock_pin ),
	.c0     ( c0        ),
	.c1     ( c1        ),
	.c2     ( c2        )
);


always @(posedge Clock_pin)
	if (Resetn_pin == 0)
				begin	
					SW_pin_0 = 5'd0; SW_pin_1 = 5'd0; SW_pin_2 = 5'd0; SW_pin_3 = 5'd0;
					//Display_core0 = 8'd0; Display_core1 = 8'd0;
					//Done_core0 = 1'b0; Done_core1 = 1'b0; 
					core_order = 0; array_size = 16; operation_per_core = 5;
				end
	else 
	begin
		if (!Done_core0 & !Done_core1 & !Done_core2 & !Done_core3) begin
			SW_pin_0 = SW_pin;
			SW_pin_1 = SW_pin;
			SW_pin_2 = SW_pin;
			SW_pin_3 = SW_pin;
			Display_pin = Display_core0; // in the input process, just display either core
		end
		if (Done_core0 & Done_core1) begin
		// =========== Displaying to the output =============== //
			case (core_order)
				core0: begin 
					if ((SW_pin_0[0]==1'b1) & (SW_pin[0]==1'b0)) operation_per_core = operation_per_core - 1;
					SW_pin_0 = SW_pin ; 
					Display_pin = Display_core0 ; 
				end
				core1: begin
					if ((SW_pin_1[0]==1'b1) & (SW_pin[0]==1'b0)) operation_per_core = operation_per_core - 1;
					SW_pin_1 = SW_pin ; 
					Display_pin = Display_core1 ; 
				end
				core2: begin
					if ((SW_pin_2[0]==1'b1) & (SW_pin[0]==1'b0)) operation_per_core = operation_per_core - 1;
					SW_pin_2 = SW_pin ; 
					Display_pin = Display_core2 ; 
				end
				core3: begin
					if ((SW_pin_3[0]==1'b1) & (SW_pin[0]==1'b0)) operation_per_core = operation_per_core - 1;
					SW_pin_3 = SW_pin ; 
					Display_pin = Display_core3 ; 
				end
			endcase
			
			if (operation_per_core == 0) begin
				operation_per_core = 5;
				core_order = core_order + 1'b1;
			end
			
			// Control when to switch the display to the next core (when operation_per_core hits 0), but when to decrement operation_per_core?
	
		end
	end


endmodule
