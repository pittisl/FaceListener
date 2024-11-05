function plot_contour(spec_bgr,thres)
fs = 48000;
N = 819200;
n_fft = 4096;
[l,c] = size(spec_bgr);
contour = zeros(1,c);
for i = 1:c
    if max(spec_bgr(1:50,i)) > thres
        [amp,contour(i)] = max(spec_bgr(1:100,i));
    elseif i == 1
        contour(i) = 0;
    else
        contour(i) = contour(i-1);
    end
end
% figure
plot(linspace(0,N/fs,N/n_fft),((contour-1)/4096)*48000,'-.k')