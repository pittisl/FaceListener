clear;clc;close all;
%
fs = 441000;
T = 0.006;
duration = 30;
n = fs*duration;
t = 0:((duration/T)*2*pi/(duration*fs)):((duration/T)*2*pi);
y = (sawtooth(t,0.9) + 1) * 2500 + 17000;
fmcw_wave=cos(2*pi*y*duration.*linspace(0,1,n+1));