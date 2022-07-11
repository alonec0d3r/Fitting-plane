clear;
clc;

% Random Points generation :: Agrawal
Def_matrix = readmatrix("Thermal_Deformation_Data.xls","Range","A2:E5401");

M = 6;
N = 30;
P = 30;

Grid_size = 0.01;

X = zeros(P*N,1);
Y = zeros(P*N,1);
Z = zeros(P*N,1);

X_def = zeros(P*N,1);
Y_def = Def_matrix(1:P*N,4);
Z_def = Def_matrix(1:P*N,5);

X_new = zeros(P*N,1);
Y_new = zeros(P*N,1);
Z_new = zeros(P*N,1);

for i = 1:P*N
    sum = 0;
    for m = 1:M
        sum = Def_matrix((m-1)*P*N + i,3) + sum;
    end
    X_def(i,1) = (-1)*sum;      % Along -ve X-axis
    X(i,1) = 0;
end

for n = 1:N
    Y((1 + (n-1)*P):(P + (n-1)*P),1) = (n-0.5)*Grid_size;
end

for p = 1:P
    for n = 1:N
        Z(p + (n-1)*P,1) = (p-0.5)*Grid_size;
    end
end

disp("Successfully generated points.")