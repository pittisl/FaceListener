% clear;clc;close all;
% pcm fmcw generate
fs = 48000;
Freq_Min = 17000;
Freq_Max = 22000;
T=0.005;
n = fs*T;
B=Freq_Max-Freq_Min;
alpha=B/T;
%t=0:1/44100:T;
fmcw_wave=cos(2*pi*(Freq_Min+0.5*alpha*T.*linspace(0,1,n+1))*T.*linspace(0,1,n+1));
% plot(fmcw_wave)
% hold on
% tukey window
t5_w = tukeywin(241,0.2);
fmcw_wave = fmcw_wave.*t5_w';
% plot(fmcw_wave)
% FMCW_wave = [];
% for i = 1:4800
%     FMCW_wave = [FMCW_wave,fmcw_wave];
% end

% FMCW_WAVE = FMCW_wave(1:10:end);
% subplot(211)
% figure
% plot(FMCW_wave)

% % ellip filter
% wp = 15700;
% ws = 14000;
% wpp = wp/(192000/2);
% wss = ws/(192000/2);
% [n,Wp] = ellipord(wpp,wss,1,80);
% [b,a] = ellip(n,1,80,Wp,'high');
% FMCW_WAVE = filter(b,a,FMCW_wave);
% % subplot(212)
% % plot(FMCW_WAVE)

% % butter filter
% wp = 17000;
% ws = 15500;
% wpp = wp/(44100/2);
% wss = ws/(44100/2);
% [n,wn]=buttord(wpp,wss,1,60);
% [b,a]=butter(n,wn,'high');
% FMCW_WAVE = filter(b,a,FMCW_WAVE);
% 
% quant=max(FMCW_wave)/(2^15-1);
% z=round(FMCW_wave/quant);
% %plot(z)
% outint = int16(z);
% %signe=uint16((sign(z)'+1)/2);
% %out=[signe dec2bin(abs(z),15)];
% 
% audiowrite('myfile_fmcw.wav', outint, fs);