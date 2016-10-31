function output = min_jerk(xi, xf)
% Generate a minimum jerk trajectory from xi to xf.
% xi: starting position, 1x3 matrix
% xf: final position, 1x3 matrix
% t: the time vector, Nx1 matrix
% output: the generated trajectory, Nx3 matrix
t = 0:0.01:0.5;
d = t(end);
N = length(t);
a = repmat((xf - xi), N, 1);
b = repmat((10 * (t/d).^3 - 15 * (t/d).^4 + 6 * (t/d).^5)',1,3) ;
output = repmat(xi, N, 1) + a .* b;

end