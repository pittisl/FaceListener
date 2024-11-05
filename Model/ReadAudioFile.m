function pcm_data = ReadAudioFile(file_name)
fileId = fopen(file_name,'r');
pcm_data = fread(fileId,inf,'int16',0,'b');
fclose('all');