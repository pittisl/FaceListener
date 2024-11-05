% clear;clc;close all;
% pcm fmcw generate with sinu
fs = 192000;
T_s = 1;
n_s = fs*T_s;
f_s = 20000;
y = cos(2*pi*f_s*T_s*linspace(0,1,n_s+1));
% plot(y);

Freq_Min = 17000;
Freq_Max = 22000;
T=0.02133;
n = fs*T;
B=Freq_Max-Freq_Min;
alpha=B/T;
%t=0:1/44100:T;
fmcw_wave=cos(2*pi*(Freq_Min+0.5*alpha*T.*linspace(0,1,n+1))*T.*linspace(0,1,n+1));
% plot(fmcw_wave)
FMCW_wave = [];
for i = 1:700
    FMCW_wave = [FMCW_wave,fmcw_wave];
end

FMCW_wave = [y, FMCW_wave];
% FMCW_WAVE = FMCW_wave(1:10:end);
% plot(FMCW_wave)

% ellip filter
wp = 16700;
ws = 15000;
wpp = wp/(192000/2);
wss = ws/(192000/2);
[n,Wp] = ellipord(wpp,wss,1,80);
[b,a] = ellip(n,1,80,Wp,'high');
FMCW_WAVE = filter(b,a,FMCW_wave);
% plot(FMCW_WAVE)

% % butter filter
% wp = 17000;
% ws = 15500;
% wpp = wp/(44100/2);
% wss = ws/(44100/2);
% [n,wn]=buttord(wpp,wss,1,60);
% [b,a]=butter(n,wn,'high');
% FMCW_WAVE = filter(b,a,FMCW_WAVE);

% quant=max(FMCW_WAVE)/(2^15-1);
% z=round(FMCW_WAVE/quant);
% %plot(z)
% outint = int16(z);
% %signe=uint16((sign(z)'+1)/2);
% %out=[signe dec2bin(abs(z),15)];
% 
% audiowrite('myfile_fmcw.wav', outint, fs);