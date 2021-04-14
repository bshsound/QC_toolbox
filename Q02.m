% Quality Check 02: check whether file was recorded before deployment


function [flag] = Q02(filename,filepath,filetime,DateDeployment)
    if filetime < DateDeployment    
        movefile([filepath filename], [filepath 'NoRealData02_' filename]);
        flag = 1;
    else
        flag = 0;
    end
end