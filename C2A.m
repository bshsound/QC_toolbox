%% new function to call powershell script, that copies all relevant files
% to Unterwasserschall-Archiv
% all spurious files (QC1-QC13) are getting flagged and are stored in a
% yearly directory
% sea = 'NORDSEE'
% station = 'ES1'
% hydno = 'H1'
% source = 'X:/Meereskunde/Unterwasserschall-Archiv/Import02/ES1_201909_202001/'
% target = 'X:/Meereskunde/Unterwasserschall-Archiv/Data10/'
% yy = '5'
% mm='7'
% dd='9'

function [TL] = C2A(sea,station,hydno,source,target,yy,mm,dd)
tic
%% write .ps1 script in Matlab
source(source=='\')='/';
target(target=='\')='/';
fileID = fopen('temp.ps1','w');
fprintf(fileID,['$Meer = "',sea, '/" \n']);
fprintf(fileID,['$Station = "', station , '/" \n']);
fprintf(fileID,['$Hydrophon = "', hydno , '/" \n']);
fprintf(fileID,['$Ort = "', source , '" \n']);
fprintf(fileID,['$Ziel = "', target ,'/" \n']);
fprintf(fileID,'cd $Ort \n');

fprintf(fileID,"$items = Get-ChildItem ('*.wav','*.wavx') \n");
fprintf(fileID,'foreach ($item in $items) \n');
fprintf(fileID,'{ \n');
       fprintf(fileID,'Write-Host $item.Name \n');
%        fprintf(fileID,'if($item.Name.StartsWith("NoRealData")){ \n');
%             fprintf(fileID,'#Write-Host("No Real Data") \n');
%             fprintf(fileID,['$monat = $item.Name.Substring(',mm+12,',2)	 \n']);
%             fprintf(fileID,'#Write-Host($monat) \n');
%             fprintf(fileID,['$tag = $item.Name.Substring(',dd+12,',2) \n']);
%             fprintf(fileID,'#Write-Host($tag) \n');
%             fprintf(fileID,['$jahr = $item.Name.Substring(',yy+12,',2) \n']);
%             fprintf(fileID,'#Write-Host($jahr) \n');
%             fprintf(fileID,'$Datei = $Ort + $item.Name \n');
%             fprintf(fileID,'$Zielordner = $Ziel + $Meer + $Station + $Hydrophon + "20" + $jahr + "/" + $monat + "/" + $tag + "/" \n');
%             fprintf(fileID,'Write-Host($Zielordner) \n');
%             fprintf(fileID,'#if (!(Test-Path -path $Zielordner)) {New-Item $Zielordner -Type Directory} \n');
%             fprintf(fileID,'#Copy-item $Datei -Destination $Zielordner -Recurse -Force -Verbose \n');
%        fprintf(fileID,'}else { \n');
%             fprintf(fileID,'Write-Host("Real Data") \n');
            fprintf(fileID,['$monat = $item.Name.Substring(',num2str(mm-1),',2)	 \n']);
            fprintf(fileID,['$tag = $item.Name.Substring(',num2str(dd-1),',2) \n']);
            fprintf(fileID,['$jahr = $item.Name.Substring(',num2str(yy-1),',2) \n']);
            fprintf(fileID,'$Datei = $Ort + $item.Name \n');
            fprintf(fileID,'$Zielordner = $Ziel + $Meer + $Station + $Hydrophon + "20" + $jahr + "/" + $monat + "/" + $tag + "/" \n');
            fprintf(fileID,'Write-Host($Zielordner) \n');
            fprintf(fileID,'if (!(Test-Path -path $Zielordner)) {New-Item $Zielordner -Type Directory} \n');
            fprintf(fileID,'Copy-item $Datei -Destination $Zielordner -Recurse -Force -Verbose \n');
fprintf(fileID,'}  \n');

fclose(fileID);


%% executes powershell script
! Powershell.exe -executionpolicy remotesigned -File  temp.ps1

%% delete powershell script
f=dir('*.ps1')
delete(f.name)
T=toc;


%% Transferlog
T = duration(0,0,T);
jointdir = [dir([source '*.wav']); dir([source '*.wavx'])]; 
startyy=str2num(jointdir(1).name(yy:yy+1)) +2000; 
startmm=str2num(jointdir(1).name(mm:mm+1));
startdd=str2num(jointdir(1).name(dd:dd+1));
endyy=str2num(jointdir(end).name(yy:yy+1))+2000; 
endmm=str2num(jointdir(end).name(mm:mm+1));
enddd=str2num(jointdir(end).name(dd:dd+1));
start = datetime(startyy,startmm,startdd);
ende = datetime(endyy,endmm,enddd);

path_out = ['X:\Meereskunde\Unterwasserschall\AMSO23\' sea '\' station '\QC\Transferlog\'] ;
fp = fopen([path_out,'TransferLog_',datestr(start),'.csv'],'w');
fprintf(fp, '%s\n','Transfer Logfile');
fprintf(fp, '%s\n',['Transfer ended on ' datestr(datetime(now,'ConvertFrom','datenum')) ' UTC!']);
fprintf(fp, '%s\n',['A total of ', num2str(length(jointdir)),' files were transferred!']);
fprintf(fp, '%s\n',['From these files ' num2str(length(dir([source '*.wavx']))) ' were flagged as corrupted.']);
fprintf(fp, '%s\n',['The transfer process took ', datestr(T,13)]);
fprintf(fp, '%s\n',['Files were copied from ' source ' to ' target '.']);
fprintf(fp, '%s\n',['Transferred files cover the period from ' datestr(start) ' to ' datestr(ende)]);
fclose(fp)
TL = [path_out,'TransferLog_',datestr(start),'.csv'];
end





