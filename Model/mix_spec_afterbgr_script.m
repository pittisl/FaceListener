% plot mix spectrogram after background removal
fs = 48000;
N = 819200;
n_fft = 4096;
mix_r = reshape(mix,n_fft,N/n_fft);
% [spec,f] = PCM_fft(mix_r,n_fft);
spec = pspectrum(mix_r);
% figure
% imagesc(20*log10(abs(spec)/max(abs(spec(:)))));
spec_seg = spec(:,1:40);
spec_seg_mean=mean(spec_seg,2);
spec_bgr = spec - spec_seg_mean;
figure
imagesc(linspace(0,N/fs,N/n_fft),linspace(0,fs,n_fft),spec_bgr);
% imagesc(spec_bgr);
colorbar

% plot maximum
% figure
hold on
[max_spec,index]=max(spec_bgr(1:100,:));
plot(linspace(0,N/fs,N/n_fft),((index-1)/4096)*48000,'r');
% plot(index,'r');