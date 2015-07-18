function [ ts,v ] = my452( fnhs,ts,v0 )
N = length(ts);
n = length(v0);
v = [v0 zeros(n,N-1)];
w = v0;

for i=1:N-1
    h = ts(i+1) - ts(1);
    t = ts(i);
    k1 = fnhs(t,w);
    k2 = fnhs(t+h/2,w+h*k1/2);
    k3 = fnhs(t+h/2,w+h*k2/2);
    k4 = fnhs(t+h,w+h*k3);
    w = w + h*(k1 + 2*k2 + 2*k3 + k4)/6;
    v(:,i+1) = w;
end
%v = transpose(v);
%ts = transpose(ts);
end