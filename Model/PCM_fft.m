function [spectrum,frequency] = PCM_fft(pcm_data, N)
% pi = 3.1415926;
Fs = 48000;
Y = fft(pcm_data,N);
P2 = abs(Y/length(Y));
% P1 = P2(1:length(Y)/2 + 1);
% P1(2:end - 1) = 2*P1(2:end-1);
% f = Fs * (0:(length(Y)/2))/length(Y);
f = (0:length(Y)-1)*Fs/length(Y); % comment here
% subplot(211);
spectrum = P2;
frequency = f;
plot(f,P2);         % change to P1
grid on;
title('Amplitude')
% 
% Pha = angle(Y);     % comment here
% subplot(212);
% plot(f,Pha);
% grid on;
% title('Phase');

% find max frequency
% [~,I] = max(P1);
% frequency_max = (Fs/2) * (I/(length(Y)/2))