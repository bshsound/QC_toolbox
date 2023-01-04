% Quality Check 05: check whether more than 0.1% of the data is clipped


function [flag] = Q05(filename,filepath,filedata,cliplimit)
    ClippedSamples = find(abs(filedata) == 1);
    ProcClippedSamples = length(ClippedSamples) / length(filedata) * 100;
        if ProcClippedSamples > cliplimit
%                 movefile([filepath filename], [filepath 'NoRealData05_' filename]);
                flag = 1;
            else
                flag = 0;
        end
end