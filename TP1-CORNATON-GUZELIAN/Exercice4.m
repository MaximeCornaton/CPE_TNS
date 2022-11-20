clear;

[x,t,K] = Generateur2(8,271,pi/2,5,1147,pi/2,-10.12/1000,10.12/1000,5000);

figure(1);
stem(t,x);xlabel('temps en ms');title('x(t)=8*sin(2pi*271*t+90° + 5*sin(2pi*1147*t+90°)');

N=512;
y=[x(floor(K/2)+1:K),zeros(1,N-K),x(1:floor(K/2))];
i=0:1:N-1;


figure(2);
plot(i,y);xlim([0,512]);xlabel('indices');title('y[k]');


Y=fft(y,N);
f = 0:5000/N:5000-5000/N;

figure(3);
subplot(2,2,1);plot(f,real(Y));xlabel('frequence réelle en Hz');title('Partie réelle de Y(f)');
subplot(2,2,2);plot(f,imag(Y));xlabel('frequence réelle en Hz');title('Partie imaginaire de Y(f)');
subplot(2,2,3);plot(f,abs(Y));xlabel('frequence réelle en Hz');title('Module de Y(f)');
subplot(2,2,4);plot(f,angle(Y));xlabel('frequence réelle en Hz');title('Phase de Y(f)');

