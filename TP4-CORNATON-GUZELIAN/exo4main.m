clear all

[x,nue]=audioread('signal10.wav');
 
Rp=1; %Ondulation en db de la bande passante
Rs=200; %Attenuation de la bande d'arret a partir de la valeur max de la BP

n=7; %ordre du filtre 
fc=2600;
Wp=2*pi*fc; %Frequence limite de la bande passante

[b,a]=ellip(n,Rp,Rs,Wp,'s');

w= 0:nue*pi;

H=freqs(b,a,w); %gain complexe

figure(1)
subplot(2,1,1); 
plot(w/(2*pi),20*log10(abs(H)));title('module gain complexe (dB)'); xlabel('en frequence');xlim([-inf;+inf]);
 
subplot(2,1,2); 
plot(w/(2*pi),unwrap(angle(H))); title('Phase'); xlabel('frequence');xlim([-inf;+inf]);


[numd,dend] = bilinear(b,a,nue); %filtre numerique
[h,t] = impz(numd,dend); %reponse impulsionnelle

figure(2);
subplot(2,2,1); 
plot(t,h);title('Réponse impulsionnelle');xlabel('indice');xlim([-inf;+inf]);
 
subplot(2,2,2); 
zplane(numd, dend);title('Diagramme pôle-zéro');
 
subplot(2,2,3); 
[b2,f2]=freqz(numd,dend,2048,nue);
plot(f2,20*log10(abs(b2)));title('module gain complexe (dB)');xlabel('en frequence');xlim([-inf;+inf]);
 
subplot(2,2,4); %phase
plot(f2,unwrap(angle(b2)));title('Phase');xlabel('frequence');xlim([-inf;+inf]);


figure(4)
plot(f2,abs(b2)); title('module gain complexe');xlabel('frequence');xlim([-inf;+inf]);



db2 = 60;

signal_filtre=filter(h,1,x);
sgram(signal_filtre,nue,db2,5);  
soundsc(signal_filtre,nue);

