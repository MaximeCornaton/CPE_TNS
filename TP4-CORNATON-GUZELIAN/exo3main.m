clear all

db=70;
[x,nue]=audioread('signal10.wav');

M=70; %longueur filtre
fc=2800; 
fr=fc/nue; 
wind=rectwin(M+1); %fenetre rectangulaire de M+1 points
H=fir1(M,2*fr,wind); %filtre

%figure(1);wvtool(window)


figure(1);
subplot(2,2,1); stem(0:M,H);title('Réponse impulsionnelle'); xlabel('indice');xlim([-inf;+inf]);
 
subplot(2,2,2); 
zplane(H);title('Diagramme pôle-zéro'); 
 
subplot(2,2,3); 
[b,f]=freqz(H,1,2048,nue); % b gain complexe, f vecteur frequence
plot(f,20*log10(abs(b))); title('module gain complexe (dB)');xlabel('frequence');xlim([-inf;+inf]);
 
subplot(2,2,4); 
plot(f,unwrap(angle(b))); 
title('Phase');xlabel('frequence');xlim([-inf;+inf]);


wind2=hann(M+1); %fenetre
H2=fir1(M,2*fr,wind2); %filtre
 
figure(2);
subplot(2,2,1); 
stem(0:M,H2);title('Réponse impulsionnelle');xlabel('indice');xlim([-inf;+inf]);
 
subplot(2,2,2); 
zplane(H2);title('Diagramme pôle-zéro');
 
subplot(2,2,3); 
[b2,f2]=freqz(H2,1,2048,nue);
plot(f2,20*log10(abs(b2)));title('module gain complexe (dB)');xlabel('Fr�quence');xlim([-inf;+inf]);
 
subplot(2,2,4); %phase
plot(f2,unwrap(angle(b2)));title('Phase');xlabel('frequence');xlim([-inf;+inf]);



figure(3)
subplot(2,1,1); 
plot(f,abs(b)); title('module gain complexe - Filtre 1');xlabel('Fr�quence');xlim([-inf;+inf]);

subplot(2,1,2); 
plot(f2,abs(b2)); title('module gain complexe - Filtre 2');xlabel('Fr�quence');xlim([-inf;+inf]);





db2 = 60;

signal_filtre=filter(H,1,x);
signal_filtre2=filter(H2,1,x);

sgram(signal_filtre,nue,db2,5);  
sgram(signal_filtre2,nue,db2,6);

soundsc(signal_filtre2,nue);




