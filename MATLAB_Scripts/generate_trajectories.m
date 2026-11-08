%% Shoulder trajectory: 90 -> 210 -> 90 degrees
dt = 0.01;

t_s = [0:dt:3, ...
       3+dt:dt:7, ...
       7+dt:dt:11, ...
       11+dt:dt:14];

q_s = [90*ones(1,length(0:dt:3)), ...
       linspace(90,210,length(3+dt:dt:7)), ...
       linspace(210,90,length(7+dt:dt:11)), ...
       90*ones(1,length(11+dt:dt:14))];

desiredTrajectory = timeseries(q_s',t_s');

%% Elbow trajectory: 0 -> 120 degrees in 15-degree steps
holdTime = 5;
angles = 0:15:120;

t_e = [];
q_e = [];

for i = 1:length(angles)
    t = (i-1)*holdTime:dt:i*holdTime;
    q = angles(i)*ones(size(t));

    if i > 1
        t = t(2:end);
        q = q(2:end);
    end

    t_e = [t_e t];
    q_e = [q_e q];
end

desiredTrajectory_e = timeseries(q_e',t_e');

%% Plot trajectories
figure;

subplot(2,1,1);
plot(t_s,q_s,'LineWidth',1.5);
xlabel('Time (s)');
ylabel('Shoulder angle (deg)');
title('Shoulder Reference Trajectory');
grid on;

subplot(2,1,2);
plot(t_e,q_e,'LineWidth',1.5);
xlabel('Time (s)');
ylabel('Elbow angle (deg)');
title('Elbow Reference Trajectory');
grid on;