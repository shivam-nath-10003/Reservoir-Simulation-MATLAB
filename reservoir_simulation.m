% Define parameters in consistent SI units
R = 100;         % Reservoir radius [m] (meters)
L = 1000;        % Reservoir length [m] (meters)
phi = 0.2;       % Porosity
k = 1e-12;       % Permeability [m²] (square meters)
mu = 0.001;      % Viscosity [Pa·s] (Pascal-seconds)
P_well = 100000; % Well pressure [Pa]
P_external = 200000; % External pressure [Pa]
R_well = 10;     % Radius of the well [m] (meters)
R_external = 100; % Radius at the external boundary [m] (meters)

% Define the radial grid
r = linspace(0, R, 100); % 100 grid points from 0 to R

% Calculate the flow rate (Q) using the provided formula
h = L;
Q = (2 * pi * k * h * (P_external - P_well)) / (mu * log(R_external / R_well));

% Initialize arrays for pressure and Darcy velocity
P = zeros(size(r));
u = zeros(size(r));

% Calculate pressure and Darcy velocity at every point in the reservoir
for i = 1:length(r)
    position = r(i);
    P(i) = P_external - (Q * mu * log(R_external / position) / (2 * pi * k * h));
    
    if i > 1
        dP_dr = (P(i-1) - P(i)) / (r(i-1) - r(i)); % Pressure gradient
        u(i) = abs(- (k / mu) * dP_dr / (2 * pi * h));
    end
end

% Plot the pressure distribution from P_well to P_external
figure;
subplot(2, 1, 1); % Create two subplots, first for pressure
plot(r, P, '-o');
xlabel('Distance from Well (m)');
ylabel('Pressure (Pa)');
title('Pressure Distribution in the Reservoir');
xlim([0, R]);
ylim([P_well, P_external]);
grid on;

% Plot the Darcy velocity distribution
subplot(2, 1, 2); % Second subplot for Darcy velocity
plot(r(2:end), u(2:end), '-o'); % Exclude the first point due to gradient calculation
xlabel('Distance from Well (m)');
ylabel('Darcy Velocity (m/s)');
title('Darcy Velocity Distribution in the Reservoir');
xlim([0, R]);
ylim([min(u(2:end)), max(u(2:end))]);
grid on;

% Display the calculated flow rate
fprintf('Flow Rate: %.2f m³/s\n', Q);

% Display the calculated pressure values
disp('Pressure at Intervals (Pa):');
disp([r; P]);

% Display the calculated Darcy velocity values
disp('Darcy Velocity at Intervals (m/s):');
disp([r(2:end); u(2:end)]);
