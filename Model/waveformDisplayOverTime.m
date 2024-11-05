% This is to display the waveform in real time (not authentic real time)
data_display = pca_com;
figure,
i = 1;
while(i+10 <= length(pca_com))
   plot((i:i+9)*48*26/48000, pca_com(i:i+9), '-b'), hold on
   i = i + 9;
   pause(0.24); 
end