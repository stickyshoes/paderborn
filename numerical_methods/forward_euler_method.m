## Author: Aishwarya Lakshminarayanan <aishu@firefly>
## Created: 2015-06-22

h=0.2;
n=50;
x1(1)=1;
y1(1)=0;
%x=0; y=0;r=1;
%ang=0:0.01:2*pi;
%xp = r*cos(ang)+x;
%yp = r*sin(ang)+y;

for i = 1:n
	y1(i+1) = y1(i) - x1(i)*h;
	x1(i+1) = x1(i) + y1(i)*h;
end;
%plot(xp,yp,x1,y1)
plot(x1,y1)

pause
