%appel de la fonction fexo2
[ n,S ] = fexo2( 12 );
S;

%vecteur des fréquences
f=-1.5:1/n:1.5-1/n;

%génération du vecteur X(f)
X=1./(1-0.91*exp(-2*i*pi*f));

%fréquence réduite de S(f)
f1=0:1:n-1;

%affichage courbes
figure(2)
subplot(2,2,1)
plot(f1/n,real(S),f,real(X));axis([-Inf,Inf,-Inf,Inf]);xlabel('frequence reduite');title('Partie rÃ©elle')
subplot(2,2,2)
plot(f1/n,imag(S),f,imag(X));axis([-Inf,Inf,-Inf,Inf]);xlabel('frequence reduite');title('Partie imaginaire')
subplot(2,2,3)
plot(f1/n,abs(S),f,abs(X));axis([-Inf,Inf,-Inf,Inf]);xlabel('frequence reduite');title('Module')
subplot(2,2,4)
plot(f1/n,angle(S),f,angle(X));axis([-Inf,Inf,-Inf,Inf]);xlabel('frequence reduite');title('Phase');

%centrage de la TFD de S[n]
S1=fftshift(S);

%fréquence réduite de S1(f) 
f2=-0.5:1/n:0.5-(1/n);

%affichage des courbes
figure(3)
subplot(2,2,1)
plot(f2,real(S1),f,real(X));axis([-Inf,Inf,-Inf,Inf]);xlabel('frequence reduite');title('Partie rÃ©elle')
subplot(2,2,2)
plot(f2,imag(S1),f,imag(X));axis([-Inf,Inf,-Inf,Inf]);xlabel('frequence reduite');title('Partie imaginaire')
subplot(2,2,3)
plot(f2,abs(S1),f,abs(X));axis([-Inf,Inf,-Inf,Inf]);xlabel('frequence reduite');title('Module')
subplot(2,2,4)
plot(f2,angle(S1),f,angle(X));axis([-Inf,Inf,-Inf,Inf]);xlabel('frequence reduite');title('Phase')
    



