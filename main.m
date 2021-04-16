%% new main script

clear all
close all
%%
tic

%% INPUT
%% set path in
path = 'X:\Meereskunde\Unterwasserschall-Archiv\Import02\TEST\';
%% set path out
qc_path = 'X:\Meereskunde\Unterwasserschall\AMSO23\NORDSEE\ES1\QC\Test\';
% station name
station = 'ES1';
% Date Deployment 
DateDeployment = datetime('2019_09_17_11_00_00','InputFormat','yyyy_MM_dd_HH_mm_ss');
% Date Recovery
DateRecovery = datetime('2020_01_20_12_00_00','InputFormat','yyyy_MM_dd_HH_mm_ss');
% File Durationfrom first file (0) or input (1)
filedur = 1;
if filedur == 1 %% wenn etwas eingegeben ist
    filedur = 10800;
end
% Duty Cycle ? 1 wenn ja, 0 wenn keiner
DutyCycle = 0; 

if DutyCycle == 1
    prompt = 'Es wird alle ... Minuten gemessen ?';
    DutyCycleAbstand = minutes(input(prompt));
    prompt = 'Eine Aufnahme dauert ... Minuten ?';
    DutyCycleDauer = minutes(input(prompt));
end

%% CALCULATE QCs
[QC,duration,meanv,sr,stdrms,ts,ftime] = QualityChecks(path,DateDeployment,DateRecovery,filedur);

%% OUTPUT OF QC-LOG TO PDF
qc2pdf(QC,duration,meanv,sr,stdrms,ts,ftime,path,qc_path,station,DateDeployment)

toc