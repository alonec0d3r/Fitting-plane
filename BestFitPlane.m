clear;
clc;

Nx = [1, 3, 4];
Ny = [3, 5, 2];
Nz = [2, 3, 4];

A = ones(length(Nx), 3);
for i = 1:length(Nx)
    A(i, 1) = Nx(i);
    A(i, 2) = Ny(i);
end

B = Nz';

X = ((inv(A'*A))*A')*B;

a = -1*X(2)/X(1);
b = 1/X(1);
c =  -1*X(3)/X(1);

disp("x = aY + bZ + c")
disp("a: " + a)
disp("b: " + b)
disp("c: " + c)