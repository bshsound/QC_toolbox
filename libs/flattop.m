function [window_type] = flattop(window_length)
% coefficients of flattop window
a0=1; a1=1.93; a2=1.29; a3=0.388; a4=0.032;

N = window_length;
for n=1:N;
    window_type(n) = a0 - a1.*cos((2.*pi.*n)/(N-1))...
              + a2.*cos((4.*pi.*n)/(N-1))...
              - a3.*cos((6.*pi.*n)/(N-1))...
              + a4.*cos((8.*pi.*n)/(N-1));
end