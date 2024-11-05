% clear;clc;close all;
% f = 1000;    % frequency of sin wave
% fs = 200000;
% N = 200000;
% n = 0:N-1;
% t = n/fs;
% y = sin(2*pi*f*t);
fs = 48000;
T = 0.005;
n = fs*T;
f = 17000;
y = cos(2*pi*f*T*linspace(0,1,n+1));
% f = 18000;
% y = [y, cos(2*pi*f*T*linspace(0,1,n+1))];
% f = 19000;
% y = [y, cos(2*pi*f*T*linspace(0,1,n+1))];
% T = 10;
% n = fs*T;
% f = 20000;
% y = [y, cos(2*pi*f*T*linspace(0,1,n+1))];
% plot(y);

quant=max(y)/(2^15-1);
z=round(y/(2*quant));
% %plot(z)
outint = int16(z);
%signe=uint16((sign(z)'+1)/2);
%out=[signe dec2bin(abs(z),15)];

audiowrite('myfile.wav', outint, fs);

%outint = int16(out);