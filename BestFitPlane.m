% Actual Algorithm for Best Fit Plane :: AS135

Nx = (X + X_def)'; % All X coordinates x0, x1, ...
Ny = (Y + Y_def)'; % All Y coordinates y0, y1, ...
Nz = (Z + Z_def)'; % All Z coordinates z0, z1, ...

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