function [t,y]=my45(f,tin,y0)   
    y(:,1)=y0;
    deltat=0.01;
    t=tin(1):deltat:tin(end);
    
    for n=1:size(t,2)-1
        k1=f(t(n),y(:,n));
        k2=f(t(n)+deltat/2,y(:,n)+deltat*k1/2);
        k3=f(t(n)+deltat/2,y(:,n)+deltat*k2/2);
        k4=f(t(n)+deltat,y(:,n)+deltat*k3);
        y(:,n+1)=y(:,n)+deltat*(k1+2*k2+2*k3+k4)/6;
    end;
end