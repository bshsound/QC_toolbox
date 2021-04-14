% Quality Check 03: check whether file was recorded after recovery


function [flag] = Q03(filename,filepath,filetime,DateRecovery)
    if filetime > DateRecovery    
        movefile([filepath filename], [filepath 'NoRealData03_' filename]);
        flag = 1;
    else
        flag = 0;
    end
end