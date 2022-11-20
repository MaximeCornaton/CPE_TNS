function [ n,S ] = fexo2( M )
n=2048;
k=0:1:M-1;
s=(0.91).^k;

%affichage de s[k]
figure(1);
stem(k,s);xlabel('indice');title('s[k]');

%calcul de la TFD 2048-points
S=fft(s,n);

end

