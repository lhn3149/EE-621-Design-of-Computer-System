`timescale 1 ns / 1 ps

module lhnRISC621_v (Resetn_pin, c0, c1, c2, SW_pin, Display_pin, ICis);

	input	Resetn_pin, c0, c1, c2;
	input	[4:0] SW_pin;			// Four switches and one push-button
	output [7:0] Display_pin;	// 8 LEDs
	output [95:0] ICis; // For simulation ONLY; should be commented out for 
								//board emulation!

	parameter [1:0] MC0=2'b00, MC1=2'b01, MC2=2'b10, MC3=2'b11; //machine cycles
	parameter [5:0] 	LD_IC = 6'b000000, 	ST_IC  =6'b000001, 	//reg-mem data transfer instruction cycles
							CPY_IC =6'b000010, 	SWAP_IC=6'b000011, 	//reg-reg data transfer instruction cycles
							JMP_IC =6'b000100, 								//flow control instruction cycle
							ADD_IC =6'b000101, 	SUB_IC =6'b000110, 	//arithmetic manipulation instruction
							ADDC_IC=6'b000111, 	SUBC_IC=6'b001000, 	//cycles
							
							MUL_IC =6'b001001,	DIV_IC =6'b001010, 	//mul div
							NOT_IC =6'b001011, 	AND_IC =6'b001100,  	//logic manipulation instruction 
							OR_IC  =6'b001101,	XOR_IC =6'b001110,	//cycles
							
							SRL_IC =6'b001111,	SRA_IC =6'b010000,    //shift right logic/algorithm Ri by Rj field value positions
							ROTL_IC=6'b010001,	ROTR_IC=6'b010010,	// rptate left/right by Rj field value positions
							RLN_IC =6'b010011,	RLZ_IC =6'b010100,	// rotate left through status bit Ri by Rj_field value
							RRC_IC =6'b010101,	RRV_IC =6'b010110, 	// rotate right through status bit Ri by Rj_field value
							VADD_IC=6'b010111, 	VSUB_IC=6'b011000,	
							CALL_IC=6'b011001,											//SIMD (vector) instruction cycles 
							RET_IC =6'b011010,	
							IN_IC  =6'b011011,	OUT_IC =6'b011100,		//cycles - to be implemented later
							NOP 	 =6'b011101;
							
	parameter [3:0] JU=4'b0000, JC1=4'b1000, JN1=4'b0100, JV1=4'b0010, //Jump condition(s) 
		JZ1=4'b0001, JC0=4'b0111, JN0=4'b1011, JV0=4'b1101, JZ0=4'b1110; //definition(s)
	reg [13:0] R [15:0]; //Register File (RF) 16 14-bit registers
	reg [13:0] IP[16:0]; // I/O P Map 16 14-bit registers
	reg [13:0] IPDR, OPDR; // for this lab, input is the Switches and output is 7-bit Display
								// it's small so we don't need to use a separate map.
	reg	WR_DM, stall_mc0, stall_mc1, stall_mc2, stall_mc3;
	//reg [1:0] MC;
	reg [28:0] res;
	reg [13:0] PC, IR3, IR2, IR1, MAB, MAX, MA, DM_in, MAeff, LDSTvalue;
	reg [13:0] SP ; // Stack pointer
	reg [13:0] TA, TB, TALUH, TALUL;
	reg [11:0] TSR, SR;
	reg [7:0] Display_pin;
	reg [14:0]	TALUout;
	reg [13:0] perf_counter; 
	wire [13:0]	PM_out, DM_out;
	wire 	C, Clock_pin, Clock_not, cache_done;
	//integer Call_count;
	integer  Ri1, Rj1, Ri2, Rj2, Ri3, Rj3;
	integer IPA, OPA; // address for I/O Peripheral field. 
	integer k;
	
		assign 	Clock_pin = c0;
		assign	Clock_not = ~Clock_pin;
		
		always @(posedge Clock_not) IPDR = {9'd0, SW_pin};
		
		always @(posedge Clock_not) begin
			if (R[4'd11] == 1'd1) begin
				perf_counter = perf_counter + 1; end 
		end
		// Von Neumann architecture
		// lhn_cache_2w_v	main_memory(MAeff[9:0], Clock_not, DM_in, WR_DM, PM_out);
		
		
		lhn_cache_2w_v	my_cache(Resetn_pin, MAeff, DM_in, 	WR_DM, c0, c1, c2, PM_out, cache_done);
		
		
		// 							Resetn, MEM_address,MEM_in, WR, Clock, MEM_out, Done

		lhn_ir2assembly_v IWdecode (IR1, Resetn_pin, Clock_pin, ICis); //IR, Resetn_pin, Clock_pin, ICis

		always@(posedge Clock_not)
			if (Resetn_pin == 0)
				begin	
				PC = 14'h0000; // Initialize the PC to point to the location of 
				// the FIRST instruction to be executed; loaction 0000 is arbitrary!
				// 64 16-bit: R[0] = 0; R[1] = 0; R[2] = 0; R[3] = 0; // Necessary for sim
				for (k = 0; k < 16; k = k+1) begin R[k] = 0; end
				stall_mc0=0; stall_mc1=1; stall_mc2=1; stall_mc3=1;
				IR1 = 14'h3fff; IR2 = 14'h3fff; IR3 = 14'h3fff; // oxffff Don't care opCode
				Ri1 = 0; Rj1 = 0; Ri2 = 0; Rj2 = 0; Ri3 = 0; Rj3 = 0;
				MAB = 14'h0000; MAX = 14'h0000; DM_in = 14'h0000;
				TA = 14'h0000; TB = 14'h0000; MAeff = 14'h0000; TALUH = 14'h0000; TALUL = 14'h0000;
				TSR = 11'b000; SR = 11'b000; TALUout = 15'h00000;
				SP = 14'h3FFF; perf_counter = 14'd0;
				end
			else if (cache_done)	begin
				if ( stall_mc3 == 0) begin
				case (IR3[13:8])
					LD_IC: begin 
						MAeff = LDSTvalue;
						R[IR3[3:0]] = PM_out;
						MAeff = PC;
						end
					ST_IC: begin 
						MAeff = LDSTvalue;
						DM_in = R[IR3[3:0]] ; WR_DM=1'd0;
						MAeff = PC;
					end
					CPY_IC: begin R[IR3[7:4]] = TALUL; end
					JMP_IC: begin
						MAeff = LDSTvalue;
						case (IR3[3:0])
							JC1: begin if (SR[11] == 1) PC = MAeff; else MAeff = PC; end
							JN1: begin if (SR[10] == 1) PC = MAeff; else MAeff = PC; end
							JV1: begin if (SR[9] == 1) PC = MAeff; else MAeff = PC; end
							JZ1: begin if (SR[8] == 1) PC = MAeff; else MAeff = PC; end
							
							JC0: begin if (SR[11] == 0) PC = MAeff; else MAeff = PC; end
							JN0: begin if (SR[10] == 0) PC = MAeff; else MAeff = PC; end
							JV0: begin if (SR[9] == 0) PC = MAeff; else MAeff = PC; end
							JZ0: begin if (SR[8] == 0) PC = MAeff; else MAeff = PC; end
							JU:  begin PC = MAeff; end
							default: PC = PC; //
						endcase end
					RET_IC: begin
							MAeff = PM_out;
							PC = MAeff;
							SP = SP +1'b1;
							end
					CALL_IC: begin
							MAeff = SP;
							DM_in = {2'd0,SR};
							WR_DM = 1'b0; // don't write
							MAeff = MAB + MAX;
							PC = MAeff; end	
					SWAP_IC: begin R[IR3[7:4]] = TALUL; 
					R[IR3[3:0]] = TALUH; end
					
					ADD_IC, SUB_IC, ADDC_IC, SUBC_IC, NOT_IC, AND_IC, OR_IC, XOR_IC, 
					SRL_IC, SRA_IC, ROTL_IC, ROTR_IC, RLN_IC, RLZ_IC, RRC_IC, RRV_IC, VADD_IC, VSUB_IC:
						begin
							R[IR3[7:4]] = TALUH;
							SR = TSR; end
					MUL_IC, DIV_IC: begin
							R[IR3[7:4]] = TALUH; end
							//R[IR3[7:4]] = TALUH; end
					IN_IC: begin R[IR3[7:4]] = TA; end
					OUT_IC: begin
							OPDR = R[IR3[7:4]];
							Display_pin = OPDR[7:0]; end
					default: ;
				endcase
				WR_DM = 1'b0;	
				//MAeff = PC;
				end
				
				if (stall_mc2 == 0) begin
				case (IR2[13:8])
					LD_IC, JMP_IC: begin
						MAeff = MAB + MAX;
						LDSTvalue = MAeff;
						WR_DM = 0; end
					ST_IC: begin
						MAeff = MAB + MAX;
						LDSTvalue = MAeff;
						WR_DM = 1'b1;
						if (Rj2 == Ri3 && (IR3[13:8] != LD_IC) && (IR3[13:8] !=ST_IC) && (IR3[13:8] != JMP_IC) && (IR3[13:8]!=IN_IC) && (IR3[13:8]!=OUT_IC))
							begin DM_in = R[Ri3]; end
						else if (Rj2 == Rj3 && IR3[13:8] == SWAP_IC) DM_in = R[Rj3];
						else DM_in = R[IR2[3:0]]; 
						end 

					CPY_IC: begin TALUL = TB; end
					SWAP_IC: begin TALUH = TA; TALUL = TB;end
					
					CALL_IC: begin
						MAeff = SP;
						WR_DM = 1'b1;
						DM_in = PC ; 
						SP = SP - 1'b1;
					end

					RET_IC: begin	
						MAeff = SP;
						PC = PM_out;
					end
					ADD_IC, ADDC_IC:
						begin
							TALUout = TA + TB;
							TSR[11] = TALUout[14]; // Carry
							TSR[10] = TALUout[13]; // Negative
							TSR[9] = ((TA[13] ~^ TB[13]) & TA[13]) ^ (TALUout[13] & (TA[13] ~^ TB[13])); // V Overflow
							if (TALUout[13:0] == 14'h0000) TSR[8] = 1; else TSR[8] = 0; // Zero
							TALUH = TALUout[13:0];
						end
					VADD_IC:
						begin
							TALUout[7:0] = TA[6:0] + TB[6:0];
							TSR[3] = TALUout[7]; TSR[2] = TALUout[6];
							TSR[1] = ((TA[6] ~^ TB[6]) & TA[6]) ^ (TALUout[6] & (TA[6] ~^ TB[6])); // V Overflow
							if (TALUout[7:0] == 8'h0000) TSR[0] = 1; else TSR[0] = 0; // Zero
							TALUH[6:0] = TALUout[6:0];
							
							TALUout[14:7] = TA[13:7] + TB[13:7];
							TSR[7] = TALUout[14]; TSR[6] = TALUout[13];
							TSR[5] = ((TA[13] ~^ TB[13]) & TA[13]) ^ (TALUout[13] & (TA[13] ~^ TB[13])); // V Overflow
							if (TALUout[14:7] == 8'h0000) TSR[4] = 1; else TSR[4] = 0; // Zero
							TALUH[13:7] = TALUout[13:7];
						end
					VSUB_IC:
						begin
							TALUout[7:0] = TA[6:0] - TB[6:0];
							TSR[3] = TALUout[7]; TSR[2] = TALUout[6];
							TSR[1] = ((TA[6] ~^ TB[6]) & TA[6]) ^ (TALUout[6] & (TA[6] ~^ TB[6])); // V Overflow
							if (TALUout[7:0] == 8'h0000) TSR[0] = 1; else TSR[0] = 0; // Zero
							TALUH[6:0] = TALUout[6:0];
							
							TALUout[14:7] = TA[13:7] - TB[13:7];
							TSR[7] = TALUout[14]; TSR[6] = TALUout[13];
							TSR[5] = ((TA[13] ~^ TB[13]) & TA[13]) ^ (TALUout[13] & (TA[13] ~^ TB[13])); // V Overflow
							if (TALUout[14:7] == 8'h0000) TSR[4] = 1; else TSR[4] = 0; // Zero
							TALUH[13:7] = TALUout[13:7];
						end
					MUL_IC:
						begin
							res = TA*TB;
							TALUout = res[14:0];
							TALUL = res[27:14];
							TALUH = res[13:0];
							// high first 14 bits -> Ri/Rj, low last 14 bits -> Rj/Ri.
							TSR[11] = TALUout[14]; // Carry
							TSR[10] = TALUout[13]; // Negative
							TSR[9] = ((TA[13] ~^ TB[13]) & TA[13]) ^ (TALUout[13] & (TA[13] ~^ TB[13])); // V Overflow
							if (TALUout[13:0] == 14'h0000) TSR[8] = 1; else TSR[8] = 0; // Zero
							//TALUH = TALUout[13:0];
						end
						
					DIV_IC:
						begin
							res = TA/TB;
							TALUL = TA%TB;
							TALUout = res[14:0];
							TALUH = res[13:0];
							TSR[11] = TALUout[14]; // Carry
							TSR[10] = TALUout[13]; // Negative
							TSR[9] = ((TA[13] ~^ TB[13]) & TA[13]) ^ (TALUout[13] & (TA[13] ~^ TB[13])); // V Overflow
							if (TALUout[13:0] == 14'h0000) TSR[8] = 1; else TSR[8] = 0; // Zero
							TALUH = TALUout[13:0]; 
						end
						
					SUB_IC, SUBC_IC:
						begin
							TALUout = TA - TB;
							TSR[11] = TALUout[14]; // Carry
							TSR[10] = TALUout[13]; // Negative
							TSR[9] = ((TA[13] ~^ TB[13]) & TA[13]) ^ (TALUout[13] & (TA[13] ~^ TB[13])); // V Overflow
							if (TALUout[13:0] == 14'h0000) TSR[8] = 1; else TSR[8] = 0; // Zero
							TALUH = TALUout[13:0];
						end
					NOT_IC:
						begin
							TALUH = ~TA; //Carry and Overflow are not affected by ~
							TSR[10] = TALUH[13]; // Negative
							if (TALUout[13:0] == 14'h0000) TSR[8] = 1; else TSR[8] = 0; // Zero
						end
					AND_IC:
						begin
							TALUH = TA & TB; //Carry and Overflow are not affected by &
							TSR[10] = TALUH[13]; // Negative
							if (TALUout[13:0] == 14'h0000) TSR[8] = 1; else TSR[8] = 0; // Zero
						end
					OR_IC:
						begin
							TALUH = TA | TB; //Carry and Overflow are not affected by |
							TSR[10] = TALUH[13]; // Negative
							if (TALUout[13:0] == 14'h0000) TSR[8] = 1; else TSR[8] = 0; // Zero
						end
					XOR_IC:
					begin
						TALUH = TA ^ TB; //Carry and Overflow are not affected by |
						TSR[10] = TALUH[13]; // Negative
						if (TALUout[13:0] == 14'h0000) TSR[8] = 1; else TSR[8] = 0; // Zero
					end
					
					SRA_IC:
						begin
							case (IR2[1:0])
								2'b00:begin TALUH = TA; end
								2'b01: begin TALUH[13]=TA[13]; TALUH[12:0]=TA[13:1]; end
								2'b10:begin TALUH[13]=TA[13]; TALUH[12]=TA[13]; TALUH[11:0]=TA[13:2]; end
								2'b11: begin TALUH[13]=TA[13]; TALUH[12]=TA[13]; TALUH[11]=TA[13]; TALUH[10:0]=TA[13:3]; end
								endcase
						end
						
						
					SRL_IC: begin
							case (IR2[1:0]) //Implementing ONLY 4(3) shift values
							// Design choice to just consider 4-bit shift
								2'b00:begin TALUH = TA; end
								2'b01:begin TALUH[0]=1'b0; TALUH[13:1]=TA[12:0]; end
								2'b10:begin TALUH[1:0]=2'b00; TALUH[13:2]=TA[11:0]; end
								2'b11:begin TALUH[2:0]=3'b000; TALUH[10:0]=TA[10:0]; end
								endcase end
						
					 
					 ROTR_IC: begin
							case (IR2[1:0])
								2'b00:begin TALUH = TA; end
								2'b01: begin TALUH[13]=TA[0]; TALUH[12:0]=TA[13:1]; end
								2'b10:begin TALUH[13]=TA[1]; TALUH[12]=TA[0]; TALUH[11:0]=TA[13:2]; end
								2'b11:begin TALUH[13]=TA[2]; TALUH[12]=TA[1]; TALUH[11]=TA[0]; TALUH[10:0]=TA[13:3]; end
								endcase end
					 
					 ROTL_IC: begin
							case (IR2[1:0])
								2'b00:begin TALUH = TA;end
								2'b01:begin TALUH[0]=TA[13]; TALUH[13:1]=TA[12:0]; end
								2'b10:begin TALUH[1]=TA[13]; TALUH[0]=TA[12]; TALUH[13:2]=TA[11:0]; end
								2'b11:begin TALUH[2]=TA[13]; TALUH[1]=TA[12]; TALUH[0]=TA[11]; TALUH[13:3]=TA[10:0]; end
								endcase end
						
					RLN_IC: //Negative TSR[10]
						begin
							case (IR2[1:0]) //Implementing ONLY 4(3) shift values
							// Design choice to just consider 4-bit shift
								2'b00:begin TALUH = TA;end
								2'b01:begin TALUH[0]= TSR[10]; TSR[10]=TA[13]; TALUH[13:1]=TA[12:0]; end
								2'b10:begin TALUH[1]= TSR[10]; TALUH[0]=TA[13]; TSR[10]=TA[12]; TALUH[13:2]=TA[11:0]; end
								2'b11:begin TALUH[2]=TSR[10]; TALUH[1]=TA[13]; TALUH[0]=TA[12]; TSR[10]=TA[11]; TALUH[13:3]=TA[10:0]; end
								endcase
						end
						
					RLZ_IC: // Zero TSR[8]
						begin
							case (IR2[1:0]) //Implementing ONLY 4(3) shift values
							// Design choice to just consider 4-bit shift
								2'b00:begin  TALUH = TA; end
								2'b01: begin TALUH[0]= TSR[10]; TSR[8]=TA[13]; TALUH[13:1]=TA[12:0];end
								2'b10: begin TALUH[1]= TSR[10]; TALUH[0]=TA[13]; TSR[8]=TA[12]; TALUH[13:2]=TA[11:0];end
								2'b11: begin TALUH[2]=TSR[10]; TALUH[1]=TA[13]; TALUH[0]=TA[12]; TSR[8]=TA[11]; TALUH[13:3]=TA[10:0];end
							endcase
						end
					 
					RRC_IC:
						begin
							case (IR2[1:0])	//Implementing ONLY 4(3) rotate values
								2'b00: begin TALUH = TA; end
								2'b01: begin TALUH[13]=TSR[11]; TALUH[12:0]=TA[13:1]; TSR[11] = TA[0]; end
								2'b10: begin TALUH[13]=TA[0]; TALUH[12]=TSR[11]; TALUH[11:0]=TA[13:2]; TSR[11] = TA[1]; end
								2'b11: begin
										TALUH[13]=TA[1]; TALUH[12]=TA[0]; TALUH[11]=TSR[11]; 
										TALUH[10:0]=TA[13:3]; TSR[11] = TA[2];end
							endcase
						end
						
					RRV_IC:
						begin
							case (IR2[1:0])	//Implementing ONLY 4(3) rotate values
								2'b00:begin TALUH = TA; end
								2'b01: begin TALUH[13]=TSR[9]; TALUH[12:0]=TA[13:1]; TSR[9] = TA[0]; end
								2'b10: begin TALUH[13]=TA[0]; TALUH[12]=TSR[9]; TALUH[11:0]=TA[13:2]; TSR[9] = TA[1]; end
								2'b11: begin
										TALUH[13]=TA[1]; TALUH[12]=TA[0]; TALUH[11]=TSR[9]; 
										TALUH[10:0]=TA[13:3]; TSR[9] = TA[2]; end
								endcase
						end
						
					IN_IC, OUT_IC: begin TALUH = TA; end		
				default: ;
				endcase
				end
				
				if (stall_mc1 == 0) begin
				case (IR1[13:8])
					LD_IC, ST_IC, JMP_IC: begin
						MAeff = PC;
						MAB = PM_out;
						PC = PC + 1'b1;
						MAeff = PC;
						if (Ri1 == 0) MAX = 0; 
						else if (Ri1 == Ri2) MAX=TALUH;
						else MAX = R[Ri1]; end
					CALL_IC: begin
							MAeff = PC;
							MAB = PM_out;										 
							if (Ri1 == 0) MAX = 0; 
							else if (Ri1 == 1) MAX = PC;
							else if (Ri1 == 2) MAX = SP;
							else MAX = R[Ri1]; //Load MAX
							PC = PC + 1'b1;
							SP = SP - 1'b1;
						end
					RET_IC:
						begin
							if (SP != 14'h3FFF)
								begin 				
									MAeff = SP ;
									SR = PM_out;
									SP = SP + 1'b1;
								end
						end
					CPY_IC: begin
						if (Rj1 == Rj2) TB = TALUH;
						else TB = R[Rj1]; end
					NOT_IC, SRL_IC, SRA_IC, ROTL_IC, ROTR_IC, RLN_IC, RLZ_IC, RRV_IC, RRC_IC:
						begin
							if (Ri1 == Ri2) TA=TALUH;
							else TA = R[Ri1]; end // DF if needed
					ADDC_IC, SUBC_IC: begin
							if (Ri1 == Ri2)  TA = TALUH;
							else TA = R[Ri1];TB = {10'b0000000000, IR1[3:0]}; end
					IN_IC:begin TA = IPDR; end
					OUT_IC: begin
						if (Ri1 == Ri2) TA=TALUH; else TA=R[Ri1];
					end
				default: begin 
						if (Ri1 == Ri2) TA=TALUH; else TA=R[Ri1];
						if (Rj1 == Ri2) TB=TALUH; else TB=R[Rj1]; end
				endcase
					//MAeff = PC;
				end
				

				// resolve D/H
				if ((IR3 == 14'h3fff)&&(IR2 == 14'h3fff)&&(IR1 == 14'h3fff)) 
				begin stall_mc0 = 0; end
				
				if ((stall_mc2 == 0) && (IR3[13:8] != JMP_IC) && (IR3[13:8]!=LD_IC) && (IR3[13:8]!=ST_IC) &&(IR3[13:8]!=CALL_IC)&&(IR3[13:8] != RET_IC)) 
				begin IR3 = IR2; Ri3 = Ri2; Rj3 = Rj2; stall_mc3 = 0; end 
				else begin stall_mc2 =1; IR3 = 14'h3fff; Ri3 = Ri2; Rj3 = Rj2; end 

				if ((stall_mc1==0) && (IR2[13:8]!=JMP_IC) && (IR2[13:8]!=LD_IC) && (IR2[13:8] != ST_IC)&&(IR2[13:8]!=CALL_IC)&&(IR2[13:8]!=RET_IC)) 
					begin IR2 = IR1; Ri2 = Ri1; Rj2 = Rj1; stall_mc2 = 0; end	
				else begin stall_mc1 = 1; IR2 = 14'h3fff; Ri2 = Ri1; Rj2 = Rj1; end
				
				if ((stall_mc0 == 0) && (IR1[13:8]!=JMP_IC) && (IR1[13:8]!=LD_IC) && (IR1[13:8]!=ST_IC)&&(IR1[13:8] != CALL_IC)&&(IR1[13:8]!=RET_IC)) 
				// ST, LD need to stall 1 MC.
				// Below: IW0 is fetched directly into IR1, Ri1, and Rj1
				begin IR1 = PM_out; Ri1 = PM_out[7:4];
						Rj1 = PM_out[3:0]; PC = PC + 1'b1; stall_mc1 = 0; MAeff = PC; end 
				else begin stall_mc0 = 1; IR1 = 14'h3fff; Ri1 = 0; Rj1=0; end 
				

				
end
endmodule
