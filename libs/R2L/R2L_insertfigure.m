function [outcode]=R2L_insertfigure(hplo,path,capstr,printargs,modstr,ploop)
% THIS IS PART OF REPORT2LATEX (R2L)
% 
% INPUTS:
% hplo      : figure handle of the figure that shall be inserted
% path      : path to the .m or .tex file - a new folder named ...\R2Lfigures\ will be created here
% capstr    : the caption that is used in latex [LATEX]
% printargs : print arguments like -painters, -opengl or -r300
% modstr  : modification string [LaTeX] - e.g. width=\textwidth
% ploop   : placement option [LaTeX] - e.g. h!,h,b,t,p
% 
% OUTPUTS:
% OUTCODE   : cell that contains LATEX code to impletement the figure with matlab handle hplo
% 
% Jahn Ruehrig 2017


if nargin<4
    printargs='';
    ploop='!ht';
    modstr='width=\textwidth';  
elseif nargin<5
    ploop='!ht';
    modstr='width=\textwidth';
elseif nargin<6
    ploop='!ht';
end

n1=get(hplo,'Number');
figname=strcat('fig_',num2str(n1));

figpath=strcat(path,'R2Lfigures\',figname,'.pdf');
figpath2=strcat('R2Lfigures/',figname,'.pdf');   % LATEX uses Linux separators /
figlabel=strcat('fig:',num2str(n1));


%% print the figure
if ~(exist(strcat(path,'R2Lfigures\'),'dir'))
    mkdir(strcat(path,'R2Lfigures\'));
end
print(hplo,'-dpdf',figpath,printargs);


%% create LATEX code
outcode={strcat('\begin{figure}[',ploop,']');...
strcat('\centering\includegraphics[',modstr,']{',figpath2,'}');...
strcat('\caption{',capstr,'}');...
strcat('\label{',figlabel,'}');...
'\end{figure}';...
};