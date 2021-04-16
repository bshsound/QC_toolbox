function R2L_Append2TexOutput(file,cell2add)
% THIS IS PART OF REPORT2LATEX (R2L)
% 
% INPUTS:
% file      : complete path to the tex file
% cell2add  : a cell that shall be added to the file
% 
% OUTPUTS:
% none
% 
% FUNCTION:
% This function adds content to the .tex file from MATLAB.
% 
% Jahn Ruehrig 2017

si=size(cell2add,1);

fid = fopen( file, 'a+' );

for cnt=1:si
    
    fprintf( fid, '%s \n', cell2add{cnt} );

end


fclose(fid);