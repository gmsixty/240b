% Noise plots
data = csvread('./von_t_pnoise4.csv', 1, 0);
f = data(:,1);
von = data(:,2);
vot = sqrt(cumtrapz(f, von));
figure(6)
subplot(2,1,1)
loglog(f, von*1e9);
title('Noise vs Frequency');
ylabel('von [nV/rt-Hz]');
subplot(2,1,2)
loglog(f, vot*1e6);
ylabel('vot [uV]');
xlabel('Frequency [Hz]');
