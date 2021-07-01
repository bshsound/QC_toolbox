% Quality Check 08: Check if recording suffers from DC-offset :(

function [flag] = Q08(Q2,meanv,limit)
    idx = find(Q2==1, 1, 'last' );
    flag(1:idx) = 1;
    ref = meanv(idx+1);
    lincf = 6.949771570815150e+08;
    for ff=idx+1:length(meanv)
        drift = abs(uPa2dB(abs(ref))-uPa2dB(abs(meanv(ff))));
        if drift > limit
            flag(ff)=1;
        else
            flag(ff)=0;
        end
    end
end
