%% function to cut leading and trailing seconds from .wav files and rewrite the .wav files
function cutsec(progbar, path, filelist, copypath, leadsecs, trailsecs)
%% loop over all files and cut first two seconds
for ii = 1:length(filelist)
    filename = filelist(ii).name;
    [y,fs] = audioread([path filename]);
    % leading seconds
    if leadsecs ~= 0
        y(1:leadsecs*fs) = []; %% this deletes the matrix elements corresponding to the index range 1:x*fs
    end
    % trailing seconds
    if trailsecs ~= 0 
        y(end-trailsecs*fs:end) = []; %% this deletes the matrix elements corresponding to the index rangeend-trailsecs*fs:end
    end
    % adapt filename - this is necessary because the datetime is usually
    % determined from the filename; name has to be converted to standard at
    % that point e.g. 'XXX_220301110000.wav' - need to add leadsec to
    % filename in order to arrive at correct timestamps
    oldtime = datetime(filename(5:end-4),'InputFormat','yyMMddHHmmSS');
    newtime = datestr([oldtime + seconds(leadsecs)],'yymmddHHMMss');
    if leadsecs ~= 0
        newfilename = [filename(1:4) newtime '.wav'];
    else
        newfilename = filename;
    end
    %write new file
    audiowrite([copypath '\' newfilename], y,fs); 
    progbar.Value = progbar.Value + 1/length(filelist);
end
end
