clc
close all
clear all
x1(1)=1;
y1(1)=0;
x2(1)=1;
y2(1)=0;
x3(1)=1;
y3(1)=0;
x4(1)=1;
y4(1)=0;
x5(1)=1;
y5(1)=0;
h2=0.5;
h=0.2;
N=50;
x=0;y=0;r=1;
ang=0:0.01:2*pi; 
xp=r*cos(ang)+x;
yp=r*sin(ang)+y;

for i=1:N
    %forward euler
    x1(i+1)=x1(i)+y1(i)*h;
    y1(i+1)=y1(i)-x1(i)*h;
    
    %backward euler
    x2(i+1)=x2(i)+(y2(i)-x2(i)*h)*h;
    y2(i+1)=y2(i)-(x2(i)+(y2(i)-x2(i)*h)*h)*h;
    
    %semi-implicit euler
    x3(i+1)=(x3(i)+y3(i)*h)/(1+h^2);
    y3(i+1)=(y3(i)-x3(i)*h)/(1+h^2);
    
    %runga-kutta
    %x4(i+1)=x4(i)*((1-h^2)/2)+y4(i);
    %y4(i+1)=y4(i)*((1-h^2)/2)-x4(i);
    x4(i+1)=(x4(i)+y4(i)*h)/(1+h^2/2);
    y4(i+1)=(y4(i)-x4(i)*h)/(1+h^2/2);
    x5(i+1)=(x5(i)+y5(i)*h2)/(1+h2^2/2);
    y5(i+1)=(y5(i)-x5(i)*h2)/(1+h2^2/2);

end

plot(xp,yp,x1,y1,'k',x2,y2,'y',x3,y3,'r--')
legend('circle','forward','backward','semi-implicit')
title('1c(i)')

figure
plot(xp,yp,x3,y3,'g',x5,y5,'k--')
legend('circle','semi-implicit','runge-kutta using h=0.5')
title('1c(ii)')

figure
plot(xp,yp,x3,y3,'k--',x4,y4,'y')
legend('circle','semi-implicit','runge-kutta using h=0.2')
title('1c(iii)')