function [freq_axis, data_vector_fft] = fftanalyse(fft_length, time_vector, sample_time, DataVector)

% fftanalysis
%
% fft from a datavector with overlapping and windowing
% 
% (c) Matthias Wildemann
%
% date: 20.06.2012


% fft_length = Länge der FFT , z.B. 2^13
% time_vector = Zeitvektor, d.h. Zeitachse zu den Daten
% sample_time = Zeit eines Sample (abhängig von fs-sampling frequenz)
% DataVector = Datenvektor


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Split signal a "fft_length" point window with 50% overlapping
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(['Overlapping...']);
window_length   =   fft_length; % 2^15 = 32768
% Choose window_type by uncommenting line
%window_type     =   hanning(window_length)'; % For analysing noise 
window_type     =   flattop(window_length); % For analysing of a calibration signal
    
% Overlapping
overlap = 0.5; % = 50 [%]
%  |...window_length...|...window_length...|...window_length...|
%            |...window_length...|...window_length...|...window_length...|

% Calculate sum of blocks
sum_block = fix(((length(time_vector)/window_length)-overlap)/(1-overlap)); 
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FFT %%%%%%%%%%%%%%%%%%%%%%%%%%    
disp(['FFT...'])
for n = 1:sum_block
    start_block      = ((n-1)*window_length).*(1-overlap);     % calculate start block
    end_block        = start_block + window_length;            % calculate stop block
    data_matrix(n,:) = DataVector(start_block+1:end_block,1); % calculate data matrix after overlapping
    data_matrix(n,:) = data_matrix(n,:).*window_type ;         % multiply Data with window
    % fft window matrix
    
    data_matrix(n,:)            = fft(data_matrix(n,:),window_length);
    data_matrix_fft_betrag(n,:) = sqrt(2)*abs(data_matrix(n,:)./window_length); %(wurzel2 da matlab von abs wertenausgeht)
    % data_matrix_fft_phase(n, :) = angle(data_matrix(n,:));
end
        

data_vector_fft = sum(data_matrix_fft_betrag)./sum_block;
%     data_vector_fft_phase = sum(data_matrix_fft_phase)./sum_block; % radiant
%     data_vector_fft_phase = (data_vector_fft_phase * 180)/pi;      %grad
freq_axis = (1/(length(data_vector_fft)*sample_time))*(0:(length(data_vector_fft)/2-1));
% its only the half
data_vector_fft = data_vector_fft(1:length(freq_axis));


    
    