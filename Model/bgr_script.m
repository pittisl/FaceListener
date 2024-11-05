bg_spec = fft(pcm_data_1(1:5000));
pcm_data_bgr = [];
for i = 1:100
    bg_spec_t = fft(pcm_data_1(1+5000*(i-1):5000*i)) - bg_spec;
    spec_bgr = ifft(bg_spec_t);
    pcm_data_bgr = [pcm_data_bgr; spec_bgr];
end