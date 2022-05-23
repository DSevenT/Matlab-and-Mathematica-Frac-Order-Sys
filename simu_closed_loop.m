%% Simulation of fractional system in closed-loop with a PDmu controller
%% Making the command window/workspace beautiful again 
clear
clc
%% Controller gains
kp =  0.5;
kd = -1.45;
mu = 0.65;
%% Closed-loop TF
y_s = @(s)(s+1)/(s*(s^2+sqrt(s+2)+(s+1)*(kp+kd*s^mu)));
%% Time
t = 0:0.01:100;
%% Inverse LT
y_t = euler_inversion(y_s,t);
%% Plot
plot(t, y_t, 'LineWidth', 2)