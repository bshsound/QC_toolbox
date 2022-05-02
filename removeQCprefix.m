
% function, that renames all wavs to BSH standard

function [] = umbenenner(path,Jahr,Monat,Tag,Stunde,Minute,Sekunde,station) 
flist = dir([path '*.wav']);
for kk = 1:length(flist)
oldname = flist(kk).name;
newname = [station '_' oldname(Jahr:Jahr+1) oldname(Monat:Monat+1) oldname(Tag:Tag+1) oldname(Stunde:Stunde+1) oldname(Minute:Minute+1) oldname(Sekunde:Sekunde+1) '.wav'];
movefile([path flist(kk).name],[path newname]);
end
end