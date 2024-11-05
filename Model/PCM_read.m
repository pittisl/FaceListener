clear;
clc;
Fs = 48000;
fileId1 = fopen('reverseme.pcm','r');
fileId2 = fopen('reverseme1.pcm','r');
y_1 = fread(fileId1,inf,'int16',0,'b');
y_2 = fread(fileId2,inf,'int16',0,'b');
fclose('all');
%sound(x,Fs);