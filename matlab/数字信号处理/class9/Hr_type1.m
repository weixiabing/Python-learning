function[Hr,w]=Hr_type1(h)
N=length(h)+1;L=(N-1)/2;n=0:L;
a=[h(L+1) 2*h(L:-1:1)];
w=[0:511]'*pi/512;Hr=cos(w*n)*a';