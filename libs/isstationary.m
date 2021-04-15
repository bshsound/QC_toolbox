%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               Signal stationarity test               %
%              with MATLAB Implementation              %
%                                                      %
% Author: Ph.D. Eng. Hristo Zhivomirov        03/19/20 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [mean_stat_flag, var_stat_flag, cov_stat_flag] = isstationary(x)

% function: [mean_stat_flag, var_stat_flag, cov_stat_flag] = isstationary(x)
%
% Input:
% x - signal in the time domain; x could be vector or 
%     matrix with time across columns and indexes across rows
%
% Output:
% mean_stat_flag - flag showing if the signal is mean-stationary 
% var_stat_flag - flag showing if the signal is variance-stationary 
% cov_stat_flag - flag showing if the signal is autocovariance-stationary 

% check the input
if ~isreal(x) || any(isinf(x)) || any(isnan(x)) || ischar(x)
    errordlg('The data must be real and finite!', 'Error!', 'modal')
    return
end

% set the significance level
alpha = 0.05;

% detrend the signal
x = detrend(x, 'linear');

% check if x is vector and if it 
% is, convet it to column-vector
if isvector(x)
    x = x(:);
end  

% make sure that size(x, 1) is even
if rem(size(x, 1), 2)
    x = x(1:end-1, :);
end

% convert x from matrix to cell-array columnwise (1-by-n)
x = num2cell(x, 1);

% split the signal into two equaly length parts
x = cellfun(@(x) reshape(x, length(x)/2, 2), ...
            x, 'UniformOutput', false);   
        
% test for first moment (i.e., mean) stationarity
% using Wilcoxon rank sum test (a.k.a. Mann-Whitney U-test)
[~, h] = cellfun(@(x) ranksum(x(:,1), x(:,2), 'alpha', alpha), ...
                 x, 'UniformOutput', true);
mean_stat_flag = ~h;        
          
% test for second moment (i.e., variance) stationarity
% using Brown-Forsythe test        
p = cellfun(@(x) vartestn(x, 'TestType', 'BrownForsythe', 'Display', 'off'), ...
            x, 'UniformOutput', true);
var_stat_flag = p > alpha;

% test for autocovariance stationarity
% using autocovariance euclidian distance comparison
eudist = cellfun(@(x) norm(xcov(x(:,1), 'coeff') - xcov(x(:,2), 'coeff')), ...
                 x, 'UniformOutput', true);     
cov_stat_flag = eudist < 1.5*sqrt(2);    

end