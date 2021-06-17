% Function to find the Norm of a quaternion
%
% Function Parameters:
% q         - Quaternion whose norm we need to determine
%             4 x 1 Matrix
% 
% Function Output:
% result    - Norm of quaternion q
%             Scalar value

function result = quatNorm(q)
    result = (q(1)^2) + (q(2)^2) + (q(3)^2) + (q(4)^2);
    result = sqrt(result);
end