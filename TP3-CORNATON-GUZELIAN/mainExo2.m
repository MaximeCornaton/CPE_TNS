B=10000;
nu1=2625;
nu2=7280;
nue=20000;

%fr�quence r�duite
f0 = B/nue;
f1 = nu1/nue;
f2 = nu2/nue;

%Zeros du filtre
z0=-1;
z1=exp(2*i*pi*f1);
z1c=conj(z1);
z2=exp(2*i*pi*f2);
z2c=conj(z2);

%Polynome
b=poly([z0,z1,z1c,z2,z2c]); %on d�finit un polyn�me avec ses racines

%Gain complexe
h=b/sum(b);
a=1;
n=1024;

%Coeff de la reponse impulsionnelle
[H,w]=freqz(b,a,n,nue);


%affichage
figure(1);
subplot(2,2,1);zplane(roots(h));xlabel('Partie r�elle');title('Diagramme p�le-z�ros du filtre');
subplot(2,2,2);stem(0:1:length(b)-1,b);xlabel('Indices');title('R�ponse impulsionnelle du filtre');
subplot(2,2,3);plot(w,20*log10(abs(H)));xlabel('Fr�quence en Hz)');title('Module du gain complexe');
subplot(2,2,4);plot(w,unwrap(angle(H)));xlabel('Fr�quence en Hz');title('Phase du gain complexe');


% --- APPLICATION DU FILTRAGE ---

load signal15.mat

%2 signaux de brouillages
s1=8*sin(2*pi*nu1*t);
s2=8*sin(2*pi*nu2*t);

%Brouillage additif du signal 15
sBrouille=s+s1+s2;

%Filtrage avec le filtre synthetise precedemment
sBrouilleFiltre=filter(b,a,sBrouille);

%Affichage des signaux non brouillé, brouilé et brouillé filtré.
figure(2) 

subplot(3,1,1);plot(t,s);xlabel('Temps en s');title('Signal original');xlim([-inf;+inf])

subplot(3,1,2);plot(t,sBrouille);xlabel('Temps en s');title('Signal brouill�');xlim([-inf;+inf])

subplot(3,1,3);plot(t,sBrouilleFiltre);xlabel('Temps en s');title('Signal filtre');xlim([-inf;+inf])


%densites spectrales
N = length(s);

S=abs(fft(s,N)).^2;
SBrouille=abs(fft(sBrouille,N)).^2;
SBrouilleFiltre=abs(fft(sBrouilleFiltre,N)).^2;


%Affichage des densités spectrales du signal, brouillé et brouillé filtré.
figure(3) 

subplot(3,1,1)
f=0:nue*(1/N):nue*(1-1/N);
plot(f,S);xlabel('Fr�quence en Hz');title('Densit� spectrale signal original');xlim([0;+10000]);ylim([-inf;+inf])

subplot(3,1,2)
plot(f,SBrouille);xlabel('Fr�quence en Hz');title('Densit� spectrale du signal brouill�');xlim([0;+10000]);ylim([-inf;+inf])

subplot(3,1,3)
plot(f,SBrouilleFiltre);xlabel('Fr�quence en Hz');title('Densit� spectrale du signal filtre');xlim([0;+10000]);ylim([-inf;+inf])



