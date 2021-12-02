% QC_09: Check if file size differs from size of first file

function [flag] = Q09(filename,filepath,filesize,deplsize,limit)
        if abs(filesize*100/deplsize -100) > limit    
                flag = 1;
            else
                flag = 0;
        end
end