fs = 48000;
T = 10;
n = fs*T;
f1 = 17000;
f2 = 18000;
f3 = 19000;
f4 = 20000;
y1 = cos(2*pi*f1*T*linspace(0,1,n+1));
y2 = cos(2*pi*f2*T*linspace(0,1,n+1));
y3 = cos(2*pi*f3*T*linspace(0,1,n+1));
y4 = cos(2*pi*f4*T*linspace(0,1,n+1));
y = y1+y2+y3+y4;

quant=max(y)/(2^15-1);
z=round(y/quant);
%plot(z)
outint = int16(z);
%signe=uint16((sign(z)'+1)/2);
%out=[signe dec2bin(abs(z),15)];

audiowrite('myfile.wav', outint, fs);