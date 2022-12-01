%% Create an array size 14 bits with all uppercase / lowercase / integer string

%
%
clear; clc;
fname = 'E:\RIT\Fall_22\EE-621-Design-of-Computer-System\Lab_10\';
fileID = fopen(fullfile(fname,"array_generation.txt"),'wt');
A = dec2bin('XO',7);
B = dec2bin('xo',7);
C = dec2bin('25',7);
D = dec2bin(',.',7);
A = strcat(A(1,:),A(2,:)); 
B = strcat(B(1,:),B(2,:));
C = strcat(C(1,:),C(2,:));
D = strcat(D(1,:),D(2,:));
i = 0;
caseconversion = dec2bin(0x1020,14);
numconversion = dec2bin(0x1830,14);
loopcount = dec2bin(0x40,14);

datasegment = 0x0140; 
line = datasegment -3;
fprintf(fileID,"%x :   %s;\n", line,loopcount);
line = datasegment -2;
fprintf(fileID,"%x :   %s;\n", line,numconversion);
line = datasegment -1;
fprintf(fileID,"%x :   %s;\n", line,caseconversion);

while (i<256)
    line = datasegment + i;
    fprintf(fileID,"%x :   %s;\n", line,A);
    i  = i+1;
    line = datasegment + i;
    fprintf(fileID,"%x :   %s;\n", line,B);
    i  = i+1;
    line = datasegment + i;
    fprintf(fileID,"%x :   %s;\n", line,C);
    i  = i+1;
    line = datasegment + i;
    fprintf(fileID,"%x :   %s;\n", line,D);
    i  = i+1;
end