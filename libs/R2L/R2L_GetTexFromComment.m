function [linos,line]=R2L_GetTexFromComment(linos,filename)
% THIS IS PART OF REPORT2LATEX (R2L)
% 
% INPUTS:
% linos      : line of code. Either empty or starting line. Will be handled automatically if the function is called twice.
% filename	 : complete path to the .m file that creates the .tex file.
% 
% OUTPUTS:
% linos		 : line of code
% line		 : code to add
% 
% FUNCTION:
% This function is one way to add LATEX code to a .tex file. 
% It excpects that LATEX code is commented out 5 times. 
% This function is handy, when large parts of code shall be added. 
% The function should be called twice. Once immediately before the code to add (C2A) and once directly after.
% The first time called the function just determines the initial line number of the code. 
% The second time called the function adds the C2A into the tex file.
% 
% Jahn Ruehrig 2017



if isempty(linos)
%     This is the first call of the function where it just gives back the
%     initial line of code - i.e. linos(1)
    currentLine = getLineInCode();
    linos=currentLine;
    line={''};
elseif numel(linos)==1
%     This is the second call of the function where it will get the Tex Code
    currentLine = getLineInCode();
    linos=[linos+1 currentLine-1];
    
    line=scantextfile(filename,linos);
    
else
   error('theres something wrong with the code line numbers') 
end









end


function currentLine = getLineInCode()
% This misuses dbstack to find the current line number in the code.
% It seems there is no better way to do this in MATLAB
    dbs  = dbstack;             % see MATLAB documentation
    currentLine = dbs(3).line;  % entry 3 is the code line of the initially calling fcn
end




function line=scantextfile(filename,linos)
  
  eln = [linos(1):linos(2)];  % 
  line = {};
  fid = fopen(strcat(filename,'.m'),'r');
  cnt=0;
  if (fid < 0) 
	printf('Error:could not open file\n')
  else
        n = 0; 
	while ~feof(fid),
              n = n + 1; 
              if min(n ~= eln), 
                    fgetl(fid);
              else
                    cnt=cnt+1;
                    tmpline = fgetl(fid);
                    if strcmp(tmpline(1:9),'% % % % %')  % make sure the line is commented 5 times
                    line{cnt} = tmpline(10:end);         % get rid of comments
                    else 
                        error('R2L expects Tex code to be commented 5 times.')
                    end
              end
	end;
        fclose(fid);
  end;
  line=line';


end