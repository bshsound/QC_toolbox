% QC_13: Check if data in recording is stationary
% lim defines limit in seconds at start and end of file, that is checked
% for stationarity

function [flag] = Q13(filedata,filesamplerate,lim)
    ind = filesamplerate*lim;
    x1 = filedata(1:ind);
    x2 = filedata(end-ind:end);
        if all(isstationary(x1)) && all(isstationary(x2))
                flag = 1;
            else
                flag = 0;
        end
end