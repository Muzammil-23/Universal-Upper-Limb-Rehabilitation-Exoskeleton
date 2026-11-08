%% Extract simulation data
t = out.actposition_e.Time;

actual = squeeze(out.actposition_e.Data);
pd     = squeeze(out.pdtorque_e.Data);
total  = squeeze(out.ttl_torque.Data);

desired = interp1( ...
    desiredTrajectory_e.Time, ...
    squeeze(desiredTrajectory_e.Data), ...
    t, 'linear', 'extrap');

%% Calculate tracking performance
error = desired - actual;

rmsError = sqrt(mean(error.^2));
maxError = max(abs(error));
peakTorque = max(abs(total));

fprintf('Elbow RMS tracking error: %.3f deg\n',rmsError);
fprintf('Maximum tracking error: %.3f deg\n',maxError);
fprintf('Peak total torque: %.3f Nm\n',peakTorque);

%% Plot position tracking
figure;
plot(t,desired,'--','LineWidth',1.5);
hold on;
plot(t,actual,'LineWidth',1.5);

xlabel('Time (s)');
ylabel('Elbow Angle (deg)');
title('Elbow Position Tracking');
legend('Desired','Actual','Location','best');
grid on;

%% Plot torque
figure;
plot(t,pd,'LineWidth',1.3);
hold on;
plot(t,total,'LineWidth',1.3);

xlabel('Time (s)');
ylabel('Torque (Nm)');
title('Elbow Controller Torque');
legend('PD Torque','Total Torque','Location','best');
grid on;