function dgdt = of_equ()

% Formal parameters
syms rx ry th real; % Sensor pose
syms v Psi real;    % Velocity vector
syms gamma real;    % Pixel position
syms phi   real;    % 3D point position

% Pixel coordinate
gamma = atan2(cos(phi) - rx, sin(phi) - ry);

% OF w.r.t. change in position
dgdr = gradient(gamma, [rx, ry])';

% OF w.r.t. time
dgdt = dgdr * v * [cos(Psi); sin(Psi)];

ry = 0; 
dgdt = simplify(subs(dgdt));

% Check the result with general OF equation

r = [rx; ry; 0];
P = [cos(phi); sin(phi); 0] - r;
p = simplify(P / norm(P));
D = simplify(norm(P));
V = v * [cos(Psi); sin(Psi); 0];
dgdt_check = simplify(norm(1 / D * cross(p, cross(V, p))));

% NOTE : I checked the results with Wolfram Alpha, they hold!
% pretty(dgdt)
% pretty(dgdt_check)
