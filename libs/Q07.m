% Quality Check 07: check if duration of file is 0.1% shorter than planned
% duration

function [flag] = Q07(filename,filepath,fileduration,planneduration,limit)

        if fileduration <  planneduration * (1-limit)    % too long
%             movefile([filepath filename], [filepath 'NoRealData07_' filename]);
                flag = 1;
            else
                flag = 0;
        end
end