%% Stability regions of G(s) = 1/sqrt(s^2+1) subjeted to a PD^mu controller
%% Making the command window/workspace beautiful again 
clearvars
close all
clc
%% w equal to 0:
kp0 = -1);
kd0 = 0:0.01:1;

%% w not equal to 0
%for mu = 0.1:0.01:1
mu = 0.5;
w = 0.00001:0.01:5;
kp=(((-1)+w.^2).^2).^(1/4).*((-1).*cos((1/2).*angle(1+(-1).*w.^2))+(w.^2) ...
  .^((1/2).*mu).*((w.^4).^((1/2).*mu)).^(-1/2).*cot(mu.*angle(sqrt(-1).*w) ...
  ).*sin((1/2).*angle(1+(-1).*w.^2)));
kd=(-1).*((w.^4).^((1/2).*mu)).^(-1/2).*(((-1)+w.^2).^2).^(1/4).*csc(mu.* ...
  angle(sqrt(-1).*w)).*sin((1/2).*angle(1+(-1).*w.^2));

%% Plot
plot(kp, kd, 'LineWidth', 2)
hold on
plot(kp0*ones(1, length(kd0)), kd0,'LineWidth', 2)
%% Plot config
set(gcf,'color','w');
box on
xlim([-3 3])
ylim([-5 5])
xlabel('$k_d$', 'FontSize', 18, 'interpreter', 'latex')
ylabel('$k_p$', 'FontSize', 18, 'interpreter', 'latex')
%end
%%
%% Controller gains
[kp,ki]=ginput(1);
%% Closed-loop TF
fig= figure;
set(fig, 'Position',  [661,40,745,716])
set(gcf,'color','w');
t = 0:0.01:1;
for i=1:length(kp)
    y_s = @(s)(kp(i)+kd(i)*s^mu)/((sqrt(s^2+1)*(kp(i)+kd(i)*s^mu)));
    y_t = euler_inversion_sym(y_s,t);
    subplot(length(kp),1,i)
    plot(t, y_t, 'LineWidth', 2);
    xlabel('$t$', 'FontSize', 18, 'interpreter', 'latex')
    ylabel('$y(t)$', 'FontSize', 18, 'interpreter', 'latex')
    legend( sprintf('(k_p,k_d)=(%g,%g)', kp(i),kd(i)) )
end
