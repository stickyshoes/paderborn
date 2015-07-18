v=zeros(1,N);
p=1.2;
A=0.09;
cw=0.4;
m=5;
g=10;
N=100;
v=zeros(1,N);
h=.2;
for i=1:N-1
    v(i+1)=v(i)+ (g-0.5*(m*comega*rho*a*(v(i)^2)))*h;
end

vt=sqrt((m*g)/(comega*rho*a));
t=(0:N-1)*h;
plot(t,v,t,ones(1,N)*vt);
xlabel('time')
ylabel('velocity')
legend('euler method','analytical solution')