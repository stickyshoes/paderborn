clc
clear all
close all
T0= 20;
Y1(1)=0;
Y2(1)=0;
R0=50;
alpha=0.5;
beta=200;
h=1/100;
timeconstant=5.6770324;

% define voltage sources
fnc = @(y,v) -(1/timeconstant)*y + beta*((v^2)/(R0*(1+alpha*y))^2); % Function for the passing values in loop
t=0:1/100:101;
n1 = length(t);
for i = 1:n1;
    V1(i)= sin((pi/10)*t(i));
    V2(i)= (1+square(2*pi*0.05*(t(i)-1)))/2;
    
    if(i<n1) % for maintaining the number of columns in t and Y vectors
        Y1(i+1)=Y1(i)+h*fnc(Y1(i),V1(i));
        Y2(i+1)=Y2(i)+h*fnc(Y2(i),V2(i));
    end
    
    I1(i)= V1(i)/(R0*(1+alpha*Y1(i)));
    I2(i)= V2(i)/(R0*(1+alpha*Y2(i)));
    
end

subplot(3,1,1)
plot(t,V1)
ylabel('Voltage V(t)')
xlabel('time in seconds')

subplot(3,1,2)
plot(t,I1)
ylabel('Current I(t)')
xlabel('time in seconds')

subplot(3,1,3)
plot(t,Y1)
ylabel('Y(t)')
xlabel('time in seconds')

figure
subplot(3,1,1)
plot(t,V2)
ylabel('Voltage V(t)')
xlabel('time in seconds')

subplot(3,1,2)
plot(t,I2)
ylabel('Current I(t)')
xlabel('time in seconds')

subplot(3,1,3)
plot(t,Y2)
ylabel('Y(t)')
xlabel('time in seconds')
