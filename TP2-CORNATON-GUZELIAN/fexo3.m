function [ S ] = fexo3( f0, N)

M = 35;
k = 0:1:M-1;
s = cos(2*pi*f0*k);

%calcul TFD N-points de s
S=fft(s,N);

%affichage de s[k]
figure(1);stem(k,s);axis([-Inf,Inf,-Inf,Inf]);xlabel('indice');title('s[k]')

%fréquence réduite de S(f)
fr= 0:1/N:1-1/N;

%affichage des courbes
figure(2);
subplot(2,2,1)
stem(fr,real(S),'.');axis([-Inf,Inf,-Inf,Inf]);xlabel('frequence reduite');title('Partie rÃ©elle')
subplot(2,2,2)
stem(fr,imag(S),'.');axis([-Inf,Inf,-Inf,Inf]);xlabel('frequence reduite');title('Partie imaginaire')
subplot(2,2,3)
stem(fr,abs(S),'.');axis([-Inf,Inf,-Inf,Inf]);xlabel('frequence reduite');title('Module')
subplot(2,2,4)
stem(fr,angle(S),'.');axis([-Inf,Inf,-Inf,Inf]);xlabel('frequence reduite');title('Phase');

end








