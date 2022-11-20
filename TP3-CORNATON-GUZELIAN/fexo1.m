function [ x,h,yc ] = fexo1( N,num )

%séquence x[k]
k1=0:1:10;
x=6-abs(k1-5);

%séquence h[k]
k2a=zeros(1,5);
k2b=5:1:11;
h1= abs(k2b-8)-1;
h=[k2a,h1];

%TFD N-points de x et h
X=fft(x,N);
H=fft(h,N);

%convolution circulaire
yc=ifft(X.*H,N);

%affichage
figure(num);
subplot(311);stem(k1,x);title('x[k]=6-abs(k1-5)');xlabel('indice');ylabel('x')
subplot(312);stem(0:1:11,h);title('h[k]=abs(k2-8)-1');xlabel('indice');ylabel('h')
subplot(313);stem(0:1:N-1,yc);title('yc[k]=convCirc(x;h)');xlabel('indice');ylabel('yc')

end

