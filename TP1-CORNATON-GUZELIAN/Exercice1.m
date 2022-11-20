clear;
[s1,k1]=Generateur(2,1/34,0,0,26);
s2=Generateur(-4,1/26,pi/2,-13,13);
s3=Generateur(1,3/32,pi/4,-10,10);
s4=Generateur(1,1/(2*sqrt(23)),pi/2,0,50);

%affichage
subplot(2,2,1),stem(k1,s1);xlim([0,26]);xlabel('indices');title('s1[k]=2sin(pi/17*k)');
subplot(2,2,2),stem(s2);xlim([0,26]);xlabel('indices');title('s2[k]=-4cos(pi/13*k)');
subplot(2,2,3),stem(s3);xlim([0,20]);xlabel('indices');title('s3[k]=sin(3pi/16*k+pi/4)');
subplot(2,2,4),stem(s4);xlim([0,50]);xlabel('indices');title('s4[k]=cos(pi/sqrt(23)*k)');