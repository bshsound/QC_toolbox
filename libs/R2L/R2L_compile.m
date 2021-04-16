function R2L_compile(texfilename)
% THIS IS PART OF REPORT2LATEX (R2L)
% 
% INPUTS:
% texfilename      : figure handle of the figure that shall be inserted
% 
% OUTPUTS:
% none
% 
% FUNCTION:
% This function compiles a .tex file from MATLAB.
% Running pdflatex twice to make sure everything is there (glassaries and TOC).
% If you use bibtex you may add bibtex and run
% pdflatex-->bibtex-->pdflatex-->bibtex-->pdflatex to be sure that every
% 
% Jahn Ruehrig 2017

% cd('X:\Meereskunde\Unterwasserschall\HDF5_Testdaten_Skripte\Skripte\Matlabskripte\R2L\')


pdflatexpath='C:\miktex-portable\texmfs\install\miktex\bin\x64\pdflatex.exe  ';
pdflatexarguments='-max-print-line=120 -interaction=nonstopmode  ';

system([pdflatexpath, pdflatexarguments, texfilename])
system([pdflatexpath, pdflatexarguments, texfilename])

