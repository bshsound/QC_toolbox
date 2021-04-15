% QC_12: Check if time in filename is plausible
% time must not be in the future and not before 1st of December 2013

function [flag] = Q12(filename,filepath)
    t = datetime(filename(6:end-4),'InputFormat','yyMMddHHmmss');
    past = datetime('131201000000','InputFormat','yyMMddHHmmss');
    future = datetime(now,'ConvertFrom','datenum');
        if t < past || t > future    
%             movefile([filepath filename], [filepath 'NoRealData12_' filename]);
                flag = 1;
            else
                flag = 0;
        end
end