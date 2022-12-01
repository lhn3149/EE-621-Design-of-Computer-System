%% Create an array size 14 bits with all uppercase / lowercase / integer string

%
%
clear; clc;
fname = 'E:\RIT\Fall_22\EE-621-Design-of-Computer-System\Lab_10\';
fileID = fopen(fullfile(fname,"lab11.txt"),'wt');

datasegment = 0x0140; 
line = datasegment -1;
arraysize = dec2bin(16,14);
fprintf(fileID,"%x :   %s;\n", line,arraysize);
line = line + 1;
i = 0;
while (i<16)
    A = dec2bin(1,14) ;
    line = datasegment + i;
    fprintf(fileID,"%x :   %s;\n", line,A);
    i  = i+1;
end

while (i<32)
    A = dec2bin(2,14) ;
    line = datasegment + i;
    fprintf(fileID,"%x :   %s;\n", line,A);
    i  = i+1;
end

