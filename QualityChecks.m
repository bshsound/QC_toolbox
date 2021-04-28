%% Function, that comprises all quality checks
function [QC,duration,meanv,sr,stdrms,ts,ftime] = QualityChecks(path_in,depl,recov,filedur,interval)
%% add libs
addpath('./libs/')
tic
%% Scan for all .wav files in path_in_in
flist = dir([path_in '*.wav']);

%% initialize variables
Q_01(1:length(flist)) = NaN; % cannot read file
Q_02(1:length(flist)) = NaN; % before deployment
Q_03(1:length(flist)) = NaN; % after recovery
Q_04(1:length(flist)) = NaN; % samplerate differs from other recordings
Q_05(1:length(flist)) = NaN; % too much clipping
Q_06(1:length(flist)) = NaN; % file length longer than other recordings (>1%)
Q_07(1:length(flist)) = NaN; % file length shorter than other recordings (>1%)
Q_08(1:length(flist)) = NaN; % DC-Offset
Q_09(1:length(flist)) = NaN; % filesize differs from other recordings
Q_10(1:length(flist)) = NaN; % rms differs from other recordings
Q_11(1:length(flist)) = NaN; % gap between recordings
Q_12(1:length(flist)) = NaN; % time in filename not plausible
Q_13(1:length(flist)) = NaN; % check if data is stationary
Q_14(1:length(flist)) = NaN; % all is good
sr(1:length(flist))=NaN;
duration(1:length(flist))=NaN;
ts(1:length(flist))=NaN;
stdrms(1:length(flist))=NaN;
meanv(1:length(flist))=NaN;
ftime(1:length(flist))=NaT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Performance of Quality Checks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Get sample rate from first file
filesr = audioinfo([path_in flist(1).name]).SampleRate;

%% Get duration from first file
if filedur == 0;
    filedur = audioinfo([path_in flist(1).name]).Duration;
end

% Get file size from first file
filesize = flist(1).bytes;

progressbar
for kk = 1:length(flist)
    
    %% read timestamp from filename
    ftime(kk) = datetime(flist(kk).name(6:end-4),'InputFormat','yyMMddHHmmss');
    
    %% QC_01: Check if .wav file can be read by Matlab (audioread)
    
    % data and info from file are loaded into workspace
%     [Q_01(kk),~,~,~,~,~,~] = Q01(flist(kk).name,path_in);
    [Q_01(kk),data,sr(kk),duration(kk),ts(kk),stdrms(kk),meanv(kk)] = Q01(flist(kk).name,path_in);

    % if file not readable go to next file - no need for further QCs
    if Q_01(kk) == 0
        
    %% QC_02: Check if recording is before deployment
    Q_02(kk) = Q02(flist(kk).name,path_in,ftime(kk),depl);
    
    %% QC_03: Check if recording is after recovery
    Q_03(kk) = Q03(flist(kk).name,path_in,ftime(kk),recov);
    
    %% QC_04: Check if sample rate stays constant
    Q_04(kk) = Q04(flist(kk).name,path_in,sr(kk),filesr);
    
    %% QC_05: Check if more than 0.1% of the data are clipped
    Q_05(kk) = Q05(flist(kk).name,path_in,data,0.1);
    
    %% QC_06: Check if duration is longer than - is performed after loop
    Q_06(kk) = Q06(flist(kk).name,path_in,duration(kk),filedur,0.01);
    
    %% QC_07: Check if duration is shorter - is performed after loop
    Q_07(kk) = Q07(flist(kk).name,path_in,duration(kk),filedur,0.01);
    
    %% QC_08: Check if recording suffers from DC-offset :(
    Q_08(kk) = Q08(flist(kk).name,path_in,meanv(kk),0.01);
    
    %% QC_09: Check if file size differs from size of first file
    Q_09(kk) = Q09(flist(kk).name,path_in,flist(kk).bytes,filesize,1);
    
    %% QC_10: Check if rms differs significantly in recordings - plot - limits
    
    %% QC_11: Check for gap between recordings
    if kk==1
        Q_11(kk) = Q11(flist(kk).name,path_in,[],flist(kk+1).name,filedur,interval,0.01,1);
    elseif kk==length(flist)
        Q_11(kk) = Q11(flist(kk).name,path_in,flist(kk-1).name,[],filedur,interval,0.01,2);
    else
        Q_11(kk) = Q11(flist(kk).name,path_in,flist(kk-1).name,flist(kk+1).name,filedur,interval,0.01,3);
    end
    
    %% QC_12: Check if time in filename is plausible
    Q_12(kk) = Q12(flist(kk).name);
    
    %% QC_13: Check if data is stationary
    Q_13(kk) = Q13(data,sr(kk),60);
    
    %% QC_14: Check if everything is okay is performed after QC_10 and is 
    % therefore outside the loop 
    clear data
    
    else
        Q_02(kk)=0;Q_03(kk)=0;Q_04(kk)=0;Q_05(kk)=0;Q_06(kk)=0;Q_07(kk)=0; ...
            Q_08(kk)=0;Q_09(kk)=0;Q_10(kk)=0;Q_11(kk)=0;Q_12(kk)=0;Q_13(kk)=0;
    end
    progressbar(kk/length(flist))
end
    %% QC_10: Check if rms differs significantly in recordings - plot - limits
    Q_10 = Q10(stdrms,2);
    
    %% QC_14: Check if everything is okay is performed after QC_10 and is 
    Q_14 = Q14([Q_01;Q_02;Q_03;Q_04;Q_05;Q_06;Q_07;Q_08;Q_09;Q_10;Q_11;Q_12;Q_13]')
 
%% Check if no NaNs remain in QC Matrix    
QC = [Q_01;Q_02;Q_03;Q_04;Q_05;Q_06;Q_07;Q_08;Q_09;Q_10;Q_11;Q_12;Q_13;Q_14]'

end