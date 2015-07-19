
% Traditional, normal fuctions, written the long way.
% 'y' is the output, you need to assign the value to y 
% before you leave the fuction.
function y = factorial(n)
  if n < 1
      y = 1;
  else 
      y = n * factorial(n - 1);
  end 
end 


function fib = fibonacci(x)
if x < 2
  fib = x;
else 
  fib = fibonacci(x - 1) + fibonacci(x - 2);
end 
end 


% It is also possible to have a function return multiple values
% In this case it returns fib, and fact.
% We need to fill the values before we return
function [fib, fact] = fibofactorial(x)
fib = fibonacci(x);
fact = factorial(x);
end 

% It is also possible to pass functions as parameters/arguments.
% in this case fibFoo and factFoo are the inputs, we are free to use them.
% We could choose to not use them as well.
% Other rules of traditional functions remain the same.
function [fib, fact] = fibofactorialComplext(x, fibFoo, factFoo)
fib = fibFoo(x)
fact = factFoo(x)
end 


% 
% 
% Here we make some calls, to confirm our theories. 
% 
% 
fa12 = factorial(12)
fi12 = fibonacci(12)

for x=1:3
    display 'Normal function call';
    
    % Calling the traditional function with normal arguments.
    [fib, fact] = fibofactorial(x)
    
    display 'Functions as parameters';

    % Call the function which accpets functions as inputs.
    % NOTE: we need to prefix the function in parameters with an '@'
    [fib, fact] = fibofactorialComplext(x, @factorial, @fibonacci)
end 

cylinderVolume = @(r, h) 3.14 * r * r * h;
cylinderVolume(10, 10)

square = @(n) n * n;
product = @(a, b) a * b;
sumOfSquares = @(a, b) square(a) + square(b) ;
squareOfSums = @(a, b) sumOfSquares(a, b) + 2 * product(a, b);

display '@nonymous';
squareOfSums(10, 12)

function sqSum = sqSumLongWay(squareMethod, productMethod, a, b)
sqSum = squareMethod(a) + squareMethod(b) + 2 * productMethod(a, b);
end 

function tradSquare = tradSquare(x)
tradSquare = x * x
end 

sqSumLongWay(square, product, 10, 12)
sqSumLongWay(@tradSquare, product, 10, 12)

in_square = inline('n * n', 'n');
in_product = inline('a * b', 'a', 'b');
in_sumOfSquares = inline('in_square(a) + in_square(b)', 'a', 'b') ;
in_squareOfSums = inline('in_sumOfSquares(a, b) + 2 * in_product(a, b)', 'a', 'b');

display 'in_line';
in_squareOfSums(10, 12)
