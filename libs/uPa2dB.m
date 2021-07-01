%function to convert from µPa to dB re 1µPa

function SPL = uPa2dB(x)
    SPL = 20*log10(x);
end
