
% function, that removes QC-prefix from all .wav files in a directory

function [] = removeQCprefix(path) 
flist = dir([path '*.wav']);
for kk = 1:length(flist)
    if isequal(flist(kk).name(1:2),'QC')
        k = strfind(flist(kk).name,'_F_')+2;
        OldName = flist(kk).name(k+1:end);
        movefile([path flist(kk).name],[path OldName]);
    end
end
end