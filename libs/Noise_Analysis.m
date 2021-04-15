%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Noise Analysis with MATLAB Implementation    %
%                                                %
% Author: Ph.D. Eng. Hristo Zhivomirov  06/19/19 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear, clc, close all

%% get a section of the sound file
[x, fs] = audioread('waterfall.wav');	% load an audio file
x = x(:, 1);                            % get the first channel
N = length(x);                          % signal length
t = (0:N-1)/fs;                         % time vector

%% detrend the signal
% organize question dialog menu about the detrending
quest = 'Do you want to detrend the signal?';
dlgtitle = 'Detrending';
btn1 = 'Yes, detrend the signal';
btn2 = 'No, do not detrend the signal';
defbtn = btn1;
answer = questdlg(quest, dlgtitle, btn1, btn2, defbtn);

% normalize the signal
switch answer
    case btn1
    % detrend the signal    
    x = detrend(x);                             
    case btn2
    % do not detrend the signal
end

%% normalize the signal
% organize question dialog menu about the normalization
quest = 'What type of normalization do you want?';
dlgtitle = 'Normalization';
btn1 = 'Normalize the signal to unity peak';
btn2 = 'Normalize the signal to unity RMS-value';
btn3 = 'Do not normalize the signal';
defbtn = btn1;
answer = questdlg(quest, dlgtitle, btn1, btn2, btn3, defbtn);

% normalize the signal
switch answer
    case btn1
    % normalize to unity peak
    x = x/max(abs(x));
    case btn2
    % normalize to unity RMS-value
    x = x/std(x); 
    case btn3
    % do not normalize the signal
end

%% plot the signal oscillogram
figure(1)
plot(t, x, 'r')
xlim([0 max(t)])
ylim([-1.1*max(abs(x)) 1.1*max(abs(x))])
grid minor
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Time, s')
ylabel('Amplitude, V')
title('Oscillogram of the noise signal') 

%% plot the signal periodogram
% calculate the noise PSD
% (via Welch's periodogram)
winlen = round(N/100);
win = blackman(winlen, 'periodic');
hop = round(winlen/4);
nfft = round(2*winlen);
[PSD, f] = pwelch(x, win, winlen-hop, nfft, fs, 'onesided', 'psd');
PSD = 10*log10(PSD);

% plot the periodogram
figure(2)
semilogx(f, PSD, 'r', 'LineWidth', 1.5)
grid minor
xlim([100 10000])
ylim([-120 0])
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Frequency, Hz')
ylabel('Magnitude, dBV^{2}/Hz')
title('Power Spectral Density of the noise signal')

%% plot the signal spectrogram
% time-frequency analysis
[~, F, T, STPSD] = spectrogram(x, win, winlen-hop, nfft, fs, 'psd');
STPSD = 10*log10(STPSD);

figure(3)
surf(T, F, STPSD)
shading interp
axis tight
box on
view(0, 90)
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Time, s')
ylabel('Frequency, Hz')
title('Spectrogram of the signal')

[~, cmax] = caxis;
caxis([max(-120, cmax-90), cmax])

hClbr = colorbar;
set(hClbr, 'FontName', 'Times New Roman', 'FontSize', 14)
ylabel(hClbr, 'Magnitude, dBV^2/Hz')

%% plot the signal histogram
figure(4)
hHist = histogram(x, round(sqrt(N/10)), 'FaceColor', 'r');
xlim([-1.1*max(abs(x)) 1.1*max(abs(x))])
ylim([0 1.1*max(get(hHist, 'Values'))])
grid minor
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Amplitude, V')
ylabel('Number of samples')
title('Histogram of the noise signal')

%% autocorrelation function estimation
[Rx, lags] = xcorr(x, 'coeff');
tau = lags/fs;

% plot the autocorrelation
figure(5)
plot(tau, Rx, 'r')
grid minor
xlim([-max(tau) max(tau)])
ylim([1.1*min(Rx), 1.1])
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Delay, s')
ylabel('Autocorrelation coefficient')
title('Correlogram of the noise signal')
line([-max(abs(tau)) max(abs(tau))], [0.05 0.05],...
     'Color', 'k', 'LineWidth', 1.5, 'LineStyle', '--')
legend('noise correlogram', '5 % level')

%% signal stationarity estimation test
if all(isstationary(x))
    disp('According the stationarity estimation test the time series is stationary.')
else
    disp('According the stationarity estimation test the time series is non-stationary.')
end

%% signal statistics
% compute and display the minimum and maximum values
maxval = max(x);
minval = min(x);
disp(['Max value = ' num2str(maxval)])
disp(['Min value = ' num2str(minval)])
 
% compute and display the the DC and RMS values
u = mean(x);
s = std(x);
disp(['Mean value = ' num2str(u)])
disp(['RMS value = ' num2str(s)])

% compute and display the skewness and kurtosis
disp(['Skewness value = ' num2str(skewness(x))])
disp(['Kurtosis value = ' num2str(kurtosis(x))])

% compute and display the dynamic range
DR = 20*log10(max(abs(x))/min(abs(nonzeros(x))));
disp(['Dynamic range DR = ' num2str(DR) ' dB'])

% compute and display the crest factor
CF = 20*log10(max(abs(x))/s);
disp(['Crest factor CF = ' num2str(CF) ' dB'])

% compute and display the autocorrelation time
ind = find(Rx>0.05, 1, 'last');
RT = (ind-N)/fs;
disp(['Signal duration = ' num2str(max(t)) ' s'])
disp(['Autocorrelation time = ' num2str(RT) ' s'])

commandwindow