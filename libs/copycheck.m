function status = copycheck(source,target,sea,station,hydrophone)
%% TODO 
%List aller Duplikate ausgeben
%function checks, if data in Import allready exists in Archive of station

T = ['X:\Meereskunde\Unterwasserschall-Archiv\Data'];
Q=0;
for ii = 9:12
target = [T num2str(ii,'%02.0f')]; 
target = [target '\' sea '\' station '\' hydrophone];
targetfiles = [dir([target '\**\*.wav']); dir([target '\**\*.wavx'])];   
sourcefiles = [dir([source '*.wav']); dir([source '*.wavx'])];
A = ismember({targetfiles(:).name},{sourcefiles(:).name});
% idx = find(A==1);
% B = [B;sourcefiles(idx).name];

Q=Q+sum(A);
end
    if Q==0
        status = 1;
    else
        status =0;
        %% list of duplicates
    end

end