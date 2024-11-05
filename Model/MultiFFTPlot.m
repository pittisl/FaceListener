function MultiFFTPlot(data_point,interval,nfft)
for i = 1:length(data_point-nfft)/interval
    if nfft + interval * (i-1) >= length(data_point)
        break;
    end
    PCM_fft(data_point(interval * (i-1) + 1:nfft + interval * (i-1)),nfft);
    hold on;
end