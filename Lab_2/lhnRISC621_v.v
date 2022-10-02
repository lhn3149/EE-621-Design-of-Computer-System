// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
//----------------------------------------------------------------------------
// dxpRISC521_vhdl	Harvard	Memory Mapped I/O-Ps - top 16 locations
// (c) Dorin Patru 2022
//----------------------------------------------------------------------------
// Requirement: 14b Von Neumann Separate I/O P
// IW will be 14 bits: 6 bits OpCode, 4 bits Ri, 4 bits Rj
// Reg File: 2^4 --> 16 Reg
// Memory: 1K addressable --> only PC needs 10 bits
	// 16 bits data per address
// Other Reg needs to change too (cause we don't need that many bits anymore)
// ---------------------------------------------------------------------------

module lhnRISC621_v (Resetn_pin, Clock_pin, SW_pin, Display_pin, ICis);

	input	Resetn_pin, Clock_pin;
	input	[4:0] SW_pin;			// Four switches and one push-button
	output [7:0] Display_pin;	// 8 LEDs
	output [95:0] ICis; // For simulation ONLY; should be commented out for 
								//board emulation!
//----------------------------------------------------------------------------
//-- Declare machine cycle and instruction cycle parameters
//----------------------------------------------------------------------------
	parameter [1:0] MC0=2'b00, MC1=2'b01, MC2=2'b10, MC3=2'b11; //machine cycles
	parameter [5:0] 	LD_IC = 6'b000000, 	ST_IC  =6'b000001, 	//reg-mem data transfer instruction cycles
							CPY_IC =6'b000010, 	SWAP_IC=6'b000011, 	//reg-reg data transfer instruction cycles
							JMP_IC =6'b000100, 							//flow control instruction cycle
							ADD_IC =6'b000101, 	SUB_IC =6'b000110, 	//arithmetic manipulation instruction
							ADDC_IC=6'b000111, 	SUBC_IC=6'b001000, //cycles
							
							MUL_IC =6'b001001,	DIV_IC =6'b001010, //mul div
							NOT_IC =6'b001011, 	AND_IC =6'b001100,  	//logic manipulation instruction 
							OR_IC  =6'b001101,	XOR_IC =6'b001110,	//cycles
							
							SRL_IC =6'b001111,	SRA_IC =6'b010000,    //shift right logic/algorithm Ri by Rj field value positions
							ROTL_IC=6'b010001,	ROTR_IC=6'b010010,	// rptate left/right by Rj field value positions
							RLN_IC =6'b010011,	RLZ_IC =6'b010100,	// rotate left through status bit Ri by Rj_field value
							RRC_IC =6'b010101,	RRV_IC =6'b010110, 	// rotate right through status bit Ri by Rj_field value
							//VADD_IC=6'b010110, 	VSUB_IC=6'b010111,
							//JMP_IC =6'b011000,	
							CALL_IC=6'b011001,											//SIMD (vector) instruction cycles 
							RET_IC =6'b011010,	
							IN_IC = 6'b011011,	OUT_IC =6'b011100;		//cycles - to be implemented later
							
	parameter [3:0] JU=4'b0000, JC1=4'b1000, JN1=4'b0100, JV1=4'b0010, //Jump condition(s) 
		JZ1=4'b0001, JC0=4'b0111, JN0=4'b1011, JV0=4'b1101, JZ0=4'b1110; //definition(s)
//----------------------------------------------------------------------------
//-- Declare internal signals
//----------------------------------------------------------------------------
	reg [13:0] R [15:0]; //Register File (RF) 16 14-bit registers
	reg [13:0] IP[16:0]; // I/O P Map 16 14-bit registers
	reg [13:0] IPDR, OPDR; // for this lab, input is the Switches and output is 7-bit Display
								// it's small so we don't need to use a separate map.
	reg	WR_DM;
	reg [1:0] MC;
	reg [28:0] res;
	reg [13:0] PC, IR, MAB, MAX, MA, DM_in, MAeff;
	reg [13:0] SP ; // Stack pointer
	reg [13:0] TA, TB, TALUH, TALUL;
	reg [11:0] TSR, SR;
	reg [7:0] Display_pin;
	reg [14:0]	TALUout;
	wire [13:0]	PM_out, DM_out;
	wire 			C, Clock_not;
	//integer Call_count;
	integer Ri, Rj;
	integer IPA, OPA; // address for I/O Peripheral field. 
	integer k;
//----------------------------------------------------------------------------
// In this architecture we are using a combination of structural and 
// 	behavioral code.  Care has to be excercised because the values assigned
//		in the always block are visible outside of it only during the next clock 
//		cycle.  The CPU comprised of the DP and CU is modeled as a combination
// 	of CASE and IF statements (behavioral).  The memories are called within
// 	the structural part of the code.  We could model the memories as
//		arrays, but that would result in less than optimal memory 
//		implementations.  Also, later on we will want to add an hierarchcial 
//		memory subsystem.
//----------------------------------------------------------------------------
// Structural section of the code.  The order of the assignments doesn't 
// 	matter.  Concurrency!
//----------------------------------------------------------------------------
		assign	Clock_not = ~Clock_pin;
		//assign 	Display_pin = OPDR[7:0]; //Display not used all the bits from output.
		always @(posedge Clock_pin) IPDR = {9'd0, SW_pin};
//----------------------------------------------------------------------------
// Instantiating only 1KWord memories to save resources;
// I could instantiate up to 64KWords.
// Both memories are clock synchronous i.e., the address and eventually input 
// data have to be first registered; to save a clock cycle we use the "other"
// edge/ event of the clock.
//	address,

//----------------------------------------------------------------------------
		// Von Neumann architecture
		lhn_mm		main_memory(MAeff[9:0], Clock_not, DM_in, WR_DM, PM_out);

		lhn_ir2assembly_v IWdecode (IR, Resetn_pin, Clock_pin, ICis); //IR, Resetn_pin, Clock_pin, ICis

//----------------------------------------------------------------------------
//	Behavioral section of the code.  Assignments are evaluated in order, i.e.
// 	sequentially. New assigned values are visible outside the always block 
// 	only after it is exit.  Last assigned value will be the exit value.
//----------------------------------------------------------------------------
		always@(posedge Clock_pin)
//----------------------------------------------------------------------------
// The reset is active low and clock synchronous.  For verification/simulation
// 	purposes it is necessary in this case to initialize the value of regA.
//----------------------------------------------------------------------------
				if (Resetn_pin == 0)
					begin	
					PC = 14'h0000; // Initialize the PC to point to the location of 
					// the FIRST instruction to be executed; loaction 0000 is arbitrary!
					// 64 16-bit: R[0] = 0; R[1] = 0; R[2] = 0; R[3] = 0; // Necessary for sim
					for (k = 0; k < 15; k = k+1) begin R[k] = 0; end
						
					
					MAB = 14'h0000; MAX = 14'h0000; DM_in = 14'h0000;
					TA = 14'h0000; TB = 14'h0000; MAeff = 14'h0000; TALUH = 14'h0000; TALUL = 14'h0000;
					TSR = 11'b000; SR = 11'b000; TALUout = 15'h00000;
					SP = 14'h3FFF;
					MC = MC0; // The first MC executed after Reset is MC0 i.e., IF 
					end
				else	begin
//----------------------------------------------------------------------------
// The first level CASE statement selects execution based on the current
// 	machine cycle.
//----------------------------------------------------------------------------
					case (MC)
						MC0: //MC0 or IF = Instruction Fetch // for jump is different
							begin
								//MAeff = PC ;
								IR = PM_out; 	//Load IR with IW fetched from the output 
													//of the PM (program memory)
													// 14 bits 5
								Ri = PM_out[7:4]; 	//Decode the address of Ri, Ri is source and destination (overide)
								Rj = PM_out[3:0];		//Decode the address of Rj, Rj is source
								
								PC = PC + 1'b1;	//Increment the PC to point to the 
														//location of the next IW
								WR_DM = 1'b0;	//Keep the DM in RD mode
								MAeff = PC ;
								MC = MC1;	//Unconditionally go to MC1
								
							end
//----------------------------------------------------------------------------
// The second level CASE statements select assignments based on the OpCodes.
// You could switch the case statements, i.e. have the OpCodes at the first
// 	level and the MCs at the second level.
//----------------------------------------------------------------------------
						MC1: begin	//MC1 or Operand Fetch = OpFetch for 
										//manipulation instructions or Address_Fetch for 
										//data transfer and flow control instructions
							case (IR[13:8])	//Decode the OpCode of the IW
								LD_IC, ST_IC, JMP_IC:
									begin
										MAeff = PC;
										MAB = PM_out;
										PC = PC + 1'b1;
										if (Ri == 0) MAX = 0; else MAX = R[Ri]; //Load MAX
									end
								CALL_IC:
									begin
										MAeff = PC;
										MAB = PM_out;										 
										if (Ri == 0) MAX = 0; 
										else if (Ri == 1) MAX = PC;
										else if (Ri == 2) MAX = SP;
										else MAX = R[Ri]; //Load MAX
										PC = PC + 1'b1;
										SP = SP - 1'b1;
										//Call_count = Call_count + 1'b1;
									end
								RET_IC:
									begin
										if (SP != 14'h3FFF)
											begin 				
												MAeff = SP ;
												SP = SP + 1'b1;
											end
										else MC = MC2;
									end
								CPY_IC:
									begin
										TB = R[Rj];
									end
								NOT_IC, SRL_IC, SRA_IC, ROTL_IC, ROTR_IC, RLN_IC, RLZ_IC, RRV_IC, RRC_IC:
									begin
										TA = R[Ri]; // rotate by value Rj not R[Rj]
									end
								ADDC_IC, SUBC_IC:
									begin
										TA = R[Ri];
										TB = {10'b0000000000, IR[3:0]};
									end
								IN_IC:
									begin
										TA = IPDR;
									end
								OUT_IC:
									begin
										TA = R[Ri];
									end
								default: 	
									begin
										TA = R[Ri]; //4-bit integer --> fit 16 14bit R
										TB = R[Rj];
									end
							endcase
							MC = MC2;
						end
//----------------------------------------------------------------------------
						MC2:	begin		//MC2 or Execution/ Manipulation MC
							case (IR[13:8])
								LD_IC, JMP_IC:
									begin
										MAeff = MAB + MAX;
										WR_DM = 1'b0;
									end
								ST_IC:
									begin
										MAeff = MAB + MAX;
										WR_DM = 1'b0;		
									end
								CALL_IC:
									begin
										// write to main memory 
										MAeff = SP;
										WR_DM = 1'b1;
										DM_in = PC ; 
										SP = SP - 1'b1;
										
									end
								RET_IC:
									begin
										if (SP != 14'h3FFF)
											begin												
												SR = PM_out;
												MAeff = SP;
											end
										else MC = MC3;
										
									end
								CPY_IC:
									begin
										TALUL = TB;
									end
								SWAP_IC:
									begin
										TALUH = TA;
										TALUL = TB;
									end
//----------------------------------------------------------------------------
// For all assignments that target TALUH we use TALUout.  This is 15-bits wide
// 	to account for the value of the carry when necessary.
//----------------------------------------------------------------------------
								ADD_IC, ADDC_IC:
									begin
									// TSR temporal status register 
									// store CNVZ
									// first 4 bits [11:8] is CNVZ
										TALUout = TA + TB;
										TSR[11] = TALUout[14]; // Carry
										TSR[10] = TALUout[13]; // Negative
										TSR[9] = ((TA[13] ~^ TB[13]) & TA[13]) ^ (TALUout[13] & (TA[13] ~^ TB[13])); // V Overflow
										if (TALUout[13:0] == 14'h0000) TSR[8] = 1; else TSR[8] = 0; // Zero
										TALUH = TALUout[13:0];
									end
								MUL_IC:
									begin
										res = TA*TB;
										TALUout = res[14:0];
										TALUH = res[27:14];
										TALUL = res[13:0];
										// high first 14 bits -> Ri/Rj, low last 14 bits -> Rj/Ri.
										TSR[11] = TALUout[14]; // Carry
										TSR[10] = TALUout[13]; // Negative
										TSR[9] = ((TA[13] ~^ TB[13]) & TA[13]) ^ (TALUout[13] & (TA[13] ~^ TB[13])); // V Overflow
										if (TALUout[13:0] == 14'h0000) TSR[8] = 1; else TSR[8] = 0; // Zero
										//TALUH = TALUout[13:0];
									end
									
								DIV_IC:
									begin
										TALUout = TA/TB;
										TALUL = TA%TB;
										TALUout = res[14:0];
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
										case (IR[1:0]) //Implementing ONLY 4(3) shift values
										// Design choice to just consider 4-bit shift
											2'b00:
												begin
													TALUH = TA;
												end
											2'b01:
												begin
													TALUH[13]=TA[13]; TALUH[12:0]=TA[13:1]; 
												end
											2'b10:
												begin
													TALUH[13]=TA[13]; TALUH[12]=TA[13]; TALUH[11:0]=TA[13:2]; 
												end
											2'b11:
												begin
													TALUH[13]=TA[13]; TALUH[12]=TA[13]; TALUH[11]=TA[13]; TALUH[10:0]=TA[13:3]; 
												end
											endcase
									end
									
									
								SRL_IC:
									begin
										case (IR[1:0]) //Implementing ONLY 4(3) shift values
										// Design choice to just consider 4-bit shift
											2'b00:
												begin
													TALUH = TA;
												end
											2'b01:
												begin
													TALUH[0]=1'b0; TALUH[13:1]=TA[12:0]; 
												end
											2'b10:
												begin
													TALUH[1:0]=2'b00; TALUH[13:2]=TA[11:0]; 
												end
											2'b11:
												begin
													TALUH[2:0]=3'b000; TALUH[10:0]=TA[10:0]; 
												end
											endcase
									end
									
								 
								 ROTR_IC:
									begin
										case (IR[1:0]) //Implementing ONLY 4(3) shift values
										// Design choice to just consider 4-bit shift
											2'b00:
												begin
													TALUH = TA;
												end
											2'b01:
												begin
													TALUH[13]=TA[0]; TALUH[12:0]=TA[13:1]; 
												end
											2'b10:
												begin
													TALUH[13]=TA[1]; TALUH[12]=TA[0]; TALUH[11:0]=TA[13:2]; 
												end
											2'b11:
												begin
													TALUH[13]=TA[2]; TALUH[12]=TA[1]; TALUH[11]=TA[0]; TALUH[10:0]=TA[13:3]; 
												end
											endcase
									end
								 
								 ROTL_IC:
									begin
										case (IR[1:0]) //Implementing ONLY 4(3) shift values
										// Design choice to just consider 4-bit shift
											2'b00:
												begin
													TALUH = TA;
												end
											2'b01:
												begin
													TALUH[0]=TA[13]; TALUH[13:1]=TA[12:0]; 
												end
											2'b10:
												begin
													TALUH[1]=TA[13]; TALUH[0]=TA[12]; TALUH[13:2]=TA[11:0]; 
												end
											2'b11:
												begin
													TALUH[2]=TA[13]; TALUH[1]=TA[12]; TALUH[0]=TA[11]; TALUH[13:3]=TA[10:0]; 
												end
											endcase
									end
									
								RLN_IC: //Negative TSR[10]
									begin
										case (IR[1:0]) //Implementing ONLY 4(3) shift values
										// Design choice to just consider 4-bit shift
											2'b00:
												begin
													TALUH = TA;
												end
											2'b01:
												begin
													TALUH[0]= TSR[10]; TSR[10]=TA[13]; TALUH[13:1]=TA[12:0]; 
												end
											2'b10:
												begin
													TALUH[1]= TSR[10]; TALUH[0]=TA[13]; TSR[10]=TA[12]; TALUH[13:2]=TA[11:0]; 
												end
											2'b11:
												begin
													TALUH[2]=TSR[10]; TALUH[1]=TA[13]; TALUH[0]=TA[12]; TSR[10]=TA[11]; TALUH[13:3]=TA[10:0]; 
												end
											endcase
									end
									
								RLZ_IC: // Zero TSR[8]
									begin
										case (IR[1:0]) //Implementing ONLY 4(3) shift values
										// Design choice to just consider 4-bit shift
											2'b00:
												begin
													TALUH = TA;
												end
											2'b01:
												begin
													TALUH[0]= TSR[10]; TSR[8]=TA[13]; TALUH[13:1]=TA[12:0]; 
												end
											2'b10:
												begin
													TALUH[1]= TSR[10]; TALUH[0]=TA[13]; TSR[8]=TA[12]; TALUH[13:2]=TA[11:0]; 
												end
											2'b11:
												begin
													TALUH[2]=TSR[10]; TALUH[1]=TA[13]; TALUH[0]=TA[12]; TSR[8]=TA[11]; TALUH[13:3]=TA[10:0]; 
												end
											endcase
									end
								 
								RRC_IC:
									begin
										case (IR[1:0])	//Implementing ONLY 4(3) rotate values
											2'b00:
												begin
													TALUH = TA;
												end
											2'b01:
												begin
													TALUH[13]=TSR[11]; TALUH[12:0]=TA[13:1]; TSR[11] = TA[0];
												end
											2'b10:
												begin
													TALUH[13]=TA[0]; TALUH[12]=TSR[11]; TALUH[11:0]=TA[13:2]; TSR[11] = TA[1];
												end
											2'b11:
												begin
													TALUH[13]=TA[1]; TALUH[12]=TA[0]; TALUH[11]=TSR[11]; 
													TALUH[10:0]=TA[13:3]; TSR[11] = TA[2];
												end
											endcase
									end
									
								RRV_IC:
									begin
										case (IR[1:0])	//Implementing ONLY 4(3) rotate values
											2'b00:
												begin
													TALUH = TA;
												end
											2'b01:
												begin
													TALUH[13]=TSR[9]; TALUH[12:0]=TA[13:1]; TSR[9] = TA[0];
												end
											2'b10:
												begin
													TALUH[13]=TA[0]; TALUH[12]=TSR[9]; TALUH[11:0]=TA[13:2]; TSR[9] = TA[1];
												end
											2'b11:
												begin
													TALUH[13]=TA[1]; TALUH[12]=TA[0]; TALUH[11]=TSR[9]; 
													TALUH[10:0]=TA[13:3]; TSR[9] = TA[2];
												end
											endcase
									end
									
								IN_IC, OUT_IC:
									begin
										TALUH = TA;
									end
								 default:
									MC = MC0;	//If there's a problem with decoding the OpCode, return to MC0;
													//Useful in debugging through simulation
							endcase
							MC = MC3;			//Else go unconditionally to MC3
						 end
//----------------------------------------------------------------------------
						 MC3:	begin		//MC3 or Write Back (WB) for manipulation and 
							//data transfer instruction cycles or load/ no load
							//jump address for flow control instruction cycles 
							case (IR[13:8])
								 LD_IC:
									begin
										R[IR[3:0]] = PM_out;
										//if (MAeff[13:4] == 10'hFFF) //If MAeff points to
											//R[IR[3:0]] = {9'b000000000, SW_pin};												
										//else
										//R[IR[3:0]] = PM_out; //(MAeff[9:0], Clock_not, DM_in, WR_DM, DM_out)
									end
								 ST_IC:
									begin
										WR_DM = 1'b1;
										DM_in = {10'd0,Rj};
										MC = MC0;
									end
								 RET_IC:
									begin
										PC = PM_out;
										//MAeff = PC;
										if (SP != 14'h3FFF) 
											begin
												SP = SP + 1'b1; 
											end
										else MAeff = PC;
									end 
							
								 CALL_IC:
									begin
										MAeff = SP;
										DM_in = {2'd0,SR};
										WR_DM = 1'b0; // don't write
										MAeff = MAB + MAX;
										PC = MAeff;
									end
								 CPY_IC:
									begin
										R[Ri] = TALUL;
									end
								 SWAP_IC:
									begin
										R[Ri] = TALUL;
										R[Rj] = TALUH;
									end
								 JMP_IC:
									begin
										case (IR[3:0])
											JC1: begin if (SR[11] == 1) PC = MAeff; else PC = PC; end
											JN1: begin if (SR[10] == 1) PC = MAeff; else PC = PC; end
											JV1: begin if (SR[9] == 1) PC = MAeff; else PC = PC; end
											JZ1: begin if (SR[8] == 1) PC = MAeff; else PC = PC; end
											
											JC0: begin if (SR[11] == 0) PC = MAeff; else PC = PC; end
											JN0: begin if (SR[10] == 0) PC = MAeff; else PC = PC; end
											JV0: begin if (SR[9] == 0) PC = MAeff; else PC = PC; end
											JZ0: begin if (SR[8] == 0) PC = MAeff; else PC = PC; end
											JU:  begin PC = MAeff; end
											default: PC = PC; //
										endcase
									end
									ADD_IC, SUB_IC, ADDC_IC, SUBC_IC, MUL_IC, DIV_IC, NOT_IC, AND_IC, OR_IC, XOR_IC, SRL_IC, SRA_IC, ROTL_IC, ROTR_IC, RLN_IC, RLZ_IC,
											RRC_IC, RRV_IC:
										begin
											R[Ri] = TALUH;
											SR = TSR;
										end
									MUL_IC, DIV_IC:
										begin
											R[Ri] = TALUL;
											R[Rj] = TALUH;
										end
									IN_IC:
										begin
											R[Ri] = TA;
										end
									OUT_IC:
										begin
											OPDR = TA[7:0];
											Display_pin = OPDR;
										end
								 default:
									MC = MC0;
							endcase
							WR_DM = 1'b0;
							MC = MC0;
							MAeff = PC;
						 end
						 default:
							MC = MC0;
					endcase
				end
endmodule
