% Quality Check 14: Check sum of quality flags - files with 0 quality flags
% are assumed to be flawless and get assigned QC14 = 1 - all is good

function [flag] = Q14(QCs)
    flag(1:size(QCs,1)) = 1;
    flagsum = sum(QCs,2);
    [idx,~] = find(flagsum>0)
    flag(idx) = 0; % something is wrong
end
