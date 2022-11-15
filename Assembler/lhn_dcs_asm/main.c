#include <stdio.h>
#include <stdlib.h>

#include "lhn_asm.h"

int main(int argc, char *argv[]) {

	FILE	*fopen(), *in_ass, *int_dir, *int_const, *int_code, *out_mif;
	char 	ass_fname[13];
	#include "lhn_const.h" 

	in_ass = lhn_get_fname(); 

	int_dir = fopen("dir.txt", "w");
	int_const = fopen("const.txt", "w");
	int_code = fopen("code.txt", "w");

	printf("\n\nStep1: Structural and Preliminary Syntactical Check:\n");
	step1_syntax_check(in_ass, int_dir, int_const, int_code, im);

	printf("\n\nStep1: Structural and Preliminary Syntactical Check\n \
		==> Concluded successfully. <==");
	printf("\n\nThe files are now being closed.");

	fclose(in_ass); fclose(int_dir); fclose(int_const); fclose(int_code);

	printf("\n\nThe files are now being opened.");
	out_mif = fopen("lhn.mif", "w"); int_dir = fopen("dir.txt", "r");
	int_const = fopen("const.txt", "r"); int_code = fopen("code.txt", "r");
/*---------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------*/
	printf("\n\nStep2: Assembly:\n");
	step2_assembly(int_code, int_dir, int_const, out_mif, im, OpCode, \
					Ri, RiFieldValue, Rj, RjFieldValue, mri);	

	printf("\n\nStep2: Assembly\n \
		==> Concluded successfully. <==");
	fclose(out_mif); fclose(int_dir); fclose(int_const); fclose(int_code);

	return 0;
}

