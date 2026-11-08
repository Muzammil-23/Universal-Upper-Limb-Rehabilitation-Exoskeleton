%% Shoulder gravity compensation
shoulderAngleLUT = 90:15:210;

shoulderTorqueLUT = [ ...
    0.0631 2.2069 4.2559 6.1127 7.6766 ...
    8.8433 9.5199 9.5899 8.9738];

%% Elbow gravity compensation
elbowAngleLUT = 0:15:120;

elbowTorqueLUT = [ ...
    0.02352 0.81884 1.5584 2.1917 2.6756 ...
    2.9773 3.0760 2.9651 2.6521];

%% Plot gravity torque curves
figure;

plot(shoulderAngleLUT,shoulderTorqueLUT,'-o','LineWidth',1.5);
hold on;
plot(elbowAngleLUT,elbowTorqueLUT,'-s','LineWidth',1.5);

xlabel('Joint Angle (deg)');
ylabel('Gravity Torque (Nm)');
title('Gravity Compensation Lookup Tables');
legend('Shoulder','Elbow','Location','best');
grid on;