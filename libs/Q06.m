% Quality Check 06: check if duration of file is 0.1% longer than planned
% duration

function [flag] = Q06(filename,filepath,fileduration,planneduration,limit)

        if fileduration >  planneduration * (1+limit)    % too long
%             movefile([filepath filename], [filepath 'NoRealData06_' filename]);
                flag = 2;
            else
                flag = 0;
        end
end