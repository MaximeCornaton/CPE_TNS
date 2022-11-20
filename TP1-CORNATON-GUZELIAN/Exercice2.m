clear;
[s1, t, K]=Generateur2(8,271,25*pi/180, 5,1147,38*pi/180, -8.1*10^(-3),12.05*10^(-3),5000);
stem(t,s1);xlabel('temps en ms');title('s(t)=8*sin(2pi*271*t+25° + 5*sin(2pi*1147*t+38°)');