
% function, that adds QC-prefix to all .wav files in a directory

function [] = addQCprefix(QC,path) %appC , app.path

flist = dir([path '*.wav']);
%% Check size
if size(QC,1)~=size(flist,1)
    msg = 'Something went wrong. Number of quality controlled files unequals number of files in path.';
    errordlg(msg)
    return
end

%% Check if prefix was allready added (start with QC?)
for ff=1:length(flist)
    if isequal(flist(ff).name(1:2),'QC')
            msg = 'An error occured. Prefixes have already been added to one or more files in the directory.';
            errordlg(msg)
    return
    end
end

%% add prefixes to all files
for ff=1:length(flist)
    prefix = sprintf('%d', QC(ff,:));
    movefile([path flist(ff).name], [path 'QC_' prefix '_F_' flist(ff).name]);
end
    end