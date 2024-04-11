% beam deflection problem 

x = 0:0.01:15 ; % all values in inches 
L = 15;
w = 100;
E = 30e6;
I = 0.2;

y = w*x.^2.*(6*L^2 - 4*L*x + x.^2)/(24*E*I) ;

%disp('The deflection values are: ')
%disp(y)

[c,i] = max(y);

disp(x(i))
disp(c)

%disp(['The max deflection is : ', c ,'it occurs at a displacement', x(i)])