function numgrad = computeNumericalGradient(J, params, num_restaurants, num_users, num_features, res_feature_matrix)
%COMPUTENUMERICALGRADIENT Computes the gradient using "finite differences"
%and gives us a numerical estimate of the gradient.
%   numgrad = COMPUTENUMERICALGRADIENT(J, theta) computes the numerical
%   gradient of the function J around theta. Calling y = J(theta) should
%   return the function value at theta.

% Notes: The following code implements numerical gradient checking, and 
%        returns the numerical gradient.It sets numgrad(i) to (a numerical 
%        approximation of) the partial derivative of J with respect to the 
%        i-th input argument, evaluated at theta. (i.e., numgrad(i) should 
%        be the (approximately) the partial derivative of J with respect 
%        to theta(i).)
%                
%theta = reshape(params(num_restaurants*num_features+1:end), num_users, num_features);
numgrad = zeros(size(params));
perturb = zeros(size(params));
e = 1e-4;
i = num_restaurants*size(res_feature_matrix,2);
for p = 1:(num_restaurants*size(res_feature_matrix,2)+num_users*num_features-size(res_feature_matrix,2))
    % Set perturbation vector
    perturb(p+i) = e;
    loss1 = J(params - perturb);
    loss2 = J(params + perturb);
    % Compute Numerical Gradient
    numgrad(p+i) = (loss2 - loss1) / (2*e);
    perturb(p+i) = 0;
end


end
