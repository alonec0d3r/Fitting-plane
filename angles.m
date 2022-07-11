function [angle] = angles(V1, V2)
    angle = acosd(dot(V1, V2)/norm(V1)*norm(V2));
end

