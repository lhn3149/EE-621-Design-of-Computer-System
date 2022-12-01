odule FPGA_Top_Wrapper (
input         Resetn_pin , // Reset Signal from push button
input         Clock_pin  , // Clock Signal from FPGA 50 MHz Oscillator
input  [ 4:0] SW_pin     , // 4 user switches and one pushbutton
output [ 7:0] Display_pin  // 8 LEDs on the FPGA
);
wire c0;
wire c1;
wire c2;

wreRISC621pipe_v risc_inst_0(
	.Resetn_pin      ( Resetn_pin  ), 
	.c0              ( c0          ), 
   .c1              ( c1          ),
	.c2              ( c2          ),
	.SW_pin          ( SW_pin      ), 
	.Display_pin     ( Display_pin ), 
	.ICis            ( /*NC*/      )
);
defparam risc_inst_0.my_cache.my_ram.altsyncram_component.init_file = "wre_ram_1.mif";


wreRISC621pipe_v risc_inst_1(
	.Resetn_pin      ( Resetn_pin  ), 
	.c0              ( c0          ), 
   .c1              ( c1          ),
	.c2              ( c2          ),
	.SW_pin          ( SW_pin      ), 
	.Display_pin     (             ), 
	.ICis            ( /*NC*/      )
);
defparam risc_inst_1.my_cache.my_ram.altsyncram_component.init_file = "wre_ram_1.mif";


wreRISC621pipe_v risc_inst_2(
	.Resetn_pin      ( Resetn_pin  ), 
	.c0              ( c0          ), 
   .c1              ( c1          ),
	.c2              ( c2          ),
	.SW_pin          ( SW_pin      ), 
	.Display_pin     (             ), 
	.ICis            ( /*NC*/      )
);
defparam risc_inst_2.my_cache.my_ram.altsyncram_component.init_file = "wre_ram_1.mif";


wreRISC621pipe_v risc_inst_3(
	.Resetn_pin      ( Resetn_pin  ), 
	.c0              ( c0          ), 
   .c1              ( c1          ),
	.c2              ( c2          ),
	.SW_pin          ( SW_pin      ), 
	.Display_pin     (             ), 
	.ICis            ( /*NC*/      )
);
defparam risc_inst_3.my_cache.my_ram.altsyncram_component.init_file = "wre_ram_1.mif";


wre_pll_3_v my_pll (
	.inclk0 ( Clock_pin ),
	.c0     ( c0        ),
	.c1     ( c1        ),
	.c2     ( c2        )
);


endmodule
