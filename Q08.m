% Quality Check 08: Check if recording suffers from DC-offset :(

function [flag] = Q08(filename,filepath,meanvalue,limit)

        if abs(meanvalue) > limit  
            movefile([filepath filename], [filepath 'NoRealData08_' filename]);
                flag = 1;
            else
                flag = 0;
        end
end