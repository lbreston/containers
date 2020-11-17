function out = fft_(obj)
dtemp=fftshift(winfft(obj.data,1));

dnames={'freq'};

dvals={linspace(-.5,.5,numel(obj.getdimvals("time")))*fs(obj)};

out=types.Spectrum(dtemp,dnames,dvals);

end