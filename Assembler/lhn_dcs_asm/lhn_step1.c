#include "lhn_asm.h" 
/*---------------------------------------------------------------------------*/
void step1_syntax_check(in1_fname, out1_fname, out2_fname, out3_fname, crt_im)
	FILE *in1_fname; FILE *out1_fname; FILE *out2_fname; FILE *out3_fname;
	const	char	*crt_im[32]; /*Current Instruction Mnemonic*/
	{
	char	crt_line[81];
	char	crt_syllable[20], nxt_syllable[20]; /*Temporary storage for the 
								syllables currently expected and analyzed*/
	int		asf_line_number = 0; /*assembly source file line number*/
	int		i, j, k, match;
#define dxpDEBUG = 1;
	fgets(crt_line, 81, in1_fname);
	sscanf(crt_line, "%s", &crt_syllable);
	i = 0;
	while ((strcmp(crt_syllable, ".directives;")) && (i != 20))
		{
		fgets(crt_line, 81, in1_fname);
		++asf_line_number;
		sscanf(crt_line, "%s", &crt_syllable);
		++i;
		}
	i = 0;
	while ((strcmp(crt_syllable, ".enddirectives;")) && (i != 20))
		{
		fgets(crt_line, 81, in1_fname);
		++asf_line_number;
		sscanf(crt_line, "%s", &crt_syllable);
		++i;
	
	}/*End of second while loop*/
	i = 0;
	while ((strcmp(crt_syllable, ".constants;")) && (i != 20))
		{
		fgets(crt_line, 81, in1_fname);
		++asf_line_number;
		sscanf(crt_line, "%s", &crt_syllable);
		++i;
		}
			i = 0;
	while ((strcmp(crt_syllable, ".endconstants;")) && (i != 20))
		{
		fgets(crt_line, 81, in1_fname);
		++asf_line_number;
		sscanf(crt_line, "%s", &crt_syllable);
		++i;
	
	}/*End of the fourth while loop*/
	i = 0;
	while ((strcmp(crt_syllable, ".code;")) && (i != 20))
		{
		fgets(crt_line, 81, in1_fname);
		++asf_line_number;
		sscanf(crt_line, "%s", &crt_syllable);
		++i;
			}
	i = 0;
	while ((strcmp(crt_syllable, ".endcode;")) && (i != 1000) && EOF)
		{
		fgets(crt_line, 81, in1_fname);
		++asf_line_number;
		sscanf(crt_line, "%s %s", &crt_syllable, &nxt_syllable);
		++i; match = 0; j = 0;
		while ( j < 32 ) 
			{
				if (strcmp(crt_syllable, crt_im[j]) == 0)
				{
					fprintf(out3_fname, "%3u   %s", asf_line_number, crt_line);
					match = 1;
				}
			++j;
			}/*End of inner while loop*/
		k = 0;																		
		if (crt_syllable[0] == '@')
			{
			while ( k <32 ) 
				{
				if (strcmp(nxt_syllable, crt_im[k]) == 0)
					{
						fprintf(out3_fname, "%3u   %s", asf_line_number, crt_line);
						match = 1;
					}
				++k;		
			}/*End of second inner while loop*/
		}/*End of if construct*/
/*---------------------------------------------------------------------------*/
/*Check to see if line is a comment - ignore it.
/*---------------------------------------------------------------------------*/
	}/*End of sixth while loop*/
	fprintf(out3_fname, "\n");
	return;
		}


