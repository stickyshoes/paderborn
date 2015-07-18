clc
close all
clear all

%1b
i0=1; % initial current, in A
v0=0; % inital voltage, in V
L=10; % in H
C=0.00001; % in F
R=50; % resistance in ohms
u0=100; % stable amplitude of source voltage
w=0.3/(sqrt(L*C)); % resonance frequency

delta_t=0.0005; % in s
N=1000; % time steps
U=@(t) u0*cos(w*t); 
f=@(t,y) [1/L*(U(t)-R*y(1)-y(2)); y(1)/C]; % define vectorial differential function 

[t1,y1]=ode45(f, [0 delta_t*N], [i0,v0]); % solve with built-in solver

%1c
[t2,y2]=ode_rk2(f, delta_t,N, [i0,v0]); % solve with Runge Kutta 2nd order.

%1d
plot(t1,y1)
hold on
plot(t2,y2,'r')
legend('ODE45 method','RK-2 method')
xlabel('time(s)')
ylabel('Current(A) & Voltage(V)')

%2d
 x0 = 0;
 x1 = 0.2;
 Nx = 301;
 % Specify y range and number of points
 y0 = 0;
 y1 = 0.2;
 Ny = 301;
 % Construct mesh
 xv = linspace(x0,x1,Nx);
 yv = linspace(y0,y1,Ny);
 [x,y] = meshgrid(xv,yv);
 % Calculate z
 z = x + i*y;
 % 2nd order Runge-Kutta growth factor
 S = 1 + z + 0.5*z.^2;
 Se= 1+z;
 % Calculate magnitude of S(stabiltiy region of RK-2) & Se(stability of euler)
 Smag = abs(S);
 Semag=abs(Se);
 % Plot contours of Smag
 figure
 contour(x,y,Smag,[1 1],'r');
 hold on
 contour(x,y,Semag,[1 1],'g');
 legend('RK-2 stability region','Euler stability region');
 axis([x0,x1,y0,y1]);
 title('comparison of stability using Euler & RK-2')
 xlabel('Real z');
 ylabel('Imag z');
 grid on;