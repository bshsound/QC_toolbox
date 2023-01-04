% QC_13: Check if data in recording is stationary
% lim defines limit in seconds at start and end of file, that is checked
% for stationarity
% Never forget: strg+a strg+i 

function [flag] = Q13(filedata,filesamplerate,lim)
ind = filesamplerate*lim;
if ind<length(filedata) %Catch, that files can be shorter than 1 minute
    
    x1 = filedata(1:ind);
    x2 = filedata(end-ind:end);
    
    [mean_stat_flag1, var_stat_flag1, cov_stat_flag1] = isstationary(x1);
    [mean_stat_flag2, var_stat_flag2, cov_stat_flag2] = isstationary(x2);
    
    Q13_1 = mean_stat_flag1 + var_stat_flag1 + cov_stat_flag1;
    Q13_2 = mean_stat_flag2 + var_stat_flag2 + cov_stat_flag2;
    
    if Q13_1 >=2 || Q13_2 >=2
        flag = 1;
    else
        flag = 0;
    end
    
else
    
    ind=floor(0.1*length(filedata));
    
    x1 = filedata(1:ind);
    x2 = filedata(end-ind:end);
    
    [mean_stat_flag1, var_stat_flag1, cov_stat_flag1] = isstationary(x1);
    [mean_stat_flag2, var_stat_flag2, cov_stat_flag2] = isstationary(x2);
    
    Q13_1 = mean_stat_flag1 + var_stat_flag1 + cov_stat_flag1;
    Q13_2 = mean_stat_flag2 + var_stat_flag2 + cov_stat_flag2;
    
    if Q13_1 >=2 || Q13_2 >=2
        flag = 1;
    else
        flag = 0;
    end
    
end
end