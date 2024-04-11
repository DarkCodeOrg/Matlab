
clc,clearvars, clear all;


x = 0:0.01:5;

y = -(x-3).^2 + 10;
%y = @(x) -(x-3).^2 + 10;                                                    %this @(x) makes y a function handle also be used as a anonymous function
                                                                             % this definition to be used to find value of y at any value of x
                                                                             % or finding the integral of the function y over an interval a,b
                                                                             \
disp(max(y));
disp(min(y));

[c,i] = max(y);

disp(c)
disp(x(i))

plot(x,y)

%p = y(20.2)
%q = integral(y,0,5)

