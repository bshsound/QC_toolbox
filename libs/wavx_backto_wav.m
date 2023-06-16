%% Rename all .wavx to wav

function [] = wavx_backto_wav(path) 

flist = dir([path '*.wavx']);
for kk = 1:length(flist)
oldname = flist(kk).name;
strfind(oldname,'.');
newname = [oldname(1:16) '.wav'];
movefile([path flist(kk).name],[path newname]);
end
end