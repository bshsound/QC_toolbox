%% function, that writes qc results to pdf

function [log] = qc2pdf(QC,duration,meanv,sr,stdrms,ts,ftime,path,qc_path,station,DateD,DateR,filedur,interval)
    %% add path to R2L toolbox
    addpath('.\libs\R2L');

    %% Create QC-log file .tex
    yy = num2str(year(DateD));
    mm = num2str(month(DateD),'%02d');
    QClog=[qc_path 'Logs\' station '_' yy '_' mm '_' 'qclog.tex'];
    QC_mat_folder = [qc_path 'mat_files\'];
    QClog_ordner = [qc_path 'Logs\'];
    Transferlog_ordner = [qc_path 'Transferlog\'];
    mkdir(QClog_ordner);
    mkdir(QC_mat_folder);
    mkdir(Transferlog_ordner);
    
    %% delete QClog if file of same name already exists
    if isfile(QClog)
         delete(QClog);
    end
    
    
    %% Write output to pdf
    doktitle= ['Quality Check of ' station ' deployed in: ' mm '/' yy];
    dokauthor = getenv('username');
    texfile = QClog;
    %%%% HEADER
    R2L_writeheader2(texfile,doktitle,dokauthor); %without glossary entries
    %%%%%%%%%


    %% Write everythin as cell and append to texfile
    newcell={...
        'The quality of all files is checked in a number of ways. The quality parameters and their corresponding flag numbers are listed below. Eventually the suffixes of corrupted files are changed to .wavx. wavx files are still readable, but are no longer recognized by BSoundH.'
        '\begin{enumerate}';...
        '\item the .wav file cannot be read';... 
        '\item file was recorded before deployment to water';... 
        '\item file was recorded after recovery from water';... 
        '\item samplerates varies from target samplerate ';... 
        '\item more than 0.1\% of the recording is clipped';... 
        '\item file length longer than other recordings (>1\%)';... 
        '\item file length shorter than other recordings (>1\%)';... 
        '\item DC-Offset';... 
        '\item file size differs from other recordings';... 
        '\item rms differs from other recordings';... 
        '\item gap between recordings';... 
        '\item time in filename not plausible';... 
        '\item data is stationary';... 
        '\item all is good';... 
        '\end{enumerate}';...
        };
        R2L_Append2TexOutput(texfile,newcell);
        
        flist = dir([path '*.wav']);
        %% calculate Target Number of files
        if interval > 0
            TarFileNo = (seconds(DateR-DateD)/interval);
        else
            TarFileNo = (seconds(DateR-DateD)/filedur);
        end
        
        %%
        GoodFiles = length(find(QC(:,14)==1));
        
    newcell={...
%         '\newpage';...
        '\section{Results}';...
        ['In total ', num2str(length(flist)) ' files were scanned, which took ', datestr(datenum(0,0,0,0,0,toc),'HH:MM:SS') '.'];...
        %% Wieviele files sollten zwischen deployment und recovery liegen
        ['With file lengths of ', num2str(filedur) ' seconds and a Duty Cycle of ' num2str(interval) ' seconds, it is expected, that ', num2str(floor(TarFileNo)) ' files were recorded between ', datestr(DateD), ' and ', datestr(DateR), '.' ];...
        [num2str(GoodFiles) ' were found to be flawless.'];...
        ['Thus, the difference of expected recordings and actual flawless recordings results to ',num2str(floor(GoodFiles - TarFileNo)+1),'.'];...
        [num2str(length(QC)-sum(QC(:,14))) ' files were discarded and are flagged as .wavx and are no longer readable by BSoundH (but by everything else ...).'];...
        };
        R2L_Append2TexOutput(texfile,newcell);
        
%         figure('Renderer', 'painters', 'Position', [200 200 1000 1900])
figure1 = figure(...
        'PaperType','a4letter',...
        'PaperOrientation','Portrait',...
        'PaperUnits','centimeters', ...
        'PaperPosition',[0.63 0.63 19.72 28.41],...    
        'PaperSize',[20.98 29.68],...
        'visible','on'); 
        subplot(4,2,1:2)
        bar(nansum(QC))
        grid on
        labels = {'QC1','QC2','QC3','QC4','QC5','QC6','QC7','QC8','QC9','QC10','QC11','QC12','QC13','QC14'};
        set(gca,'XTickLabel',labels)
        ylim([0 max(nansum(QC))+0.1*max(nansum(QC))])
        ylabel('no. of files')
        
        subplot(4,2,3)
        plot(duration)
        ylabel('duration [s]')
        xlabel('file no.')
        yline(filedur,'r--')
        ml = max([duration,filedur]);
        ylim([min(duration)-0.1*filedur ml+0.1*filedur])
        grid on
        
        subplot(4,2,4)
        plot(meanv)
        ylabel('mean signal')
        xlabel('file no.')
        yline(0,'r--')
        mil = min([meanv-0.001,0-0.001]);
        mal = max([meanv+0.001,0+0.001]);
        ylim([mil mal])
        grid on
        
        subplot(4,2,5)
        plot(sr)
        ylabel('samplerate [Hz]')
        xlabel('file no.')
        yline(sr(1),'r--')
        grid on
        
        subplot(4,2,6)
        plot(stdrms)
        ylabel('rms signal')
        xlabel('file no.')
        grid on
        
        subplot(4,2,7)
        co = [1,1,1;1,0,0;0,1,0];
        QC_tmp =QC;
        QC_tmp(:,14)=QC_tmp(:,14)*2;
        imagesc(QC_tmp')
        axis ij
        colormap(co)
        xlabel('file')
        ylabel('QC')
        yticks([1:14])
        grid on
        
                
        subplot(4,2,8)
        plot(ftime)
        xlabel('file no.')
        ylabel('time')
        grid on
        
        %% Export image
        figname = [qc_path '\Logs\1.png'];
        print(gcf,figname,'-dpng','-r300');
        savefig([qc_path 'mat_files\' station '_' yy '_' mm '_qc_plots.fig']);
        clf;
        
newcell={...
        '\newpage';...
        '\centering';...
        '\includegraphics[width=0.95\textwidth,height=0.95\textheight]{1.png}';...
        };
        R2L_Append2TexOutput(texfile,newcell);
        
newcell={...
        '\newpage';...
        '\small\addtolength{\tabcolsep}{-5pt}';...
        '\begin{tabularx}{\textwidth}{@{}C{3.5cm}|Y|Y|Y|Y|Y|Y|Y|Y|Y|Y|Y|Y|Y|Y@{}}';...
        '\textbf{Filename} & \textbf{Q1} & \textbf{Q2} & \textbf{Q3} & \textbf{Q4} & \textbf{Q5} & \textbf{Q6} & \textbf{Q7} & \textbf{Q8} & \textbf{Q9} & \textbf{Q10} & \textbf{Q11} & \textbf{Q12} & \textbf{Q13} & \textbf{Q14} \\ \hhline{=|=|=|=|=|=|=|=|=|=|=|=|=|=|=}';...
        '\endhead';...
        ['Total &' num2str(sum(QC(:,1))) '&' num2str(sum(QC(:,2))) '&' num2str(sum(QC(:,3))) '&' num2str(sum(QC(:,4))) '&' num2str(sum(QC(:,5))) '&' num2str(sum(QC(:,6))) '&' num2str(sum(QC(:,7))) '&' num2str(sum(QC(:,8))) '&' num2str(sum(QC(:,9))) '&' num2str(sum(QC(:,10))) '&' num2str(sum(QC(:,11))) '&' num2str(sum(QC(:,12))) '&' num2str(sum(QC(:,13))) '&' num2str(sum(QC(:,14))) '\\ \hline'];...
    };
    R2L_Append2TexOutput(texfile,newcell);  
    
for ii = 1:length(flist)
    for jj = 1:14
        if QC(ii,jj)==0
            a(jj) = '-';
        else
            a(jj) = 'x';
        end
    end
    if a(14) ~= 'x' % if - to get only files with flaws
    newcell={...    
    [flist(ii).name(1:3) '\' flist(ii).name(4:end) '&' a(1) '&' a(2) '&' a(3) '&' a(4) '&' a(5) '&' a(6) '&' a(7) '&' a(8) '&' a(9) '&' a(10) '&' a(11) '&' a(12) '&' a(13) '&' a(14) '\\ \hline'];...
    };
    R2L_Append2TexOutput(texfile,newcell);  
    end
    clear a
end
    
newcell={...     
        '\end{tabularx}';...
    };
    R2L_Append2TexOutput(texfile,newcell);    
        
        
        
        
    %%%%% Close the document
    R2L_Append2TexOutput(texfile,{'\end{document}'});
    %%%%% NOW COMPILE THE DOCUMENT
    currentFolder = pwd;
    cd(QClog_ordner);

    R2L_compile(texfile);
    cd(currentFolder);
    %% Im Logordner alles au�er das .pdf l�schen
    filelist = dir(QClog_ordner);
    for ii = 3:length(filelist)
        name = filelist(ii).name;
        if name(end)~='f'
            delete([QClog_ordner name]);
        end
    end
    %% Write variables to m folder
save([qc_path 'mat_files\' station '_' yy '_' mm '_qc_data.mat'],'DateD','DateR','duration','filedur','ftime','meanv','path','QC','sr','station','stdrms','ts');
log = [qc_path 'Logs\' station '_' yy '_' mm '_' 'qclog.pdf'];
end

