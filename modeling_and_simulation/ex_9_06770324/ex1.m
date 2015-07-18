clc
clear all
close all

N = 50;
h = 0.01;

x0 = 0;
y0 = 1;
z0 = 0;

global sigma rho beta
sigma = 10;
rho = 28;
beta = 2.66;
dy = zeros(3,1);

f=@(tt,dy)[sigma*(dy(2)-dy(1));rho*dy(1)-dy(1)*dy(3)-dy(2);dy(1)*dy(2)-beta*dy(3)];

[t1 y1] = ode45(f,[0 h*N],[x0; y0; z0]);
plot3(y1(:,1),y1(:,2),y1(:,3))
grid on

[t2 y2] = my45(f,[0 h*N],[x0; y0; z0]);
hold on
plot3(y2(1,:),y2(2,:),y2(3,:),'g')
xlabel('x')
ylabel('y')
zlabel('z')
title('problem 1')
legend('ode45','my45')