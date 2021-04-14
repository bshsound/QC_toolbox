% Quality Check 01: check whether file can be read


function [flag,data,samplerate,duration,totalsamples,standarddeviation,meanvalue] = Q01(filename,filepath)
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
            movefile([filepath filename], [filepath 'NoRealData01_' filename]);
            flag = 1;
end
end