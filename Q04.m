% Quality Check 04: Check if file's samplerate differs from planned sample
% rate

function [flag] = Q04(filename,filepath,filesamplerate,deplsamplerate)

        if filesamplerate ~= deplsamplerate  
            movefile([filepath filename], [filepath 'NoRealData04_' filename]);
                flag = 1;
            else
                flag = 0;
        end
end