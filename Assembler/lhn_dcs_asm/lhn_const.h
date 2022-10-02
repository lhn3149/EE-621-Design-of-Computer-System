/*===========================================================================*/
/*Contains arrays of strings declarations and definitions.*/
/*===========================================================================*/
/*The instruction mnemonic array of strings declaration*/
/*---------------------------------------------------------------------------*/
	const	char	*im[32];
/*---------------------------------------------------------------------------*/
/*The instruction mnemonic array of strings assignments*/
/*---------------------------------------------------------------------------*/
	im[0] = "LD";	im[1] = "ST"; 	im[2] = "CPY";	im[3] = "SWAP";
	im[4] = "JMP";	im[5] = "ADD"; 	im[6] = "SUB";	im[7] = "ADDC";	im[8] = "SUBC";	
	im[9] = "MUL";  im[10] = "DIV";	im[11]= "NOT";  im[12]= "AND";
	im[13]= "OR" ;  im[14] = "XOR";	im[15]= "SRL";	im[16]= "SRA";
	im[17]= "ROTL"; im[18] = "ROTR"; im[19]= "RLN"; im[20]= "RLZ";
	im[21]= "RRC" ; im[22] = "RRV" ; im[23]= "empty";
	im[24]= "JMP" ; im[25] = "CALL"; 
	im[26] = "RET";	im[27] = "IN";	im[28] = "OUT";	im[29]= "empty";im[30]= "empty";im[31]= "empty";
/*---------------------------------------------------------------------------*/
/*The Ri-field string array */
/*---------------------------------------------------------------------------*/
	const	char	*Ri[16];
	Ri[0] = "R0,"; Ri[1] = "R1,"; Ri[2] = "R2,"; Ri[3] = "R3,";
	Ri[4] = "R4,"; Ri[5] = "R5,"; Ri[6] = "R6,"; Ri[7] = "R7,";
	Ri[8] = "R8,"; Ri[9] = "R9,"; Ri[10] = "R10,"; Ri[11] = "R11,";
	Ri[12] = "R12,"; Ri[13] = "R13,"; Ri[14] = "R14,"; Ri[15] = "R15,";
/*---------------------------------------------------------------------------*/
/*The Ri-field-value string array */
/*---------------------------------------------------------------------------*/
	const	char	*RiFieldValue[16];
	RiFieldValue[0] = "0000"; RiFieldValue[1] = "0001"; 
	RiFieldValue[2] = "0010"; RiFieldValue[3] = "0011";
	RiFieldValue[4] = "0100"; RiFieldValue[5] = "0101"; 
	RiFieldValue[6] = "0110"; RiFieldValue[7] = "0111";
	RiFieldValue[8] = "1000"; RiFieldValue[9] = "1001"; 
	RiFieldValue[10] = "1010"; RiFieldValue[11] = "1011";
	RiFieldValue[12] = "1100"; RiFieldValue[13] = "1101"; 
	RiFieldValue[14] = "1110"; RiFieldValue[15] = "1111";
/*---------------------------------------------------------------------------*/
/*The Rj-field string array */
/*---------------------------------------------------------------------------*/
	const	char	*Rj[16];
	Rj[0] = "R0;"; Rj[1] = "R1;"; Rj[2] = "R2;"; Rj[3] = "R3;";
	Rj[4] = "R4;"; Rj[5] = "R5;"; Rj[6] = "R6;"; Rj[7] = "R7;";
	Rj[8] = "R8;"; Rj[9] = "R9;"; Rj[10] = "R10;"; Rj[11] = "R11;";
	Rj[12] = "R12;"; Rj[13] = "R13;"; Rj[14] = "R14;"; Rj[15] = "R15;";
/*---------------------------------------------------------------------------*/
/*The Rj-field-value string array */
/*---------------------------------------------------------------------------*/
	const	char	*RjFieldValue[16];
	RjFieldValue[0] = "0000"; RjFieldValue[1] = "0001"; 
	RjFieldValue[2] = "0010"; RjFieldValue[3] = "0011";
	RjFieldValue[4] = "0100"; RjFieldValue[5] = "0101"; 
	RjFieldValue[6] = "0110"; RjFieldValue[7] = "0111";
	RjFieldValue[8] = "1000"; RjFieldValue[9] = "1001"; 
	RjFieldValue[10] = "1010"; RjFieldValue[11] = "1011";
	RjFieldValue[12] = "1100"; RjFieldValue[13] = "1101"; 
	RjFieldValue[14] = "1110"; RjFieldValue[15] = "1111";
/*---------------------------------------------------------------------------*/
/*The mnemonic opcode string array */
/*---------------------------------------------------------------------------*/
	const	char	*OpCode[32];
OpCode[0] 	= "000000";	OpCode[1] 	= "000001"; OpCode[2] 	= "000010";	OpCode[3] 	= "000011";
OpCode[4] 	= "000100";	OpCode[5] 	= "000101"; OpCode[6] 	= "000110";	OpCode[7] 	= "000111";
OpCode[8] 	= "001000";	OpCode[9] 	= "001001";	OpCode[10] 	= "001010"; OpCode[11] 	= "001011";
OpCode[12] 	= "001100"; OpCode[13] 	= "001101"; OpCode[14] 	= "001110"; OpCode[15] 	= "001111"; 
OpCode[16] 	= "010000";	OpCode[17] 	= "010001"; OpCode[18] 	= "010010";	OpCode[19] 	= "010011";
OpCode[20] 	= "010100";	OpCode[21] 	= "010101"; OpCode[22] 	= "010110";	OpCode[23] 	= "010111";
OpCode[24] 	= "011000";	OpCode[25] 	= "011001";	OpCode[26] 	= "011010"; OpCode[27] 	= "011011";
OpCode[28] 	= "011100"; OpCode[29] 	= "011101"; OpCode[30] 	= "011110"; OpCode[31] 	= "011111";
/*---------------------------------------------------------------------------*/
/* the M[Ri-field string array */
/*---------------------------------------------------------------------------*/
	const	char	*mri[16];
	mri[0] = "M[R0,"; mri[1] = "M[R1,"; mri[2] = "M[R2,"; mri[3] = "M[R3,";
	mri[4] = "M[R4,"; mri[5] = "M[R5,"; mri[6] = "M[R6,"; mri[7] = "M[R7,";
	mri[8] = "M[R8,"; mri[9] = "M[R9,"; mri[10] = "M[R10,"; mri[11] = "M[R11,";
	mri[12] = "M[R12,"; mri[13] = "M[R13,"; mri[14] = "M[R14,"; mri[15] = "M[R15,";


