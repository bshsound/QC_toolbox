%% Soundtrap QC to pdf

% std plot je Datei mit min(betr�ge) und max(betr�ge)
% Test einbauen - �nderung von std
% Zusammenfassungstabelle als bar-plot
% mehrere Qualityflags - Tabelle nicht in der Schleife
% todo f�r Duty Cycle anpassen
% Differenz (Zeit aus Datei-Namen (1h, 3h,...)) pr�fen; Gibt es L�cken oder
% wurde vollst�ndig im entsperechenden Intervall durchgemessen?
% todo nicht chronologisch checken
clear all
close all
addpath('X:\Meereskunde\Unterwasserschall\HDF5_Testdaten_Skripte\Skripte\Matlabskripte\R2L');
addpath('X:\Meereskunde\Unterwasserschall\HDF5_Testdaten_Skripte\Skripte\Matlabskripte\QC_toolbox');
addpath('./libs/')
%%
tic
%% Eingabe 
% alle .wav Dateien m�ssen in einem Ordner liegen
path = 'X:\Meereskunde\Unterwasserschall-Archiv\Import02\TEST\';
% Welche Station ?
Station = 'ES1';
% Welches (Ausbringungs-) Jahr ?
Jahr = '2019';
% Welcher (Ausbringungs-) Monat ?
Monat = '09';
% Date Deployment 
DateDeployment = datetime('2019_09_17_11_00_00','InputFormat','yyyy_MM_dd_HH_mm_ss');
% Date Recovery
DateRecovery = datetime('2020_01_20_12_00_00','InputFormat','yyyy_MM_dd_HH_mm_ss');
% File Durationfrom first file (0) or input (1)
filedur_inp = 1;
if filedur_inp == 1
    filedur = 10800;
end
% Duty Cycle ? 1 wenn ja, 0 wenn keiner
DutyCycle = 1; 
% QC - log-path
qc_path = 'X:\Meereskunde\Unterwasserschall\AMSO23\NORDSEE\ES1\QC\';
%% 
if DutyCycle ==0
    prompt = 'Es wird alle ... Minuten gemessen ?';
    DutyCycleAbstand = minutes(input(prompt));
    prompt = 'Eine Aufnahme dauert ... Minuten ?';
    DutyCycleDauer = minutes(input(prompt));
end
%% QC_Log erstellen
QClog=[qc_path 'Logs\' Station '_' Jahr '_' Monat '_' 'qclog.tex'];
QClog_ordner = [qc_path 'Logs\'];
mkdir(QClog_ordner);
% falls QC bereits vorhanden
% l�schen:
if isfile(QClog)
     delete(QClog);
end

%% Ab hier alles automatisch
%% Scan durch angegebenen Ordner
flist = dir([path '*.wav']);
%% Initialisieren von Variablen

Q_01(1:length(flist)) = NaN; % cannot read file
Q_02(1:length(flist)) = NaN; % before deployment
Q_03(1:length(flist)) = NaN; % after recovery
Q_04(1:length(flist)) = NaN; % samplerate differs from other recordings
Q_05(1:length(flist)) = NaN; % too much clipping
Q_06(1:length(flist)) = NaN; % file length longer than other recordings (>1%)
Q_07(1:length(flist)) = NaN; % file length shorter than other recordings (>1%)
Q_08(1:length(flist)) = NaN; % DC-Offset
Q_09(1:length(flist)) = NaN; % filesize differs from other recordings
Q_10(1:length(flist)) = NaN; % rms differs from other recordings
Q_11(1:length(flist)) = NaN; % gap between recordings
Q_12(1:length(flist)) = NaN; % time in filename not plausible
Q_13(1:length(flist)) = NaN; % check if data is stationary
Q_14(1:length(flist)) = NaN; % all is good
data = cell(1,length(flist));
sr(1:length(flist))=NaN;
duration(1:length(flist))=NaN;
ts(1:length(flist))=NaN;
stdrms(1:length(flist))=NaN;
meanv(1:length(flist))=NaN;
ftime(1:length(flist))=NaT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Performance of Quality Checks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Get sample rate from first file
filesr = audioinfo([path flist(1).name]).SampleRate;
% Get duration from first file
if filedur_inp == 0
    filedur = audioinfo([path flist(1).name]).Duration;
end
% Get file size from first file
filesize = flist(1).bytes;

progressbar
for kk = 1:length(flist)
    
    %% read timestamp from filename
    ftime(kk) = datetime(flist(kk).name(6:end-4),'InputFormat','yyMMddHHmmss');
    
    %% QC_01: Check if .wav file can be read by Matlab (audioread)
    
    % data and info from file are loaded into workspace
%     [Q_01(kk),~,~,~,~,~,~] = Q01(flist(kk).name,path);
    [Q_01(kk),data,sr(kk),duration(kk),ts(kk),stdrms(kk),meanv(kk)] = Q01(flist(kk).name,path);

    % if file not readable go to next file - no need for further QCs
    if Q_01(kk) == 0
        
    %% QC_02: Check if recording is before deployment
    Q_02(kk) = Q02(flist(kk).name,path,ftime(kk),DateDeployment);
    
    %% QC_03: Check if recording is after recovery
    Q_03(kk) = Q03(flist(kk).name,path,ftime(kk),DateRecovery);
    
    %% QC_04: Check if sample rate stays constant
    Q_04(kk) = Q04(flist(kk).name,path,sr(kk),filesr);
    
    %% QC_05: Check if more than 0.1% of the data are clipped
    Q_05(kk) = Q05(flist(kk).name,path,data,0.1);
    
    %% QC_06: Check if duration is longer than - is performed after loop
    Q_06(kk) = Q06(flist(kk).name,path,duration(kk),filedur,0.01);
    
    %% QC_07: Check if duration is shorter - is performed after loop
    Q_07(kk) = Q07(flist(kk).name,path,duration(kk),filedur,0.01);
    
    %% QC_08: Check if recording suffers from DC-offset :(
    Q_08(kk) = Q08(flist(kk).name,path,meanv(kk),0.01);
    
    %% QC_09: Check if file size differs from size of first file
    Q_09(kk) = Q09(flist(kk).name,path,flist(kk).bytes,filesize,1);
    
    %% QC_10: Check if rms differs significantly in recordings - plot - limits
    
    %% QC_11: Check for gap between recordings
    if kk==1
        Q_11(kk) = Q11(flist(kk).name,path,[],flist(kk+1).name,filedur,0.01,1);
    elseif kk==length(flist)
        Q_11(kk) = Q11(flist(kk).name,path,flist(kk-1).name,[],filedur,0.01,2);
    else
        Q_11(kk) = Q11(flist(kk).name,path,flist(kk-1).name,flist(kk+1).name,filedur,0.01,3);
    end
    
    %% QC_12: Check if time in filename is plausible
    Q_12(kk) = Q12(flist(kk).name);
    
    %% QC_13: Check if data is stationary
    Q_13(kk) = Q13(data,sr(kk),60);
    
    %% QC_14: Check if everything is okay is performed after QC_10 and is 
    % therefore outside the loop 
    clear data
    
    else
        Q_02(kk)=0;Q_03(kk)=0;Q_04(kk)=0;Q_05(kk)=0;Q_06(kk)=0;Q_07(kk)=0; ...
            Q_08(kk)=0;Q_09(kk)=0;Q_10(kk)=0;Q_11(kk)=0;Q_12(kk)=0;Q_13(kk)=0;
    end
    progressbar(kk/length(flist))
end
    %% QC_10: Check if rms differs significantly in recordings - plot - limits
    Q_10 = Q10(stdrms,2);
    
    %% QC_14: Check if everything is okay is performed after QC_10 and is 
    Q_14 = Q14([Q_01;Q_02;Q_03;Q_04;Q_05;Q_06;Q_07;Q_08;Q_09;Q_10;Q_11;Q_12;Q_13]')
 
%% Check if no NaNs remain in QC Matrix    
QC = [Q_01;Q_02;Q_03;Q_04;Q_05;Q_06;Q_07;Q_08;Q_09;Q_10;Q_11;Q_12;Q_13;Q_14]'




    
    % check if no NANS !
    
    
    
    
    
    
    
%     elseif info.SampleRate ~= SollSampleRate
%         disp(['Samplerate hat sich ge�ndert auf: ' num2str(info.SampleRate)])
%         movefile(flist(kk).name, ['NoRealData4_' flist(kk).name]);
%         fprintf(fileID,'%s \n', [file  '|      Yes     |    4     ']);
%         Q_4 = [Q_4 + 1];
%     elseif AnteilClippedSamples > 0.1
%         disp([num2str(AnteilClippedSamples)  ' % clipped'])
%         movefile(flist(kk).name, ['NoRealData5_' flist(kk).name]);
%         fprintf(fileID,'%s \n', [file  '|      Yes     |    5     ']);
%         Q_5 = [Q_5 + 1];
%     elseif info.Duration <  10800 * 0.999    % 1 zu kurz
%         disp('File ist zu kurz')
%         movefile(flist(kk).name, ['NoRealData6_' flist(kk).name]);
%         fprintf(fileID,'%s \n', [file  '|      Yes     |    6     ']);
%         Q_6 = [Q_6 + 1];
%     elseif info.Duration >  SollDauer * 1.001    % 1% zu kurz
%         disp('File ist zu lang')
%         movefile(flist(kk).name, ['NoRealData7_' flist(kk).name]);
%         fprintf(fileID,'%s \n', [file  '|      Yes     |    7     ']);
%         Q_7 = [Q_7 + 1];
%     elseif abs(MW) > 0.01
%         disp('DC- Offset ist gr��er als 1%')
%         movefile(flist(kk).name, ['NoRealData8_' flist(kk).name]);
%         fprintf(fileID,'%s \n', [file  '|      Yes     |    7     ']);
%         Q_8 = [Q_8 + 1];
%     else
%         disp('Alles gut')
%         fprintf(fileID,'%s \n', [file  '|      No     |    1     ']);
%         Q_1 = [Q_1 + 1];
%     end
% fprintf(fileID,'%s \n','--------------------------------------------------------------');       
% 
%         
%         
%         
% end
% %% Vergleich Soll und Ist der File-Anzahl
% dir([path '*.wav']);
% AnzahlKomplett = length(flist);
% AnzahlNoRealFiles = length(dir([path 'NoReal']));
% AnzahlRealFiles = AnzahlKomplett - AnzahlNoRealFiles;
% disp(['Es sind insgesamt' num2str(AnzahlRealFiles) 'vorhanden.'])
% fprintf(fileID,'%s \n',['Es sind insgesamt' num2str(AnzahlRealFiles) 'vorhanden.']);
% WunschAnzahlMessungen = floor((DateRecovery - DateDeployment)/seconds(SollDauer));
% disp(['Es sollten aber' num2str(WunschAnzahlMessungen) 'vorhanden sein.'])
% fprintf(fileID,'%s \n',['Es sollten aber' num2str(WunschAnzahlMessungen) 'vorhanden sein.']);
% Differenz_files = WunschAnzahlMessungen - AnzahlRealFiles;
% disp(['Die Differenz betr�gt also' num2str(Differenz_files) 'files'])
% fprintf(fileID,'%s \n \n \n \n',['Die Differenz betr�gt also' num2str(Differenz_files) 'files']);
% 
% 
% %% Write output to pdf
% fname=mfilename();
% completepath=mfilename('fullpath');
% mpath=completepath(1:end-numel(fname));
% doktitle= ['Quality Check von ' Station ';ausgebracht im: ' Monat '/' Jahr];
% dokauthor = getenv('username');
% texfile = QClog;
% %%%% HEADER
% R2L_writeheader(texfile,doktitle,dokauthor); %ohne glossary entries
% %%%%%%%%%
% % R2L_Append2TexOutput(texfile,{'\vspace*{3cm}'})
% R2L_Append2TexOutput(texfile,{'\maketitle'})
% R2L_Append2TexOutput(texfile,{'\thispagestyle{fancy}'})
% 
% %%%% TOC
% newcell={...
%     '\newpage';...
% % 	'\tableofcontents';...
% % 	'\cleardoublepage';...
%     };
% R2L_Append2TexOutput(texfile,newcell);
%     
% %% Das muss jetzt als celle geschrieben werden
% newcell={...
%     '\chapter*{\"Ubersicht}';...
%     '';...
%     ['Benutzer: ' getenv('username') '\\'];...
%     ['VC: ' getenv('computername') '\\'];...
%     ['Datum: ' date '\\'];...
%     ['Zusammenfassung des Quality Checks f�r die Station ' Station ' ;Ausbringung im ' Monat '/' Jahr '\\'];...
%     'Protokoll des Qualit�tschecks \\';...
%     '\newline';...
%     '\newline';...
%     '\newline';...
%     'Qualit�tslegende: \\';...
%     '1: Gut \\';...
%     '2: Aussortiert - vor Deployment \\';...
%     '3: Aussortiert - nach Recovery \\';...
%     '4: Aussortiert - samplerate zu niedrig \\';...
%     '5: Aussortiert - Anteil geclippter Daten zu hoch \\';...
%     '6: Aussortiert - File ist 1\% k�rzer als Solll�nge \\';...
%     '7: Aussortiert - File ist 1\% l�nger als Solll�nge \\';...
%     '8: Aussortiert - DC - Offset \\';...
%     '9: Aussortiert - file nicht lesbar \\';...
%     '\vspace{2cm}';...
%    
% 
%     };
%     R2L_Append2TexOutput(texfile,newcell);
% 
%     
%     
% 
% %% WEGSCHREIBEN
% [linos,line]=R2L_GetTexFromComment([],mfilename('fullpath'));
% % % % % % \newpage
% % % % % % \chapter{Ergebnis}
% % % % % % \begin{table}[h!]
% % % % % %   \begin{center}
% % % % % %     \caption{Zusammenfassung des QC-Scans.}
% % % % % %     \label{tab:table1}
% % % % % %     \begin{tabular}{l|c|c} % <-- Alignments: 1st column left, 2nd middle and 3rd right, with vertical lines in between
% % % % % %       \textbf{Filename} & \textbf{aussortiert ?} & \textbf{Quality Flag}\\
% % % % % %       \hline
% [linos,line]=R2L_GetTexFromComment(linos,mfilename('fullpath'));
% R2L_Append2TexOutput(texfile,line);    
% 
% 
% 
% 
% 
% 
% 
% 
% 
% %% Tabelle beenden
% [linos,line]=R2L_GetTexFromComment([],mfilename('fullpath'));
% % % % % %     \end{tabular}
% % % % % %   \end{center}
% % % % % % \end{table}
% [linos,line]=R2L_GetTexFromComment(linos,mfilename('fullpath'));
% R2L_Append2TexOutput(texfile,line);
%     
% %%%%% Close the document
% R2L_Append2TexOutput(texfile,{'\end{document}'})
% %%%%% NOW COMPILE THE DOCUMENT
% cd(QClog_ordner)
% 
% R2L_compile(texfile)
% %% Im Logordner alles au�er das .pdf l�schen
% filelist = dir(QClog_ordner);
% for ii = 3:length(filelist)
%     name = filelist(ii).name;
%     if name(end)~='f'
%         delete([QClog_ordner name])
%     end
% end
%         
% 
%         
%   
% 
