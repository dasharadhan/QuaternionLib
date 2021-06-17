% Function to find the Conjugate of a quaternion
%
% Function Parameters:
% q         - Quaternion whose conjugate we need to determine
%             4 x 1 Matrix
% 
% Function Output:
% result    - Conjugate of quaternion q
%             4 x 1 Matrix

function result = quatConjugate(q)
    result = q;
    result(2:4) = -result(2:4);
end