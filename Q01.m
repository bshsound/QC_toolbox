function [flag,data,samplerate,duration,totalsamples,standarddeviation,meanvalue] = Q01(filename,filepath)
%
% Quality Check 01: check whether file can be read
%================================================================
% DESCRIPTION
%   Function checks if the audio file (*.wav) can be read and returns a flag (see flag description below).   
%   If file can be read, the output expands with additional parameters for further quality checks. 
%       
%   The function Q01.m is part of the BSH toolbox for quality control of underwater sound measurements.   
%   
% Syntax:
%   [flag,data,samplerate,duration,totalsamples,standarddeviation,meanvalue] = Q01(filename,filepath)
%
%    Input:
%       * filename: filename of data
%       * filepath: filepath of data
%       
%    Output
%       * flag              : flag = 0 (QC test passed, file readable) || flag = 1 (QC test faild, file not readable)
%
%    Additional parameters (generated/read with Matlab functions audioinfo.m & audioread.m) 
%
%       * data              : Audio data from WAVE file (normalized values between -1.0 and 1.0) 
%       * samplerate        : The sample rate (in Hertz) of the data in the file
%       * duration          : Total duration of the audio in the file, in seconds
%       * totalsamples      : Total number of audio samples in the filehe
%       * standarddeviation : Standard deviation of data (std(data))  
%       * meanvalue         : Mean value of data (mean(data))
%
% AUTHOR:   F.Basan, BSH HH, 2021 (fritjof.basan@bsh.de)
%
% DISCLAIMER:
%   This software is provided "as is" without warranty of any kind.
%================================================================
% Modifications
% 21-04-14. J-G. Fischer,  Description added
%

try
            info = audioinfo([filepath filename]);
            data = audioread([filepath filename]);
            samplerate = info.SampleRate;
            duration = info.Duration;
            totalsamples = info.TotalSamples;
            standarddeviation = std(data);
            meanvalue = mean(data);
            flag = 0;
    catch
%             movefile([filepath filename], [filepath 'NoRealData01_' filename]);
            flag = 1;
end
end