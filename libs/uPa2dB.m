%function to convert from �Pa to dB re 1�Pa

function SPL = uPa2dB(x)
    SPL = 20*log10(x);
end
