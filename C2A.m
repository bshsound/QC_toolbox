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

function [] = C2A(sea,station,hydno,source,target,yy,mm,dd)
%5,7,9
%% write .ps1 script in Matlab
fileID = fopen('temp.ps1','w');
fprintf(fileID,['$Meer = "',sea, '/" \n']);
fprintf(fileID,['$Station = "', station , '/" \n']);
fprintf(fileID,['$Hydrophon = "', hydno , '/" \n']);
fprintf(fileID,['$Ort = "', source , '/" \n']);
fprintf(fileID,['$Ziel = "', target ,'/" \n']);
fprintf(fileID,'cd $Ort \n');

fprintf(fileID,'$items = Get-ChildItem *.wav \n');
fprintf(fileID,'foreach ($item in $items) \n');
fprintf(fileID,'{ \n');
       fprintf(fileID,'Write-Host $item.Name \n');
       fprintf(fileID,'if($item.Name.StartsWith("NoRealData")){ \n');
            fprintf(fileID,'#Write-Host("No Real Data") \n');
            fprintf(fileID,['$monat = $item.Name.Substring(',mm+12,',2)	 \n']);
            fprintf(fileID,'#Write-Host($monat) \n');
            fprintf(fileID,['$tag = $item.Name.Substring(',dd+12,',2) \n']);
            fprintf(fileID,'#Write-Host($tag) \n');
            fprintf(fileID,['$jahr = $item.Name.Substring(',yy+12,',2) \n']);
            fprintf(fileID,'#Write-Host($jahr) \n');
            fprintf(fileID,'$Datei = $Ort + $item.Name \n');
            fprintf(fileID,'$Zielordner = $Ziel + $Meer + $Station + $Hydrophon + "20" + $jahr + "/" + $monat + "/" + $tag + "/" \n');
            fprintf(fileID,'Write-Host($Zielordner) \n');
            fprintf(fileID,'#if (!(Test-Path -path $Zielordner)) {New-Item $Zielordner -Type Directory} \n');
            fprintf(fileID,'#Copy-item $Datei -Destination $Zielordner -Recurse -Force -Verbose \n');
       fprintf(fileID,'}else { \n');
            fprintf(fileID,'Write-Host("Real Data") \n');
            fprintf(fileID,['$monat = $item.Name.Substring(',mm,',2)	 \n']);
            fprintf(fileID,['$tag = $item.Name.Substring(',dd,',2) \n']);
            fprintf(fileID,['$jahr = $item.Name.Substring(',yy,',2) \n']);
            fprintf(fileID,'$Datei = $Ort + $item.Name \n');
            fprintf(fileID,'$Zielordner = $Ziel + $Meer + $Station + $Hydrophon + "20" + $jahr + "/" + $monat + "/" + $tag + "/" \n');
            fprintf(fileID,'Write-Host($Zielordner) \n');
            fprintf(fileID,'#if (!(Test-Path -path $Zielordner)) {New-Item $Zielordner -Type Directory} \n');
            fprintf(fileID,'#Copy-item $Datei -Destination $Zielordner -Recurse -Force -Verbose \n');
       fprintf(fileID,'}     \n');
fprintf(fileID,'}  \n');

fclose(fileID);


%% executes powershell script
! Powershell.exe -executionpolicy remotesigned -File  X:\Meereskunde\Unterwasserschall\HDF5_Testdaten_Skripte\Skripte\PowerShellScripte\Soundtrap2UWS_Archiv.ps1
end
%% delete powershell script
% f=dir('*.ps1')
% delete(f.name)