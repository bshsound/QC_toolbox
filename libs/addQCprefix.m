
% function, that adds QC-prefix to all .wav files in a directory

function [] = addQCprefix(QC,path) %appC , app.path

flist = dir([path '*.wav']);
%% Check size
if size(QC,1)~=size(flist,1)
    msg = 'Something went wrong. Number of quality controlled files unequals number of files in path.';
    errordlg(msg)
    return
end

%% Check if allready flagged 
for ff=1:length(flist)
    if isequal(flist(ff).name(end),'x')
            msg = 'An error occured. One or more files in the directory have already been flagged.';
            errordlg(msg)
    return
    end
end

%% sort out
for ff=1:length(flist)
%     prefix = sprintf('%d', QC(ff,:)); % old version with 14 indices for
%     quality flags
    if QC(ff,14)==0
%     movefile([path flist(ff).name], [path 'QC_' prefix '_F_' flist(ff).name]);
    movefile([path flist(ff).name], [path flist(ff).name 'x']);
    end
end
    end