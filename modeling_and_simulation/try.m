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