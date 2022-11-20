clear;
[x, t, K]=Generateur2(8,271,25*pi/180, 5,1147,38*pi/180, 0,18.41*10^(-3),5000);
K
figure(1);
stem(t,x);xlabel('temps en ms');title('x(t)=8*sin(2pi*271*t+25° + 5*sin(2pi*1147*t+38°)');

X = fft(x,K)

i = 0:1:K-1;
figure(2);
subplot(2,2,1);stem(i,real(X));xlabel('indices');title('Partie réelle de X[n]');
subplot(2,2,2);stem(i,imag(X));xlabel('indices');title('Partie imaginaire de X[n]');
subplot(2,2,3);stem(i,abs(X));xlabel('indices');title('Module de X[n]');
subplot(2,2,4);stem(i,angle(X));xlabel('indices');title('Phase de X[n]');

fr = 0:1/K:1-1/K;
figure(3);
subplot(2,2,1);stem(fr,real(X));xlabel('frequence reduite');title('Partie réelle de X(fr)');
subplot(2,2,2);stem(fr,imag(X));xlabel('frequence reduite');title('Partie imaginaire de X(fr)');
subplot(2,2,3);stem(fr,abs(X));xlabel('frequence reduite');title('Module de X(fr)');
subplot(2,2,4);stem(fr,angle(X));xlabel('frequence reduite');title('Phase de X(fr)');

f = 0:5000/K:5000-5000/K;
figure(4);
subplot(2,2,1);stem(f/1000,real(X));xlabel('frequence réelle en kHz');title('Partie réelle de X(f)');
subplot(2,2,2);stem(f/1000,imag(X));xlabel('frequence réelle en kHz');title('Partie imaginaire de X(f)');
subplot(2,2,3);stem(f/1000,abs(X));xlabel('frequence réelle en kHz');title('Module de X(f)');
subplot(2,2,4);stem(f/1000,angle(X));xlabel('frequence réelle en kHz');title('Phase de X(f)');

N=512
X2 = fft(x,N);
figure(5);
subplot(1,3,1);plot(0:1:N-1, abs(X2));xlim([0,512]);xlabel('indices');title('Module X2[n] ');
subplot(1,3,2);plot(0:1/N:1-1/N, abs(X2));xlim([0,1-1/N]);xlabel('frequence reduite');title('Partie réelle de X2(fr)');
subplot(1,3,3);plot((0:5/N:5-5/N), abs(X2));xlim([0,5-5/N]);xlabel('frequence réelle en kHz');title('Partie réelle de X2(f)');

%Avec le curseur les 4 valeurs maximales du module de X[n] sont:
%Aux indices: 5,21,72,88 
%Aux frequences reduites: 0.054, 0.226, 0.774, 0.946
%Donc aux frequences reelles: f=fr*ve: 270Hz, 1130Hz, 3870Hz, 4730Hz

%Q7: f=fr*ve, i=fr*K

%Q8: les 2 premieres composantes sont liees aux frequences fixees du
%signal, les 2 suivantes sont liees a la partie negative du signal repete
%periodiquement (Fe-nu1 et Fe-nu2). 

%Il y a des differences...

%X2: indices: 28, 118,395,484
% freq red: 0.055,0.23,0.77,0.95
% f: 0.27kHz,1.15kHz, 3.85kHz, 4.72kHz

