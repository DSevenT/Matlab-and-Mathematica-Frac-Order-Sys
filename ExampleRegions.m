%% Stability regions of G(s) = s+1/s^2+sqrt(s+2) subjeted to a PD^mu controller
%% Making the command window/workspace beautiful again 
clear
clc
%% w equal to 0:
kp0 = -sqrt(2);
kd0 = 0:0.01:1;

%% w not equal to 0
%for mu = 0.1:0.01:1
mu = 0.5;
    w = 0.00001:0.01:1;
    kp=(-1).*(w.*((-1).*(w.^2).^((1/2).*mu)+((w.^4).^((1/2).*mu)).^(1/2)).*cos( ...
      mu.*angle(sqrt(-1).*w))+((w.^2).^(1+(1/2).*mu)+((w.^4).^((1/2).*mu)).^( ...
      1/2)).*sin(mu.*angle(sqrt(-1).*w))).^(-1).*((-1).*((w.^4).^((1/2).*mu)) ...
      .^(1/2).*(w.^2+(-1).*(4+w.^2).^(1/4).*cos((1/2).*angle(2+sqrt(-1).*w))) ...
      .*(w.*cos(mu.*angle(sqrt(-1).*w))+sin(mu.*angle(sqrt(-1).*w)))+(w.^2).^( ...
      (1/2).*mu).*(4+w.^2).^(1/4).*sin((1/2).*angle(2+sqrt(-1).*w)).*((-1).* ...
      cos(mu.*angle(sqrt(-1).*w))+w.*sin(mu.*angle(sqrt(-1).*w))));
    kd=((-1).*w.^3+(4+w.^2).^(1/4).*(w.*cos((1/2).*angle(2+sqrt(-1).*w))+(-1).* ...
      sin((1/2).*angle(2+sqrt(-1).*w)))).*(w.*((-1).*(w.^2).^((1/2).*mu)+(( ...
      w.^4).^((1/2).*mu)).^(1/2)).*cos(mu.*angle(sqrt(-1).*w))+((w.^2).^(1+( ...
      1/2).*mu)+((w.^4).^((1/2).*mu)).^(1/2)).*sin(mu.*angle(sqrt(-1).*w))).^( ...
      -1);
    %% Plot
    hold on
    plot(kp, kd, 'LineWidth', 2)
    hold on
    plot(kp0*ones(1, length(kd0)), kd0,'LineWidth', 2)
    %% Plot config
    set(gcf,'color','w');
    box on
    xlabel('$k_d$', 'FontSize', 18, 'interpreter', 'latex')
    ylabel('$k_p$', 'FontSize', 18, 'interpreter', 'latex')
%end