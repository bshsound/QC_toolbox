function clear_import(source,target,sea,station,channel,yy,mm,dd)
    jointdir = [dir([source '*.wav']); dir([source '*.wavx'])];
    %% check if each file is copied correctly (same size) to the Archive
    for ii = 1:length(jointdir)
        %get name of file
        name=jointdir(ii).name;
        y=name(yy:yy+1);
        m=name(mm:mm+1);
        d=name(dd:dd+1);
        %% determine target folder
        tf = [target '\' sea '\' station '\' channel '\' y '\' m '\' d '\'];
        a=dir([source name]).bytes;
        b=dir([tf name]).bytes;
        if ~isequal(a,b)
            E=errordlg(['One or more file was not properly copied to the Archive! \n' name 'does not have the same size in source and target directory.'])
            return
        end
    end
    progressbar
    for ii = 1:length(jointdir)
        delete([source jointdir(ii).name])
        progressbar(ii/length(jointdir))
    end
    %% Write Delete Log File
    startyy=str2num(jointdir(1).name(yy:yy+1)) +2000; 
    startmm=str2num(jointdir(1).name(mm:mm+1));
    startdd=str2num(jointdir(1).name(dd:dd+1));
    path_out = ['X:\Meereskunde\Unterwasserschall\AMSO23\' sea '\' station '\QC\Transferlog\'] ;
    fp = fopen([path_out,'TransferLog_',datestr(start),'.csv'],'a');
    fprintf(fp, '%s\n\n','');
    fprintf(fp, '%s\n','DELETE LOG');
    fprintf(fp, '%s\n',[num2str(length(jointdir)) ' files were deleted for ever from the Import directory.']);
    fclose(fp)
    %% Output, that files are deleted
    disp('Files in source directory were successfully deleted.')
    load train
    sound(y,Fs)
end


           