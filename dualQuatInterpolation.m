% Function which interpolates between two unit dual quaternions
%
% Function Parameters:
% d_quat_i  - Initial dual quaternion
%             4 x 2 Matrix
% d_quat_f  - Final dual quaternion
%             4 x 2 Matrix
% t         - Interpolation parameter
%             Scalar which can take values in the range [0,1]
%
% Function Output:
% result    - Interpolated dual quaternion
%             4 x 2 Matrix

function result = dualQuatInterpolation(d_quat_i, d_quat_f, t)
    d_quat_i_conj = dualQuatConjugate(d_quat_i);
    d_quat_prod = dualQuatProduct(d_quat_i_conj, d_quat_f);
    d_quat_pow = dualQuatRaisedToPower(d_quat_prod, t);
    result = dualQuatProduct(d_quat_i, d_quat_pow);
end