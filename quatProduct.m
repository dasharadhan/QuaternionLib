% Function which returns the product of two quaternions
%
% Function Parameters:
% q,p       - Quaternions whose product we need to determine
%             4 x 1 Matrices
% 
% Function Output:
% result    - Quaternion product
%             4 x 1 Matrix

function result = quatProduct(q,p)
    result = zeros(4,1);
    
    result(1) = (q(1)*p(1)) - dot(q(2:4),p(2:4));
    result(2:4) = q(1)*p(2:4) + p(1)*q(2:4) + cross(q(2:4),p(2:4));
end