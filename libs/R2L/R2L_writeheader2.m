function R2L_writeheader(texfile,doktitle,dokauthor,opt_addheader)
% THIS IS PART OF REPORT2LATEX (R2L)
% 
% INPUTS:
% texfile      : complete path to the .tex file
% doktitle     : Document title (will be displayed in LATEX document).
% dokauthor    : Author (will be displayed in LATEX document).
% opt_addheader: Optional/additional header Text
% 
% OUTPUTS:
% none
% 
% FUNCTION:
% This function writes a new .tex file and adds a header. 
% CAUTION: If the file already exists it will be rewritten!
% 
% Jahn Ruehrig 2017

if nargin<4
    opt_addheader='';
end

CA1={'\documentclass[a4paper]{article}';...
    '\usepackage[utf8]{inputenc}'; ...
    '\usepackage[T1]{fontenc}';...
    '\usepackage{graphicx}';...
    '\usepackage{fancyhdr}';...
    '\usepackage{array}';...
    '\usepackage[top=20mm, left=20mm, right=20mm, bottom=35mm]{geometry}';...
    '\usepackage{parskip}';...
    '\usepackage{tabularx}';...
    '\usepackage{titlesec}';...
    '\usepackage{float}';...
    '\usepackage{lmodern}';...
    '\usepackage{tikz}';...
    '\usepackage{enumitem}';...
    '\usepackage{changepage}';...
    
    %for table
    
    '\usepackage{mwe,showframe}';... 
    '\usepackage{ltablex}';...
    '\newcolumntype{C}[1]{>{\Centering}m{#1}}';... 
    '\renewcommand\tabularxcolumn[1]{C{#1}}';... 
    '\keepXColumns';... 
    '\usepackage{hhline}';...
    
    '\pagestyle{fancy}';...
    '\headheight 64pt';...
    '\headsep 20pt';...
    '\fancyhead[L]{\includegraphics[height=5\baselineskip]{X:/Meereskunde/Unterwasserschall/BSH-Interreg-JOMOPANS/30_Media/40_Logo/Partner/BSH-Logo_ohneBeschnitt.jpg}}';...
    ['\fancyhead[R]{\quad\\Quality Check Log\\',datestr(now) ,'\\\emph{QC for station ' ,doktitle(18:21), '\\}}'];...
    '\fancyfoot[C]{\thepage}';...
    
    '\newcolumntype{R}{>{\raggedleft\scshape\small\arraybackslash}X}';...
    '\newcolumntype{L}{>{\raggedright\scshape\small\arraybackslash}X}';...   
    '\newcolumntype{h}{>{\bfseries\raggedleft\arraybackslash}X}';...
    '\newcolumntype{v}{>{\bfseries\raggedright\arraybackslash}X}';...
    '\newcolumntype{Y}{>{\centering\arraybackslash}X}';...

    '\newenvironment{medlemmar}{';...
    '\begin{minipage}{\textwidth}';...
        '\centering';...
        ['\textsc{\Huge ' ,doktitle(1:21), '}\\[0.5cm]'];...
        ['\textsc{\huge ' ,doktitle(21:end),'}\\[2em]'];...
        % \vspace{1.5em}
        '\textsc{\textbf{Overview}}';...
        '\vspace{1em}';...
    '\end{minipage}';...
    '\tabularx{\textwidth}{RL}';...
'}{';...
    '\endtabularx';...
'}';...

'\begin{document}';...

'\begin{medlemmar}';...
    ['User:              & ', getenv('username'), '\\'];...
    ['VC:                & ', getenv('computername'), '\\'];...
    ['Date:              & ', date, '\\'];
'\end{medlemmar}';...

'\section{Legend of Quality Flags}'};


    
    
    
    
    
    
%     strcat('\title{',doktitle,'}');...
%     strcat('\author{',dokauthor,'}');...
%     '\date{\today}';...
%     '\usepackage[T1]{fontenc}';...
%     '\usepackage{fancyhdr, graphicx}';...
%     '\renewcommand{\headrulewidth}{0pt}';...
%     '\fancyhead[L]{}';...
%     '\fancyhead[R]{';...
%     '\includegraphics[width=4cm]{X:/Meereskunde/Unterwasserschall/BSH-Interreg-JOMOPANS/30_Media/40_Logo/Partner/BSH-Logo_ohneBeschnitt.jpg}';...
%     '}';...
%     '\usepackage[ansinew]{inputenc}';...
%     '\usepackage[a4paper]{geometry}';...
%     '\usepackage{graphicx}';...
%     '\usepackage{amsbsy}';...
%     '\usepackage{amstext}';...
%     '\usepackage[cmex10]{amsmath}';...
%     '\usepackage{array}';...
%     '\usepackage{longtable}';...
%     '\usepackage[nottoc,notlot,notlof]{tocbibind}';...
%     '\usepackage[bf]{caption}';...
%     '\usepackage{bigstrut}';...
%     '\usepackage{multirow}';...
%     '\usepackage[hang]{footmisc}';...
%     '\setlength{\footnotemargin}{0.4cm}';...
%     '\usepackage{float}';...
%     '\usepackage[table]{xcolor}';...
%     '\usepackage{setspace}';...
%     '\usepackage[section]{placeins}';...
%     '\usepackage{stfloats}';...
%     '\usepackage{tabularx}';...
%     '\usepackage{courier}';...
%     '\usepackage{listings}';...
%     '\pagestyle{plain}';...
%     '\usepackage[';...
%      'colorlinks=false,';...
%      'urlcolor=pdfurlcolor,';...
%      'filecolor=pdffilecolor,';...
%      'linkcolor=pdflinkcolor,';...
%      'raiselinks=true,';...
%      'breaklinks,';...
%      'backref=page,';...
%      'pagebackref=false,';...
%      'verbose,';...
%      'hyperindex=true,';...
%      'linktocpage=true,';...
%      'hyperfootnotes=false,';...
%      'bookmarks=true,';...
%      'bookmarksopen=true,';...
%      'bookmarksopenlevel=\maxdimen,';...
%      'bookmarksnumbered=true,';...
%      'bookmarkstype=toc,';...
%      'plainpages=false,';...
%      'pageanchor=true,';...
%      strcat('pdftitle=',doktitle,',');...
%      'pdfauthor=AUTHOR'  %      strcat('pdfauthor=',dokauthor,',');...
%      'pdfcreator={MATLAB},';...
%      'pdfstartview=Fit,';...
%      'pdfpagemode=UseOutlines,';...
%      'pdfpagelabels=true,';...
% %      'pdfpagelayout=TwoPageRight,';...
%      ']{hyperref}';...
%     '\usepackage{cite}';...
%     '\usepackage{tikz}';...
%     '\usepackage[toc,page]{appendix}';...
%     '\usepackage[ nonumberlist,acronym,toc,section]{glossaries}';...
%     '\makenoidxglossaries';...
%     '';
%     '%%%%%%% OPTIONAL HEADER %%%%%%%%%%%%%';
%     };
%     
% CA2={'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%';    
%     '\begin{document}';...
%     };


CA=[CA1];

    writeheader(texfile,CA);


end


function writeheader(texfile,CA)
%% WRITE THE HEADER TO A TEX FILE DELETING EVERYTHING THAT WAS THERE BEFORE

si=size(CA,1);

fid = fopen( texfile, 'wt' );
% fid = fopen( 'test.tex', 'a+' );

for cnt=1:si
    
    fprintf( fid, '%s \n', CA{cnt} );

end

fclose(fid);

end






