clc;

p1 = [ 1, 0, -0.219698584 ];
p2 = [ 0, 1, 0.1500305 ];

a = X(1);
b = X(2);
c = -1;

v1 = p2 - p1;
v2 = [a, b, c];

a1 = v1(1);
b1 = v1(2);
c1 = v1(3);
a2 = v2(1);
b2 = v2(2);
c2 = v2(3);

v3 = [ (b1*c2-c1*b2), -1*(a1*c2-a2*c2), (a1*b2-b1*a2) ];

disp("New Coordinate System")
disp("V1: " + mat2str(v1))
disp("V2: " + mat2str(v2))
disp("V3: " + mat2str(v3))

N1 = [1 0 0];
N2 = [0 1 0];
N3 = [0 0 1];

disp("")
disp("dXtheta: " + angles(N1, v1))
disp("dYtheta: " + angles(N2, v2))
disp("dZtheta: " + angles(N3, v3))
