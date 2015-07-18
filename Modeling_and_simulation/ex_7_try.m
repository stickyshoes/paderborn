clc
clear all
close all
x1(1)=0;
y1(1)=0;
h=0.2;
N=50;
x=0;y=0;r=1;
ang=0:0.01:2*pi;
xp=r*cos(ang)+x;
yp=r*sin(ang)+y;

%forward euler method
for i=1:N
    y1(i+1)=y1(i)+h*(-x1(i));
    x1(i+1)=x1(i)+h*(y1(i));
end

plot(xp,yp,x1,y1)