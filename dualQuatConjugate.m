% Function to find the Conjugate of a dual quaternion
%
% Function Parameters:
% d_quat    - Dual Quaternion whose conjugate we need to determine
%             4 x 2 Matrix
% 
% Function Output:
% result    - Conjugate of Dual Quaternion q
%             4 x 2 Matrix

function result = dualQuatConjugate(d_quat)
    result = d_quat;
    result(2:4,:) = -result(2:4,:);
end