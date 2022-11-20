function [s,k] = Generateur(A,f,phi,kd,kf)
k=kd:1:kf;
s = A*sin(2*pi*f*k+phi);


end

