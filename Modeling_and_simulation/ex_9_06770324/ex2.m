clc
clear all
close all

N = 500;
h = 0.01;

x0 = 0.1;
y0 = 0.0;
z0 = 0.0;

global a b c
a = 0.2;
b = 0.2;
c = 5.7;
dy = zeros(3,1);

f=@(tt,dy)[-dy(2)-dy(3);dy(1)+a*dy(2);b+dy(3)*(dy(1)-c)];

[t1 y1] = ode45(f,[0 h*N],[x0; y0; z0]);
plot3(y1(:,1),y1(:,2),y1(:,3))

[t2 y2] = my45(f,[0 h*N],[x0; y0; z0]);
hold on
plot3(y2(1,:),y2(2,:),y2(3,:),'g')
xlabel('x')
ylabel('y')
zlabel('z')
title('problem 2')
legend('ode45','my45')