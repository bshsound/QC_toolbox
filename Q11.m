% Quality Check 11: Check for gaps between recordings

function [flag] = Q11(filename,filepath,filename_bef,filename_aft,duration,interval,limit,index)
if interval ~= 0
    duration = duration + interval;
end
if index == 1
    t = datetime(filename(6:end-4),'InputFormat','yyMMddHHmmss');
    t_after = datetime(filename_aft(6:end-4),'InputFormat','yyMMddHHmmss');
    delta_t_after = abs(t_after-t);
    if delta_t_after > seconds(duration+duration*limit) || delta_t_after < seconds(duration-duration*limit)
%         movefile([filepath filename], [filepath 'NoRealData11_' filename]);
        flag = 1;
    else
        flag = 0;
    end
elseif index == 2
    t = datetime(filename(6:end-4),'InputFormat','yyMMddHHmmss');
    t_bef = datetime(filename_bef(6:end-4),'InputFormat','yyMMddHHmmss');
    delta_t_bef = abs(t-t_bef);
    if delta_t_bef > seconds(duration+duration*limit) || delta_t_bef < seconds(duration-duration*limit)
%         movefile([filepath filename], [filepath 'NoRealData11_' filename]);
        flag = 1;
    else
        flag = 0;
    end
elseif index == 3
        t = datetime(filename(6:end-4),'InputFormat','yyMMddHHmmss');
        t_bef = datetime(filename_bef(6:end-4),'InputFormat','yyMMddHHmmss');
        t_after = datetime(filename_aft(6:end-4),'InputFormat','yyMMddHHmmss');
        delta_t_after = abs(t_after-t);
        delta_t_bef = abs(t-t_bef);
        if delta_t_bef > seconds(duration+duration*limit) || delta_t_after > seconds(duration+duration*limit) || delta_t_bef < seconds(duration-duration*limit) || delta_t_after < seconds(duration-duration*limit)
%             movefile([filepath filename], [filepath 'NoRealData11_' filename]);
            flag = 1;
        else
            flag = 0;
        end
end
end