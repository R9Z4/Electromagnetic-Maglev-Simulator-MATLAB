%% * IN THE NAME OF GOD *
% =========================================================================
% Title: 3D Electromagnetic Train Animation (Using Workspace Data)
% Author: Reza Roodi
% Description: This script renders a 3D animation of the homopolar motor.
%              It does NOT calculate the physics, but rather reads the 
%              'pos' and 'vel' arrays already existing in the base workspace
%              (e.g., exported from the App Designer session).
% =========================================================================

% Keep variables in workspace! Only clear command window and close figures.
clc; close all; 

% --- 0. Data Verification ---
% Check if the required data exists in the workspace
if ~exist('pos', 'var') || ~exist('vel', 'var')
    error('Data not found! Please run the App and ensure data is in the workspace.');
end

% --- 1. Setup 3D Figure ---
figure('Name', '3D Maglev Simulation (App Data)', 'NumberTitle', 'off', ...
       'Position', [100, 100, 950, 550]);

% --- 2. Generate Copper Coil (Stator) ---
% Create a 3D helix based on the maximum position the train reaches
t_coil = 0:0.05:80*pi;
x_coil = t_coil * (max(pos)/max(t_coil)); 
y_coil = 0.04 * sin(t_coil);
z_coil = 0.04 * cos(t_coil);

% Plot the copper coil
plot3(x_coil, y_coil, z_coil, 'Color', [0.8, 0.45, 0.2], 'LineWidth', 2);
hold on;

% --- 3. Generate Train Body (Battery) ---
% Create a 3D cylinder for the battery
[y_c, z_c, x_c] = cylinder(0.025, 30);
x_c = x_c * 0.12; % Scale battery length
h_train = surf(x_c, y_c, z_c, 'FaceColor', [0.6 0.6 0.6], 'EdgeColor', 'none');

% --- 4. Generate Neodymium Magnets ---
% Create two 3D cylinders for the magnets at both ends
[y_m, z_m, x_m] = cylinder(0.028, 30);
x_m = x_m * 0.015; % Scale magnet thickness
h_mag1 = surf(x_m, y_m, z_m, 'FaceColor', [0, 0.8, 0.8], 'EdgeColor', 'none');
h_mag2 = surf(x_m, y_m, z_m, 'FaceColor', [0, 0.8, 0.8], 'EdgeColor', 'none');

% --- 5. Scene Lighting and Camera Setup ---
axis([-0.05, max(pos)+0.15, -0.1, 0.1, -0.1, 0.1]);
xlabel('Position (m)');
ylabel('Y (m)');
zlabel('Z (m)');
grid on;

view(35, 25);               % Set 3D viewing angle
camlight;                   % Add a light source to the camera
lighting gouraud;           % Apply smooth gouraud shading

% --- 6. Live Speed Text ---
h_text = text(0, 0, 0.08, 'Speed: 0.00 m/s', 'FontSize', 12, ...
              'FontWeight', 'bold', 'Color', 'r');

% --- 7. Animation Loop ---
% Iterate through the workspace 'pos' and 'vel' arrays to animate
for i = 1:length(pos)
    cx = pos(i); % Current position
    
    % Update X-coordinates of the 3D surfaces
    set(h_train, 'XData', x_c + cx);
    set(h_mag1, 'XData', x_m + cx - 0.015);
    set(h_mag2, 'XData', x_m + cx + 0.12);
    
    % Update text position and string value
    set(h_text, 'Position', [cx + 0.06, 0, 0.08]);
    set(h_text, 'String', sprintf('Speed: %.2f m/s', vel(i)));
    
    drawnow;       % Force MATLAB to render the graphics frame
    pause(0.015);  % Playback speed control
end
%%  ** created by Reza Roodi **