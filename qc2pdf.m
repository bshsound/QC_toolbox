%% function, that writes qc results to pdf
function [] = qc2pdf(QC,duration,meanv,sr,stdrms,ts,ftime,path,qc_path,station,DateDeployment)
    %% add path to R2L toolbox
    addpath('.\libs\R2L');

    %% Create QC-log file .tex
    yy = num2str(year(DateDeployment));
    mm = num2str(month(DateDeployment),'%02d');
    QClog=[qc_path 'Logs\' station '_' yy '_' mm '_' 'qclog.tex'];
    QClog_ordner = [qc_path 'Logs\'];
    mkdir(QClog_ordner);
    %% delete QClog if file of same name already exists
    if isfile(QClog)
         delete(QClog);
    end
    
    
    %% Write output to pdf
    doktitle= ['Quality Check of ' station ';deployed in: ' mm '/' yy];
    dokauthor = getenv('username');
    texfile = QClog;
    %%%% HEADER
    R2L_writeheader(texfile,doktitle,dokauthor); %without glossary entries
    %%%%%%%%%
    % R2L_Append2TexOutput(texfile,{'\vspace*{3cm}'})
    R2L_Append2TexOutput(texfile,{'\maketitle'});
    R2L_Append2TexOutput(texfile,{'\thispagestyle{fancy}'});

    newcell={...
        '\newpage';...
    % 	'\tableofcontents';...
    % 	'\cleardoublepage';...
        };
    R2L_Append2TexOutput(texfile,newcell);

    %% Write everythin as cell and append to texfile
    newcell={...
        '\chapter*{\"Overview}';...
        '';...
        ['User: ' getenv('username') '\\'];...
        ['VC: ' getenv('computername') '\\'];...
        ['Date: ' date '\\'];...
        ['Log file of Quality Checks for station ' station ' ;deployed in ' mm '/' yy '\\'];...
        'Log of performed Quality Checks \\';...
        '\newline';...
        '\newline';...
        '\newline';...
        'Legend of Quality Flags: \\';...
        '1: Gut \\';...
        '2: Aussortiert - vor Deployment \\';...
        '3: Aussortiert - nach Recovery \\';...
        '4: Aussortiert - samplerate zu niedrig \\';...
        '5: Aussortiert - Anteil geclippter Daten zu hoch \\';...
        '6: Aussortiert - File ist 1\% kürzer als Solllänge \\';...
        '7: Aussortiert - File ist 1\% länger als Solllänge \\';...
        '8: Aussortiert - DC - Offset \\';...
        '9: Aussortiert - file nicht lesbar \\';...
        '\vspace{2cm}';...


        };
        R2L_Append2TexOutput(texfile,newcell);




    %% 
    [linos,line]=R2L_GetTexFromComment([],mfilename('fullpath'));
    % % % % % \newpage
    % % % % % \chapter{Ergebnis}
    % % % % % \begin{table}[h!]
    % % % % %   \begin{center}
    % % % % %     \caption{Zusammenfassung des QC-Scans.}
    % % % % %     \label{tab:table1}
    % % % % %     \begin{tabular}{l|c|c} % <-- Alignments: 1st column left, 2nd middle and 3rd right, with vertical lines in between
    % % % % %       \textbf{Filename} & \textbf{aussortiert ?} & \textbf{Quality Flag}\\
    % % % % %       \hline
    R2L_Append2TexOutput(texfile,line);    









    %% Tabelle beenden
    [linos,line]=R2L_GetTexFromComment([],mfilename('fullpath'));
    % % % % %     \end{tabular}
    % % % % %   \end{center}
    % % % % % \end{table}
    R2L_Append2TexOutput(texfile,line);

    %%%%% Close the document
    R2L_Append2TexOutput(texfile,{'\end{document}'});
    %%%%% NOW COMPILE THE DOCUMENT
    cd(QClog_ordner)

    R2L_compile(texfile);
    %% Im Logordner alles außer das .pdf löschen
    filelist = dir(QClog_ordner);
    for ii = 3:length(filelist)
        name = filelist(ii).name;
        if name(end)~='f'
            delete([QClog_ordner name]);
        end
    end
















end