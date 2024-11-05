clear;clc;close all;

fs = 441000;
T = 0.00029;
n = fs*T;
f = 17000;
y = sin(2*pi*f*T*linspace(0,1,n+1));
% plot(y);
for i = 1:3750
    y = [y,0];
end
% plot(y);

% T2 = 0.0017;
% n2 = fs*T2;
% f2 = 22000;
% y2 = cos(2*pi*f2*T2*linspace(0,1,n2+1));

% y = [y,y2];
% plot(y);

Sinusoid = [];
for i = 1:6000
    Sinusoid = [Sinusoid,y];
end
plot(Sinusoid);
% 
quant=max(Sinusoid)/(2^15-1);
z=round(Sinusoid/quant);
outint = int16(z);
% signe=uint16((sign(z)'+1)/2);
% out=[signe dec2bin(abs(z),15)];

audiowrite('myfile_delay.wav', outint, fs);

outint = int16(out);