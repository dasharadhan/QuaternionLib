% Function to convert a unit dual quaternion to its rigid body transform
% matrix representation
%
% Function Parameters:
% d_quat    - Unit dual quaternion representing rigid body transformation
%             4 x 2 Matrix
% 
% Function Output:
% result    - Rigid body transform matrix representation of d_quat
%             4 x 4 Matrix

function result = dualQuatToTransformation(d_quat)
    Ar = d_quat(:,1);
    Ad = d_quat(:,2);
    
    rot_mat = quatToRot(Ar);
    
    p_quat = 2 * quatProduct(Ad, quatConjugate(Ar));
    p = p_quat(2:4);
    
    result = eye(4);
    result(1:3,1:3) = rot_mat;
    result(1:3,4) = p;
end