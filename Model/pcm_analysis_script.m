% 
% % Read Audio File
% fileId = fopen('fmcw_0810_simultaneous_breath_twice_ear.pcm','r');
% pcm_data = fread(fileId,inf,'int16',0,'b');
% fclose('all');
% 
% % High Pass Filter
% wp = 16700;
% ws = 15000;
% wpp = wp/(48000/2);
% wss = ws/(48000/2);
% [n,wn]=buttord(wpp,wss,1,60);
% [b,a]=butter(n,wn,'high');
% pcm_data_f = filter(b,a,pcm_data);

% Calculate Coorelation
% test = pcm_data_f(40000:50000);
% plot(test);
% test_n = test/max(test);
% plot(test_n);               % 0.88
% PCM_test;
% y = y * 0.88;
% plot(y);
% corr_script;                % 6613 + 241

% % Mix the signal
% PCM_fmcw_test;
mix = FMCW_wave' .* pcm_data_f(15980:835179);

% Plot spectrum
% subplot(211)
% [bg,f] = PCM_fft(mix(51201:52224),1024);
% hold on
% [bk20,f] = PCM_fft(mix(409601:411648),2048);
% [bk10,f] = PCM_fft(mix(716801:718848),2048);
% [bk5,f] = PCM_fft(mix(983041:985088),2048);
