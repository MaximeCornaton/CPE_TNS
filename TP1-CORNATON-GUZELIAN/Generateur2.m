function [x,t,K] = Generateur2(A1,nu1,phi1,A2,nu2,phi2,td,tf,nue)
kd=ceil(td*nue);
kf=floor(tf*nue);
f1= nu1/nue;
f2= nu2/nue;
phi1=phi1*pi/180;
phi2=phi2*pi/180;
[s1,k1]=Generateur(A1,f1,phi1,kd,kf);
[s2,k2]=Generateur(A2,f2,phi2,kd,kf);
x=s1+s2;
t=k1/nue;
K=length(t);

