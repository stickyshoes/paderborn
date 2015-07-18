%exercise 1
clc
clear all
close all


ra = 0; % initial value
s(1) = -1.0; % first guess for derivative
s(2) = -2.0; % second guess for derivative
target_value = 0; % target value

f = @(tt,yy) [yy(2);(1-2*yy(1)^2)]; % 1st order ODEs
g = @(r) (r-target_value); % boundary condition

for i=2:200
    [t,y] = ode45(f,[0 1],[ra; s(i)]);
    rb(i) = y(end,1);
    
    if abs(g(rb(i)))<0.001 % quit for loop if accuracy reached
        break
    end;
    
    s(i+1) = s(i)-g(rb(i))*(s(i)-s(i-1))/(g(rb(i))-g(rb(i-1))); % newton method
end;

plot(t,y(:,1))
xlabel('time')
ylabel('y(t)')


%exerceise 2

A = [3 -3 0 0 0; 1 7 -7 0 0;0 1 11 -11 0;0 1 15 -15 0;0 0 20 0 0]
B = [0;0;0;0;1140]

Y = inv(A)*B


