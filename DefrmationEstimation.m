clear;
clc;
m = input("Enter the degree of Resolution: ");
data = readtable("Deformed_Angles_Linear_Profile.xls");
B = data{1:end, 2};
C = data{1:end, 3};
n = length(B);
T = data{1:end, 1}';
A = ones(n, m);
for i = 1:n
    for j = 1:m
        A(i, j) = T(i).^(j-1);
    end
end
Theta = (inv(A'*A))*(A'*B);
Phi = (inv(A'*A))*(A'*C);
FourierAngles = [Theta, Phi];
FourierAngles = array2table(FourierAngles, 'VariableNames',{'Theta', 'Phi'});
disp(FourierAngles)
writetable(FourierAngles, "FourierAngles.xls", 'Sheet', 1')
