%% Fourier Co efficient Calculation (Max upto 56 terms)
clear;
clc;
disp("Fourier Calculation (Max upto 56 terms)")
m = input("Enter no. of Terms: ");
disp(" ")
data = readtable("Deformed_Angles_Linear_Profile.xls");
T = data{1:end, 1}; % Time
B = data{1:end, 2}; % Theta
C = data{1:end, 3}; % Phi
n = length(T);
A = ones(n, m);
for i = 1:n
    for j = 1:m
        % [ t^0, t^1, ...., t^(m-1) ]
        A(i, j) = T(i).^(j-1);
    end
end
[a, MSGID] = lastwarn();
warning('off', MSGID)
FourierThetas = (inv(A'*A))*(A'*B);
FourierPhis = (inv(A'*A))*(A'*C);
FourierAngles = [FourierThetas, FourierPhis];
DeformedAngles = [ T, A*FourierThetas, A*FourierPhis ];
ThetaError = zeros(n,1);
PhiError = zeros(n,1);
for i = 1:n
    ThetaError(i) =  DeformedAngles(i, 2) - FourierThetas(1);
    PhiError(i) = DeformedAngles(i, 3) - FourierPhis(1);
end
% disp(size(PhiError))
% disp(size(DeformedAngles))
DeformedAngles = [ T, A*FourierThetas, A*FourierPhis, ThetaError, PhiError ];
FourierAnglesD = array2table(FourierAngles, 'VariableNames',{'FourierTheta', 'FourierPhi'});
DeformedAnglesD = array2table(DeformedAngles, 'VariableNames',{'Time', 'Theta', 'Phi', 'ThetaError', 'PhiError'});
disp("Deformations With time:")
disp(" ")
disp(DeformedAnglesD(1:3,:))
disp("Ture Values:")
disp("Theta: " + FourierThetas(1))
disp("Phi: " + FourierPhis(1))
disp(" ")
writetable(FourierAnglesD, "Results.xls", 'Sheet', 'Fourier Coefficients')
writetable(DeformedAnglesD, "Results.xls", 'Sheet', 'Fourier Data')
writetable(data, "Results.xls", 'Sheet', 'Original Data')