% Function to raise a unit dual quaternion to an exponent tau
%
% Function Parameters:
% d_quat    - Unit Dual Quaternion
%             4 x 2 Matrix
% tau       - Exponent to which we need to raise the dual quaternion to
%             Scalar value of floating type
% 
% Function Output:
% result    - Result of raising the unit dual quaternion to exponent tau
%             4 x 2 Matrix

function result = dualQuatRaisedToPower(d_quat, tau)
    result = zeros(4,2);

    % Normalize to prevent errors due to accuracy limitations
    Ar = d_quat(:,1) / norm(d_quat(:,1));
    
    Ad = d_quat(:,2);
    
    % Check if inputs are valid
    if(~isreal(acos(Ar(1))))
        fprintf("Error in data!");
    end
    
    % Check for unit dual quaternion
    if ((abs(norm(d_quat(:,1)) - 1) > 0.1) && (abs(dot(d_quat(:,1),d_quat(:,2))) > 0.1))
        fprintf("Not a unit dual quaternion");
    end
    
    theta = wrapToPi(2 * acos(Ar(1)));
    
    g = dualQuatToTransformation(d_quat);
    p = g(1:3,4);
    
    if(theta == 0)
        v = Ad(2:4) / norm(Ad);
        d = 2 * norm(Ad);
        
        result(1,1) = cos(tau*theta/2);
        result(2:4,1) = sin(tau*theta/2) * v;
        
        result(1,2) = -(tau*d/2) * sin(tau*theta/2);
        result(2:4,2) = (tau*d/2) * cos(tau*theta/2) * v;
    else
        %u = Ar(2:4) / sin(theta/2);
        u = Ar(2:4) / norm(Ar(2:4));
        d = dot(p,u);
        m = (cross(p,u) + ((p-(d*u)) * cot(theta/2))) / 2;
        
        result(1,1) = cos(tau*theta/2);
        result(2:4,1) = sin(tau*theta/2) * u;

        result(1,2) = -(tau*d/2) * sin(tau*theta/2);
        result(2:4,2) = (sin(tau*theta/2) * m) + (((tau*d*cos(tau*theta/2))/2) * u);
    end

end