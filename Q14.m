% Quality Check 14: Check if following files are either twice as loud or
% quiet as the predecessing files

function [flag] = Q14(filestdrms,limit)
    for ii = 1:length(filestdrms)
        if ii==1
            if filestdrms(ii) > limit*filestdrms(ii+1) || filestdrms(ii) < filestdrms(ii+1)/limit
                flag(ii) = 1;
            else
                flag(ii) = 0;
            end
        elseif filestdrms(ii) > limit*filestdrms(ii-1) || filestdrms(ii) < filestdrms(ii-1)/limit
            flag(ii) = 1;
        else
            flag(ii) = 0;
        end
    end
end