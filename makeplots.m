% DC vout vs vin
figure(1);
vo = cds_srr('hw4q2.raw', 'dc1-dc', 'vo');
cds_plotsig(vo);
title('Vout vs Vin DC Analysis');
xlabel('Vin (V)');
ylabel('Vout (V)');

% AC plots 
figure(2);
voac = cds_srr('hw4q2.raw', 'ac1-ac', 'vo');
cds_plotsig(voac, '', 'freq', 'db20');
set(gca, 'xscale', 'log');
title('Magnitude Frequency Response')
xlabel('Frequency (Hz)');
ylabel('Voltage Gain (dB)');

% GM vs vin plot
figure(3);
gm_plot = cds_srr('hw4q2.raw', 'dc1-dc', 'm1:gm');
cds_plotsig(gm_plot);
title('gm vs Vin')
xlabel('Vin (V)');
ylabel('gm (S)');

% Id vs vin plot
figure(4);
id_plot = cds_srr('hw4q2.raw', 'dc1-dc', 'm1:id');
cds_plotsig(id_plot);
title('Id vs Vin')
xlabel('Vin (V)');
ylabel('Id (A)');

% gm/Id vs vin plot
figure(5);
gm_id_plot = cds_srr('hw4q2.raw', 'dc1-dc', 'm1:gmoverid');
cds_plotsig(gm_id_plot);
title('gm/Id vs Vin')
xlabel('Vin (V)');
ylabel('gm/Id (S/A)');

% Noise plots
out = cds_srr('hw4q2.raw', 'noise1-noise', 'out');
von = out.V_sqrt_Hz_;
f = out.freq;
vot = sqrt(cumtrapz(f, von.^2));
figure(6)
subplot(2,1,1)
loglog(f, von*1e9);
title('Noise vs Frequency');
ylabel('von [nV/rt-Hz]');
subplot(2,1,2)
loglog(f, vot*1e6);
ylabel('vot [uV]');
xlabel('Frequency [Hz]');
