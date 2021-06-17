% Function which returns the product of two dual quaternions
%
% Function Parameters:
% a,b       - Dual Quaternions whose product we need to determine
%             4 x 2 Matrices
% 
% Function Output:
% result    - Dual Quaternion product
%             4 x 2 Matrix

function result = dualQuatProduct(a,b)
    result = zeros(4,2);
    result(:,1) = quatProduct(a(:,1),b(:,1));
    result(:,2) = quatProduct(a(:,2),b(:,1)) + quatProduct(a(:,1),b(:,2));
end