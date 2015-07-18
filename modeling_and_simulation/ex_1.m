function x = solve (n) 

a=diag(2*ones(1,n))+ones(n)
b=transpose([1:1:n]*a)
for j=1:n
    for i=1:n
        sum = sumsum(j*a(i,j));
    end   
        b(i)= sum;
        sum = 0;
end

x = a/b
end